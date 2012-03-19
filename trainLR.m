function [Net V] = trainLR(TrainDataY, TrainDataX)
    [NInstances NFeatures] = size(TrainDataX);
    Net = glm(NFeatures, 1, 'linear');
    Options = zeros(14, 1);
    Options(1) = 1;
    Net = glmtrain(Net, Options, TrainDataX, TrainDataY);
    Pred = glmfwd(Net, TrainDataX);
    % MLE estimate of V
    V = mean((Pred - TrainDataY).^2);
end