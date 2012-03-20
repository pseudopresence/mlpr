function q3(Data)
%% Q3a
% No code

%% Q3b
% i)
fprintf('[Q3b] Running Naive Bayes Cross-Validation...'); tic;
[NInstances NFeatures] = size(Data.x);
SubSetX = [Data.x(:, end), Data.x(:, end - 34), Data.x(:, end - 35)];
ResultsNB = crossValidation(Data.y, SubSetX, 4, @trainAndTestNB);
LikelihoodsNB = reshape(cell2mat(ResultsNB), NInstances, 1);
PerplexityNB = perplexity(LikelihoodsNB);
fprintf('Done.\n'); toc;

[Log, Cleanup] = makeLogFile(['q3bii.log']);
fprintf(Log, '[Q3bi] Naive Bayes Perplexity: %f.\n', PerplexityNB);

% ii)
% Figures generated in trainAndTestNB.
% iii, iv)
% No code
