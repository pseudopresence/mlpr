function [Likelihoods] = trainAndTestLP(FoldIdx, TrainDataY, TrainDataX, TestDataY, TestDataX)
    V = trainLP(TrainDataY, TrainDataX);
    Likelihoods = probLP(V, TestDataY, TestDataX);
    
%     Dists = distNB(CountsY, CountsX, TestDataX);
%     PlotIdx = 9465;
%     figure();
%     plot(Dists(PlotIdx, :));
%     line([TestDataY(PlotIdx) TestDataY(PlotIdx)], [0, max(Dists(PlotIdx, :))],'Color','r');
%     writeFigureEPS(['Q3bii-hist-' int2str(FoldIdx) '-' int2str(PlotIdx) '.eps' ]);
%     close;
end