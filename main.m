clc;
close all;
clear all;

Data = load('imdata.mat');
Data.x = double(Data.x);
Data.y = double(Data.y);
Data.i = double(Data.i);

imgPatch = @(i) reshape([Data.x(i,:) zeros(1,18)],35,30)'/63;
imgPatchD = @(x) reshape([x zeros(1,18)],35,30)'/63;

% imshow(imgPatch(125));
% colormap('gray');

[Mu, E, Lambda, P] = getEigenvectors(Data.x);
plot(Lambda(1:30));
imagesc(imgPatchD(E(:, 8)'));
% colormap('gray');