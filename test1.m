
[FileName,PathName,FilterIndex] = uigetfile('*.txt');
fid=fopen(strcat(PathName, FileName), 'r');
%header={'Time' 'pH'}
T = readtable('testph.txt')

%C = textscan(fid, '%s', 'Delimiter', '');
fclose(fid);
%celldisp(C)