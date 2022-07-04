%% Script to examine NetCDF data formats and check for NaN
% Note, you would carry out this test each time you load data.
% You should NOT test the whole file at the start

clear all
close all


%% Test File with Errors
NaNErrors = 0;
%% Set file to test
DataFileName = '../Model/TestFileNaN.nc'; % define our test file
 %FileName = '../Model/o3_surface_20180701000000.nc'; % un rem this line to see what happens with good data
Contents = ncinfo(DataFileName); % Store the file content information in a variable.

%% Create and open log file

[LogID] = CreateAnalysisLog(DataFileName);


StartLat = 1;
StartLon = 1;

fprintf('Testing files: %s\n', DataFileName)
for idxHour = 1:25
    
    [Data] = LoadData(DataFileName,Contents,StartLat, StartLon, idxHour);
    
    % check for NaNs
    if any(isnan(Data), 'All')
        [NaNErrors] = NaNFound();
        FindNaNHour(idxHour,Contents,Data);
        
        
        % Write to log file
        fprintf(LogID, '%s: %s processing data hour %i\n', datestr(now, 0), 'NaN Error', idxHour);
    else
        % write to log file
        fprintf(LogID, '%s: %s processing data hour %i\n', datestr(now, 0), 'Success', idxHour);
    end
    
end
 fclose(LogID);

if ~NaNErrors
    fprintf('No errors!\n')
end