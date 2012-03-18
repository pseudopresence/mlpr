function [P] = dirichletPDF(X, A)
    T = X .^ (A - 1);
    Q = prod(T);
    L = prod(gamma(A));
    J = gamma(sum(A));
    P = (J / L) * Q;
end