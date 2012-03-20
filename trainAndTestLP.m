function [Likelihoods] = trainAndTestLP(FoldIdx, TrainDataY, TrainDataX, TestDataY, TestDataX)
    V = trainLP(TrainDataY, TrainDataX);
    Likelihoods = probLP(V, TestDataY, TestDataX);
end