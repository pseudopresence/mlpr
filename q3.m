function q3(Data)
[NInstances NFeatures] = size(Data.x);

%% Q3a
fprintf('[Q3a] Running Naive Bayes Cross-Validation...'); tic;
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
ResultsNB = crossValidation(Data.y, SubSetX, 4, @trainAndTestNB);
LikelihoodsNB = reshape(cell2mat(ResultsNB), NInstances, 1);
PerplexityNB = perplexity(LikelihoodsNB);
% No idea if this is right.
fprintf('Done.\n'); toc;

%% Q3b
% Results = crossValidation(Data.y, SubSetX, 4, @trainAndTestDir);
% Probs = reshape(cell2mat(Results), NInstances, 1);
% Perplexity = perplexity(Probs);
% i)
[Log, Cleanup] = makeLogFile(['q3bi.log']);
fprintf(Log, '[Q3bi] Naive Bayes Perplexity: %f.\n', PerplexityNB);

% ii)
% Figures generated in trainAndTestNB.
% iii)
% No code
% iv)
% No code
