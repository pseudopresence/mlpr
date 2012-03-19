function q5(Data)
[Log, Cleanup] = makeLogFile(['q5.log']);
[NInstances NFeatures] = size(Data.x);
ResultsLP = crossValidation(Data.y, Data.x, 4, @trainAndTestLP);
LikelihoodsLP = reshape(cell2mat(ResultsLP), NInstances, 1);
PerplexityLP = perplexity(LikelihoodsLP);
fprintf(Log, '[Q5] Last-Pixel Perplexity: %f.\n', PerplexityLP);