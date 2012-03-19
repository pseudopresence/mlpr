%% Housekeeping
clc;
close all;
clear all;
dbstop if error;
dbstop if naninf;

%% Load data
fprintf('Loading data...'); tic;
Data = load('imdata.mat');
Data.x = double(Data.x);
Data.y = double(Data.y);
Data.i = double(Data.i);
TestData = load('imtestdata.mat');
TestData.x = double(TestData.x);
TestData.i = double(TestData.i);
[NInstances NFeatures] = size(Data.x);
fprintf('Done.\n'); toc;
%% Q1
% No code

%% Q2
[Mu, E] = q2(Data);

%% Q3
q3(Data);

%% Q4
q4(Data, Mu, E);

%% Q5
q5(Data);

%% End
fprintf('Done.\n');
