function [P] = probNB(AlphaY, AlphaXYk, TestY, TestX)
    [NInstances NFeatures] = size(TestX);
    assert(size(TestY, 1) == NInstances);
    Ps = distNB(AlphaY, AlphaXYk, TestX);
    
    P = zeros(NInstances, 1);
    % Just select the observed y(i) from the
    % distribution p(y|x(i))
    for I = 1:NInstances
        Y = TestY(I) + 1;
        P(I) = Ps(I, Y);
    end
end