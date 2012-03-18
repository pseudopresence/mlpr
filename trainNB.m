function [CountsY CountsYXk] = trainNB(DataY, DataX)
    [NInstances NFeatures] = size(DataX);
    CountsYXk = ones(64, 64, 3); % +1 smoothing
    CountsY = ones(64, 1); % +1 smoothing

    for I = 1:NInstances
        Y = DataY(I)+1;
        CountsY(Y) = CountsY(Y) + 1;
        X1 = DataX(I, 1)+1;
        X2 = DataX(I, 2)+1;
        X3 = DataX(I, 3)+1;
        CountsYXk(Y, X1, 1) = CountsYXk(Y, X1, 1) + 1;
        CountsYXk(Y, X2, 1) = CountsYXk(Y, X2, 1) + 1;
        CountsYXk(Y, X3, 1) = CountsYXk(Y, X3, 1) + 1;
    end
end