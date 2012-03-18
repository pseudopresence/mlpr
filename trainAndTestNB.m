function [Likelihoods] = trainAndTestNB(TrainDataY, TrainDataX, TestDataY, TestDataX)
    [CountsY CountsX] = trainNB(TrainDataY, TrainDataX);
    % TODO we are going to use these values to compute perplexity, 
    % but this is p(y,x|M) when we want p(y|x,M).
    Likelihoods = probNB(CountsY, CountsX, TestDataY, TestDataX);
end