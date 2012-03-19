function Likelihoods = probLP(V, TestDataY, TestDataX)
    [NInstances NFeatures] = size(TestDataX);
    Likelihoods = zeros(NInstances, 1);
    Pred = TestDataX(:, end);
    for I = 1:NInstances
        Likelihoods(I) = gauss(Pred(I), V, TestDataY(I));
    end
end