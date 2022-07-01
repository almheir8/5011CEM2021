%% This script allows you to open and explore the data in a *.nc file
close all

FileName = '..\Model\o3_surface_20180701000000.nc';

Contents = ncinfo(FileName);

Lat = ncread(FileName, 'lat'); % load the latitude locations
Lon = ncread(FileName, 'lon'); % loadthe longitude locations

% %% Processing parameters provided by customer
 RadLat = 30.2016; % cluster radius value for latitude
 RadLon = 24.8032; % cluster radius value for longitude
 RadO3 = 4.2653986e-08; % cluster radius value for the ozone data

%% Cycle through the hours and load all the models for each hour and record memory use
% We use an index named 'NumHour' in our loop
% The section 'sequential processing' will process the data location one
% after the other, reporting on the time involved.

StartLat = 1; % latitude location to start laoding
NumLat = 400; % number of latitude locations ot load
StartLon = 1; % longitude location to start loading
NumLon = 700; % number of longitude locations ot load
tic

Options = [100,200,300];

Results = [];
if isempty(Options)
    disp("Error list empty")
else    
    for idx1 = 1:length(Options) %Loops over the number of elements inside the options
        LoopParameter = Options(idx1); %This variable is assigned to the loop over each segment of data size 
        for NumHour = 1:25 % loop through full 25 hours
            fprintf('Processing hour %i\n', NumHour)

            %Loads models of hours
            [HourlyData] = LoadingHours(FileName,StartLon, StartLat, NumHour,NumLon, NumLat); 
            

            % We need to prepare our data for processing. This method is defined by
            % our customer. You are not required to understand this method, but you
            % can ask your module leader for more information if you wish.
            [Data2Process, LatLon] = PrepareData(HourlyData, Lat, Lon);

            %% Sequential analysis    
            t1 = toc;
            t2 = t1;

            for idx = 1:LoopParameter  % step through each data location to process the data
                % The analysis of the data creates an 'ensemble value' for each
                % location. This method is defined by
                % our customer. You are not required to understand this method, but you
                % can ask your module leader for more information if you wish.
                [EnsembleVector(idx, NumHour)] = EnsembleValue(Data2Process(idx,:,:,:), LatLon, RadLat, RadLon, RadO3);

                % To monitor the progress we will print out the status after every
                % 50 processes.
                if idx/50 == ceil( idx/50)

                    %function to print the progress of the process
                    MonitorProgress(toc,t2,idx,Data2Process);
                    
                  
                end
            end
            T2(NumHour) = toc - t1; % record the total processing time for this hour
            fprintf('Processing hour %i - %.2f s\n\n', NumHour, sum(T2));


        end
        Results(idx1) = [toc]; 
    end
end
tSeq = toc;
TotalTime(Options,Results);