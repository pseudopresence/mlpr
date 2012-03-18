function [Class] = classifyNB(CountsY, CountsX, TestX)
    [NInstances NFeatures] = size(TestX);
    assert(0);
    P = zeros(NInstances, 64);
    for I = 1:NInstances
        for Y = 1:64
            % TODO I think this is totally wrong now, TestX is 2D for a
            % start
            P(Y) = sum(CountsX(Y, TestX(I) + 1, :), 3);
        end
    end
    [Dummy Class] = max(P, [], 2);
end