function [P] = distNB(AlphaY, AlphaXYk, TestX)
% P(y|x) = P(y, x)/P(x)
% P(y, x) = P(x1|y)P(x2|y)P(x3|y)P(y)
% P(x1|y) = AlphaX1Y(x1, y)/Alpha(y)
% P(y) = AlphaY(y)/TotY
% P(x) = sum(P(y, x), y)
    [NInstances NFeatures] = size(TestX);
    TotY = sum(AlphaY);
    P = zeros(NInstances, 1);
    for I = 1:NInstances
        X1 = TestX(I, 1) + 1;
        X2 = TestX(I, 2) + 1;
        X3 = TestX(I, 3) + 1;
        for Y = 1:64
            PY = AlphaY(Y)/TotY;
            PX1 = AlphaXYk(X1, Y, 1)/AlphaY(Y);
            PX2 = AlphaXYk(X2, Y, 2)/AlphaY(Y);
            PX3 = AlphaXYk(X3, Y, 3)/AlphaY(Y);
            P(I, Y) = PX1 * PX2 * PX3 * PY;
        end
        
        % Normalise
        P(I, :) = P(I, :) / sum(P(I, :), 2);
    end
end