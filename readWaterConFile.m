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
  if size(rowData) > 2
    rowData = rowData{3};
    rowData = strsplit(rowData,'=');
    rowNumber = str2num(rowData{2}); 
    waterCon = cat(1,waterCon ,rowNumber);
  end
  tline = fgets(fid);
end

readWaterConFile = waterCon;

end

