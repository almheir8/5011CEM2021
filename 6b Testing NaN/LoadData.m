function [Data] = LoadData(FileName,Contents,StartLat, StartLon, idxHour)


for idxModel = 1:8 % Model data to load
        % Load all model data
        Data(idxModel,:,:) = ncread(FileName, Contents.Variables(idxModel).Name,...
            [StartLat, StartLon, idxHour], [inf, inf, 1]);
end
end

