function [Mu, E] = q2(Data)
%% Q2a
imgPatch = @(X) reshape([X zeros(1,18)],35,30)'/63;

fprintf('[Q2a] Computing Eigenvectors...'); tic;
[Mu, E, Lambda, P] = getEigenvectors(Data.x);
fprintf('Done.\n'); toc;

fprintf('[Q2a] Producing figures...'); tic;
figurePatch(imgPatch(Mu'));
writeFigureEPS('Q2a-mean.eps');
close;

figureEig(imgPatch(E(:, 1)'));
writeFigureEPS('Q2a-eig1.eps');
close;

figureEig(imgPatch(E(:, 2)'));
writeFigureEPS('Q2a-eig2.eps');
close;

figureEig(imgPatch(E(:, 3)'));
writeFigureEPS('Q2a-eig3.eps');
close;
fprintf('Done.\n'); toc;

%% Q2b

fprintf('[Q2b] Projecting patches...'); tic;
ProjectedX = projectSequence(Mu, E, Data.x, 3);
fprintf('Done.\n'); toc;

fprintf('[Q2b] Reconstructing patches...'); tic;
ReconstructedX = ProjectedX * E(:, 1:3)';
fprintf('Done.\n'); toc;

fprintf('[Q2b] Computing error...'); tic;
ErrorsX = mean((Data.x - ReconstructedX).^2, 2);
[Dummy MaxI] = max(ErrorsX);
[Log, Cleanup] = makeLogFile(['q2b.log']);
fprintf(Log, '[Q2b] Patch with largest reconstruction error: %d.\n', MaxI);
fprintf('Done.\n'); toc;

fprintf('[Q2b] Producing figures...'); tic;
figurePatch(imgPatch(Data.x(MaxI,:)));
writeFigureEPS('Q2b-patch.eps');
close;
figurePatch(imgPatch(ReconstructedX(MaxI, :)));
writeFigureEPS('Q2b-reconstructed.eps');
close;
fprintf('Done.\n'); toc;

%% Q2c

fprintf('[Q2c] Producing figures...'); tic;
CountsY = hist(Data.y, 0:63);
figure();
bar(CountsY, 'hist');
writeFigureEPS('Q2c-hist.eps');
close;
fprintf('Done.\n'); toc;

%% Q2d

fprintf('[Q2d] Producing figures...'); tic;
D = Data.y - Data.x(:, end);
[H2, X2] = hist(D, min(D):max(D));
figure();
bar(X2, H2, 'hist');
writeFigureEPS('Q2d-hist.eps');
close;
fprintf('Done.\n'); toc;
