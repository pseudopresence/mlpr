% clc;
% close all;
% clear all;
% 
% tic;
% Data = load('imdata.mat');
% Data.x = double(Data.x);
% Data.y = double(Data.y);
% Data.i = double(Data.i);
% toc;
% 
% imgPatch = @(i) reshape([Data.x(i,:) zeros(1,18)],35,30)'/63;
% imgPatchD = @(x) reshape([x zeros(1,18)],35,30)'/63;
% 
% imshow(imgPatch(125));
% colormap('gray');
% 
%% Q1a
% tic;
% [Mu, E, Lambda, P] = getEigenvectors(Data.x);
% toc;
% figure(1);
% plot(Lambda(1:30));
% figure(2);
% subplot(2, 2, 1);
% imagesc(imgPatchD(Mu'));
% axis('square');
% subplot(2, 2, 2);
% imagesc(imgPatchD(E(:, 1)'));
% axis('square');
% subplot(2, 2, 3);
% imagesc(imgPatchD(E(:, 2)'));
% axis('square');
% subplot(2, 2, 4);
% imagesc(imgPatchD(E(:, 3)'));
% axis('square');
% 
%% Q1b
% 
% tic;
% ProjectedX = projectSequence(Mu, E, Data.x, 3);
% toc;
% tic;
% ReconstructedX = ProjectedX * E(:, 1:3)';
% toc;
% ErrorsX = mean((Data.x - ReconstructedX).^2, 2);
% [Dummy MaxI] = max(ErrorsX);
% imshow(imgPatch(MaxI));
% colormap('gray');
%% Q1c

H = hist(Data.y, 64);
plot(H);
% Bimodal with the second mode being pretty small; looks like underlying
% unimodal with saturation at 63.

%% Q1d

D = Data.y - Data.x(:, end);
[H2, X2] = hist(D, 64);
plot(X2, H2);