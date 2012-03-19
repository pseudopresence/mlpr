function main()
%% Housekeeping
clc;
close all;
clear all;
dbstop if error;
dbstop if naninf;

%% Load data
fprintf('Loading data...\n');
tic;
Data = load('imdata.mat');
Data.x = double(Data.x);
Data.y = double(Data.y);
Data.i = double(Data.i);
% TestData = load('imtestdata.mat');
% TestData.x = double(TestData.x);
% TestData.i = double(TestData.i);
[NInstances NFeatures] = size(Data.x);
toc;

%% Visualisation functions
imgPatchD = @(X) reshape([X zeros(1,18)],35,30)'/63;
imgPatch = @(I) imgPatchD(Data.x(I,:));

%% Q1
% No code

%% Q2a
fprintf('[Q2a] Computing Eigenvectors...\n');
tic;
[Mu, E, Lambda, P] = getEigenvectors(Data.x);
toc;
% Display Eigenvalues
% figure();
% plot(Lambda(1:30));

fprintf('[Q2a] Producing figures...\n');
figurePatch(imgPatchD(Mu'));
writeFigureEPS('Q2a-mean.eps');
close;

figureEig(imgPatchD(E(:, 1)'));
writeFigureEPS('Q2a-eig1.eps');
close;

figureEig(imgPatchD(E(:, 2)'));
writeFigureEPS('Q2a-eig2.eps');
close;

figureEig(imgPatchD(E(:, 3)'));
writeFigureEPS('Q2a-eig3.eps');
close;

%% Q2b

fprintf('[Q2b] Projecting patches...\n');
tic;
ProjectedX = projectSequence(Mu, E, Data.x, 3);
toc;

fprintf('[Q2b] Reconstructing patches...\n');
tic;
ReconstructedX = ProjectedX * E(:, 1:3)';
toc;

fprintf('[Q2b] Computing error...\n');
tic;
ErrorsX = mean((Data.x - ReconstructedX).^2, 2);
[Dummy MaxI] = max(ErrorsX);
toc;

fprintf('[Q2b] Producing figures...\n');
figurePatch(imgPatch(MaxI));
writeFigureEPS('Q2b-patch.eps');
close;
figurePatch(imgPatchD(ReconstructedX(MaxI, :)));
writeFigureEPS('Q2b-reconstructed.eps');
close;

%% Q2c

CountsY = hist(Data.y, 0:63);
figure();
bar(CountsY, 'hist');
writeFigureEPS('Q2c-hist.eps');
close;
% Bimodal with the second mode being pretty small; looks like underlying
% unimodal with saturation at 63.

%% Q2d
% 
D = Data.y - Data.x(:, end);
[H2, X2] = hist(D, min(D):max(D));
figure();
bar(X2, H2, 'hist');
writeFigureEPS('Q2d-hist.eps');
close;

%% Q3a
tic;
SubSetX = [Data.x(:, end), Data.x(:, end - 34), Data.x(:, end - 35)];
% TODO
% 64 * 64 * 3 entries in matrix, only 100000 instances -> small number of
% instances for each parameter to be learned?
% Supervised learning problem: Predict y given x
% treating y, x as discrete => classification problem
% Using Naive bayes model
% Modelling P(x|y)
% Naive bayes assumption: P(x|y) = P(x1|y)P(x2|y)P(x3|y)
% Represent P(x1|y) as a matrix
% Maximum likelihood solution:
% P(x1|y) = CountX1Y(x1, y)/Count(y)
% P(y) = CountY(y)/TotY
Results = crossValidation(Data.y, SubSetX, 4, @trainAndTestNB);
Probs = reshape(cell2mat(Results), NInstances, 1);
Perplexity = perplexity(Probs);
% No idea if this is right.
toc;



%% Q3b
% Results = crossValidation(Data.y, SubSetX, 4, @trainAndTestDir);
% Probs = reshape(cell2mat(Results), NInstances, 1);
% Perplexity = perplexity(Probs);
% i)
disp(Perplexity);
% ii)
% Figures generated in trainAndTestNB.
% iii)
% No code
% iv)
% No code

%% Q4a
%% Q4b
%% Q4c
% No code
%% End
fprintf('Done.\n');
end
