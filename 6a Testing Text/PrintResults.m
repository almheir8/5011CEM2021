function [] = PrintResults(FileName,FindText)
%% print results
fprintf('Testing file: %s\n', FileName)
if any(FindText)
    fprintf('Error, text variables present:\n')
else
    fprintf('All data is numeric, continue analysis.\n')
end

end

