function [AlphaY AlphaXYk] = trainNB(DataY, DataX)
    [NInstances NFeatures] = size(DataX);
    AlphaXYk = ones(64, 64, 3); % prior
    AlphaY = ones(64, 1); % prior

    for I = 1:NInstances
        Y = DataY(I)+1;
        X1 = DataX(I, 1)+1;
        X2 = DataX(I, 2)+1;
        X3 = DataX(I, 3)+1;
        
        AlphaY(Y) = AlphaY(Y) + 1;
        AlphaXYk(X1, Y, 1) = AlphaXYk(X1, Y, 1) + 1;
        AlphaXYk(X2, Y, 2) = AlphaXYk(X2, Y, 2) + 1;
        AlphaXYk(X3, Y, 3) = AlphaXYk(X3, Y, 3) + 1;
    end
end