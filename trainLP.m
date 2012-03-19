function V = trainLP(TrainDataY, TrainDataX)
    V = cov(TrainDataY - TrainDataX(:, end));
end