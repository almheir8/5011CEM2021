function [HourlyData] = LoadingHours(FileName,StartLon, StartLat,idxTime,NumLon, NumLat)
Contents = ncinfo(FileName);
DataLayer = 1; % which 'layer' of the array to load the model data into
            for idx = [1, 2, 4, 5, 6, 7, 8] % model data to load
                % load the model data
                HourlyData(DataLayer,:,:) = ncread(FileName, Contents.Variables(idx).Name,...
                    [StartLon, StartLat, idxTime], [NumLon, NumLat, 1]);
                DataLayer = DataLayer + 1; % step to the next 'layer'
            end


end

