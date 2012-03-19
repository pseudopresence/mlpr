function [A] = dirichletUpdate(X, A)
    NClasses = size(A, 1);
    NInstances = size(X, 1);
    assert(size(X, 2) == 1);
    assert(size(A, 2) == 1);
    A = A + hist(X, 0:(NClasses-1))';
end