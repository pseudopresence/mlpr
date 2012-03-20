function q4(Data, Mu, E)
[NInstances NFeatures] = size(Data.x);
%% Q4a
[Log, Cleanup] = makeLogFile(['q4a.log']);
fprintf('[Q4a] Running Linear Regression Cross-Validation...'); tic;
SubSetX = [Data.x(:, end), Data.x(:, end - 34), Data.x(:, end - 35)];
ResultsRL3 = crossValidation(Data.y, SubSetX, 4, @trainAndTestLR);
LikelihoodsRL3 = reshape(cell2mat(ResultsRL3), NInstances, 1);
PerplexityRL3 = perplexity(LikelihoodsRL3);
fprintf('Done.\n'); toc;
fprintf(Log, '[Q4a] Linear Regression Perplexity: %f.\n', PerplexityRL3);

%% Q4b
[Log, Cleanup] = makeLogFile(['q4b.log']);
fprintf('[Q4b] Running Linear Regression PCA Cross-Validation...'); tic;
ProjectedX = projectSequence(Mu, E, Data.x, 10);
ResultsRL10 = crossValidation(Data.y, ProjectedX, 4, @trainAndTestLR);
LikelihoodsRL10 = reshape(cell2mat(ResultsRL10), NInstances, 1);
PerplexityRL10 = perplexity(LikelihoodsRL10);
fprintf('Done.\n'); toc;
fprintf(Log, '[Q4b] Linear Regression PCA Perplexity: %f.\n', PerplexityRL10);
%% Q4c
% No code