% Smaller perplexity is better - best possible is 1.
function Perplexity = perplexity(Likelihoods)
    Perplexity = exp(-mean(log(Likelihoods)));
end