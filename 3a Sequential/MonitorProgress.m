function [] = MonitorProgress(toc,t2,idx,Data2Process)
    tt = toc-t2;

    fprintf('Total %i of %i, last 50 in %.2f s  predicted time for all data %.1f s\n',...
    idx, size(Data2Process,1), tt, size(Data2Process,1)/50*25*tt)

    t2 = toc;
 

end

