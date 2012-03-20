function [Likelihoods] = trainAndTestNB(FoldIdx, TrainDataY, TrainDataX, TestDataY, TestDataX)
    [AlphaY AlphaX] = trainNB(TrainDataY, TrainDataX);
    Likelihoods = probNB(AlphaY, AlphaX, TestDataY, TestDataX);
    
    Dists = distNB(AlphaY, AlphaX, TestDataX);
    PlotIdx = 9465;
    figure();
    plot(Dists(PlotIdx, :));
    line([TestDataY(PlotIdx) TestDataY(PlotIdx)], [0, max(Dists(PlotIdx, :))],'Color','r');
    writeFigureEPS(['Q3bii-hist-' int2str(FoldIdx) '-' int2str(PlotIdx) '.eps' ]);
    close;
end