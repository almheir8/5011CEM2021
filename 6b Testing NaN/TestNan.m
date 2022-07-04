%% Script to examine NetCDF data formats and check for NaN
% Note, you would carry out this test each time you load data.
% You should NOT test the whole file at the start

clear all
close all


%% Test a good file
NaNErrors = 0;
%% Set file to test
FileName = '../Model/o3_surface_20180701000000.nc'; % define our test file

Contents = ncinfo(FileName); % Store the file content information in a variable.

StartLat = 1;
StartLon = 1;

for idxHour = 1:25
    % function to load all model data
    [Data] = LoadData(FileName,Contents,StartLat, StartLon, idxHour);
    
    
    % check for NaNs
    if any(isnan(Data), 'All')
        % function to trigger terminal response for NaN presence
        [NaNErrors] = NaNFound();
    end
end
    
fprintf('Testing files: %s\n', FileName)
if NaNErrors
    fprintf('NaN errors present!\n')
else
    fprintf('No errors!\n')
end
    
    


%% Test File with Errors
NaNErrors = 0;
%% Set file to test
FileName = '../Model/TestFileNaN.nc'; % define our test file

Contents = ncinfo(FileName); % Store the file content information in a variable.

StartLat = 1;
StartLon = 1;

fprintf('Testing files: %s\n', FileName)
for idxHour = 1:25
    
    [Data] = LoadData(FileName,Contents,StartLat, StartLon, idxHour); 
   
    % check for NaNs
    if any(isnan(Data), 'All')
        [NaNErrors] = NaNFound();
    end
end
    
if NaNErrors
    fprintf('NaN errors present!\n')
else
    fprintf('No errors!\n')
end