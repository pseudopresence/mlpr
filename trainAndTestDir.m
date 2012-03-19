function [Likelihoods] = trainAndTestDir(TrainDataY, TrainDataX, TestDataY, TestDataX)
    [AlphaY AlphaXY] = trainDir(TrainDataY, TrainDataX);
    Likelihoods = probDir(AlphaY, AlphaXY, TestDataY, TestDataX);
end