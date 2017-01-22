
[FileName,PathName,FilterIndex] = uigetfile('*.txt');
fid=fopen(strcat(PathName, FileName), 'r');
C = textscan(fid, '%s', 'Delimiter', '');
header={'time' 'pH'} % headers for the file
T = readtable('test_pH.txt')
%M=[header;num2cell(C)]
fprintf(fid, '%f  %f\n', fid);
fclose(fid);
%disp(C)

%fid = fopen('test_pH.txt', 'w');
% print a title, followed by a blank line
%fprintf(fid, 'aksjdaskjd\n\n');
% print values in column order
% two values appear on each row of the file

%fclose(fid);