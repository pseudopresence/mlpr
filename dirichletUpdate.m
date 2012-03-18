function [A] = dirichletUpdate(X, A)
    NInstances = size(X, 1);
    assert(size(X, 2) == 1);
    assert(size(A, 1) == NFeatures);
    assert(size(A, 2) == 1);
    % Assuming X = 0..63
    A = A + hist(X, 64)';
end