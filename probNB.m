function [P] = probNB(CountsY, CountsXYk, TestY, TestX)
% For the perplexity measure we will compute P(y|x, Model)
% = P(x1|y)P(x2|y)P(x3|y)P(y)/P(x)
% P(x1|y) = CountX1Y(x1, y)/Count(y)
% P(y) = Count(y)/TotY
% P(x) = sum(P(y, x), y)
    [NInstances NFeatures] = size(TestX);
    TotY = sum(CountsY);
    assert(size(TestY, 1) == NInstances);
    P = zeros(NInstances, 1);
    for I = 1:NInstances
        Y = TestY(I) + 1;
        X1 = TestX(I, 1) + 1;
        X2 = TestX(I, 2) + 1;
        X3 = TestX(I, 3) + 1;
        PY = CountsY(Y)/TotY;
        PX1 = CountsXYk(X1, Y, 1)/CountsY(Y);
        PX2 = CountsXYk(X2, Y, 2)/CountsY(Y);
        PX3 = CountsXYk(X3, Y, 3)/CountsY(Y);
        P(I) = PX1 * PX2 * PX3 * PY;
    end
    P = P / sum(P, 1);
end