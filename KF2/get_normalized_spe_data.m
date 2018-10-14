function [data,time] = get_normalized_spe_data(file)
    % no way to pass fid to this I think
    data = importdata(file, ' ', 12);
    data = data.data;
    
    % read time
    fid = fopen(file);
    linenum = 10;
    C = textscan(fid,'%f %f',1,'delimiter','\n', 'headerlines',linenum-1);
    fclose(fid);
    
    time = cell2mat(C);
    
    time = time(1) + time(2)/1000;
    data = data./time;
end