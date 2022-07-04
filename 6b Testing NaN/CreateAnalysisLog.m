function [LogID] = CreateAnalysisLog(DataFileName)
%% Create and open log file
LogFileName = 'AnalysisLog.txt';
delete AnalysisLog.txt;
% create new log file, 'w' replaces the file if present. To continually
% append, use 'a'
LogID = fopen('AnalysisLog.txt', 'a');
fprintf(LogID, '%s: Starting analysis of %s\n', datestr(now, 0), DataFileName);
end

