function Perplexity = perplexity(Likelihoods)
    Perplexity = exp(-mean(log(Likelihoods)));
end