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

%% Q2c

H = hist(Data.y, 64);
figure();
plot(H);
writeFigureEPS('Q2c-hist.eps');
close;
% Bimodal with the second mode being pretty small; looks like underlying
% unimodal with saturation at 63.

%% Q2d
% 
D = Data.y - Data.x(:, end);
[H2, X2] = hist(D, 64);
figure();
plot(X2, H2);
writeFigureEPS('Q2d-hist.eps');
close;

%% Q3a
SubSetX = [Data.x(:, end), Data.x(:, end - 34), Data.x(:, end - 35)];
% TODO
% 64 * 64 * 3 entries in matrix, only 100000 instances -> small number of
% instances for each parameter to be learned?

%% Q3b

%% End
fprintf('Done.\n');
end
