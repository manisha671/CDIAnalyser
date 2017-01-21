[FileName,PathName,FilterIndex] = uigetfile('*.txt');
fid=fopen(strcat(PathName, FileName), 'r');
C = textscan(fid, '%s', 'Delimiter', '');
fclose(fid);
disp(C{1})