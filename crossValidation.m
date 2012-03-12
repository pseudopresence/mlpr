function Results = crossValidation(Data, NFolds, trainModel, evaluateModel)
    [NInstances NFeatures] = size(Data);
    FoldSize = NInstances / NFolds;
    assert(FoldSize == floor(FoldSize));
    for FoldIdx = 1:NFolds
        FoldStart = 1 + (FoldSize * (FoldIdx-1));
        FoldEnd = FoldStart + FoldSize;
        TrainData = [Data(1:(FoldStart-1), :), Data((FoldEnd+1):NInstances, :)];
        TestData = Data(FoldStart:FoldEnd, :);
        Model = trainModel(TrainData);
        Results{FoldIdx} = evaluateModel(TestData, Model);
    end
end