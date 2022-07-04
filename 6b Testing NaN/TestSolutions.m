%% Script to examine NetCDF data formats and check for NaN
% Note, you would carry out this test each time you load data.
% You should NOT test the whole file at the start

clear all
close all


%% Test File with Errors
NaNErrors = 0;
%% Set file to test
FileName = '../Model/TestFileNaN.nc'; % define our test file
%FileName = '../Model/o3_surface_20180701000000.nc'; % un rem this line to see what happens with good data
Contents = ncinfo(FileName); % Store the file content information in a variable.

StartLat = 1;
StartLon = 1;

fprintf('Testing files: %s\n', FileName)
for idxHour = 1:25

    [Data] = LoadData(FileName,Contents,StartLat, StartLon, idxHour);
   
    
    % check for NaNs
    if any(isnan(Data), 'All')
        
        [NaNErrors] = NaNFound();
        FindNaNHour(idxHour,Contents,Data);
        
       
        %% Analysis will crash if we continue!
        % Set all data to zero, so analysis failure is obvious.
        Data = zeros(size(Data));
        % continue and carry out analysis?
        % Other techniques may be better, e.g. set all to (-1), or skip
        % analysis and set results which will be quicker, e.g:
        % Results = -(ones(700, 400));
    end
    
end
    
if ~NaNErrors
    fprintf('No errors!\n')
end