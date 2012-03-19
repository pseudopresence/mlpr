function [CountsY CountsXYk] = trainNB(DataY, DataX)
    [NInstances NFeatures] = size(DataX);
    CountsXYk = ones(64, 64, 3); % +1 smoothing
    CountsY = ones(64, 1); % +1 smoothing

    for I = 1:NInstances
        Y = DataY(I)+1;
        X1 = DataX(I, 1)+1;
        X2 = DataX(I, 2)+1;
        X3 = DataX(I, 3)+1;
        
        CountsY(Y) = CountsY(Y) + 1;
        CountsXYk(X1, Y, 1) = CountsXYk(X1, Y, 1) + 1;
        CountsXYk(X2, Y, 2) = CountsXYk(X2, Y, 2) + 1;
        CountsXYk(X3, Y, 3) = CountsXYk(X3, Y, 3) + 1;
    end
end