%BOOTSTRAP
clear all;
warning('off','all');

% optional parameters
dim = 3;							% space
N = 80;								% number of points
e = 0.15;							% percentage of contamination
name = strcat('N',int2str(N),'D',int2str(dim),'Boot.txt');	% name of output file
nor = 50;							% number of bootstrap samples

% parameters for fastLTS method
options.intercept = 0;
options.alpha = 0.75;
options.ntrial = 500;

data = zeros(N, dim+1);
vysledekBootstrap = zeros(2*10, dim);
tic
for k = 1:10
    % Data creation
    
    data(:, 2) = 400*rand(N,1) - 200;
    data(:, 3) = 400*rand(N,1) - 200;
    data(:, dim+1) = 1;
    ii = rand(N, 1);
    i1 = find(ii < e);
    data(i1, 1) = 50*(rand(length(i1), 1) - 0.5);
    i2 = find(ii >= e);
    data(i2, 1) = 10*(rand()-0.5)*data(i2, 3) + 10*(rand()-0.5)*data(i2, 2) - 400*(rand()-0.5) + 50*(rand(length(i2),1)-0.5);
    
    % Bootstrap
    
    vysledkyLWS = zeros(dim, nor);
    vysledkyLTS = zeros(dim, nor);

    for i=1:nor
        A = data(randi([1 N],1,N), :);
        vysledkyLWS(:, i) = lwsCheck(A);
        ltsFit = fastlts(A(:, 2:dim+1), A(:, 1), options);
        vysledkyLTS(:, i) = ltsFit.coefficients;
    end

    lwsSum = mean(vysledkyLWS, 2);
    ltsSum = mean(vysledkyLTS, 2);

    lwsCov = zeros(dim, dim);
    ltsCov = zeros(dim, dim);

    for i=1:nor
        lwsCov = lwsCov + (vysledkyLWS(:, i) - lwsSum)*(vysledkyLWS(:, i) - lwsSum)'/nor;
        ltsCov = ltsCov + (vysledkyLTS(:, i) - ltsSum)*(vysledkyLTS(:, i) - ltsSum)'/nor;
    end
    
    vysledekBootstrap(2*k-1, :) = diag(lwsCov)';
    vysledekBootstrap(2*k, :) = diag(ltsCov)';
    
    det(lwsCov)
    det(ltsCov)
    k
end
toc

save(name, 'vysledekBootstrap', '-ascii', '-tabs');
