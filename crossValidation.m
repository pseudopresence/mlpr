function Results = crossValidation(DataY, DataX, NFolds, trainAndEvaluate)
    [NInstances NFeatures] = size(DataX);
    assert(size(DataY, 1) == NInstances);
    FoldSize = NInstances / NFolds;
    assert(FoldSize == floor(FoldSize));
    for FoldIdx = 1:NFolds
        FoldStart = 1 + (FoldSize * (FoldIdx-1));
        FoldEnd = FoldStart + FoldSize - 1;
        TrainDataX = [DataX(1:(FoldStart-1), :); DataX((FoldEnd+1):NInstances, :)];
        TrainDataY = [DataY(1:(FoldStart-1), :); DataY((FoldEnd+1):NInstances, :)];
        TestDataX = DataX(FoldStart:FoldEnd, :);
        TestDataY = DataY(FoldStart:FoldEnd, :);
        Results{FoldIdx} = trainAndEvaluate(TrainDataY, TrainDataX, TestDataY, TestDataX);
    end
end