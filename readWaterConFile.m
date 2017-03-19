function readWaterConFile = readWaterConFile()

filePath = 'tmp\readPHfileOutput.dat';

fid = fopen(filePath);
tline = fgets(fid);

waterCon = [];

while ischar(tline)
  rowData = tline;
  rowData = strrep(rowData,'[','');
  rowData = strrep(rowData,']','');
  rowData = strsplit(rowData,',');
  rowData = rowData{3};
  rowData = strsplit(rowData,'=');
  rowNumber = str2num(rowData{2}); 
  waterCon = cat(1,waterCon ,rowNumber);
  tline = fgets(fid);
end

readWaterConFile = waterCon;

end

