function [] = FindNaNHour(idxHour,Contents,Data)
 %% find first error:
 ErrorModel = find(isnan(Data), 1, 'first');
        
 fprintf('Analysis for hour %i is invalid, NaN errors recorded in model %s\n',...
          idxHour, Contents.Variables(ErrorModel).Name)

end

