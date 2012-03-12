function [] = writeFigurePDF(Fig, FileName)
% writeFigurePDF writes the current figure to a pdf file
% INPUT Fig: [optional] the figure to write; default is the current figure.
%       FileName: a string containing the path of the file to save to.

if nargin < 2
    FileName = Fig;
    Fig = gcf;
end
FileNameRoot = regexp(FileName, '(.*)\.pdf$', 'tokens');
FileNameEPS = [FileNameRoot{1}{1} '.eps'];
SavedBreakpoints = dbstatus;
dbclear if infnan; % Yes, this is a thing
print(Fig, '-depsc', FileNameEPS);
dbstop(SavedBreakpoints);
[Status, ~] = unix(['epstopdf ' FileNameEPS]);
if Status ~= 0
    fprintf(2, 'Error running epstopdf!\n');
end
