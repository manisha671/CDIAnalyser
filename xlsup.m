num = xlsread('ph.xlsx')
filename = 'ph.xlsx';
sheet = 1;
xlRange = 'B2:C3';

subsetA = xlsread(filename,sheet,xlRange)