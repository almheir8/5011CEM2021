function [] = TotalTime(Options,Results)


for idn = 1:length(Options)%Loops through number of elements in the options array and prints that data segment and processing time for each segment.
    fprintf('Total time for sequential processing of %.0f segments = %.2f s\n\n', Options(idn), Results(idn))
end


end

