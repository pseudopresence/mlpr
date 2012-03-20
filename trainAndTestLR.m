function [Likelihoods] = trainAndTestLR(FoldIdx, TrainDataY, TrainDataX, TestDataY, TestDataX)
    [Net V] = trainLR(TrainDataY, TrainDataX);
    Likelihoods = probLR(Net, V, TestDataY, TestDataX);
end