function [datatype] = SetupTestFile(FileName)


Contents = ncinfo(FileName); % Store the file content information in a variable.

FileID = netcdf.open(FileName,'NC_NOWRITE'); % open file read only and create handle

for idx = 0:size(Contents.Variables,2)-1 % loop through each variable
    % read data type for each variable and store
    [~, datatype(idx+1), ~, ~] = netcdf.inqVar(FileID,idx);
end

end

