function readWaterConFile = readWaterConFile()

filePath = 'tmp\ph_calculation.csv';

fid = fopen(filePath);
tline = fgets(fid);

waterCon = [];

while ischar(tline)
   rowData = strsplit(tline,',');
        
  rowNumber = str2num(rowData{2}); 
  waterCon = cat(1,waterCon ,rowNumber);
  tline = fgets(fid);
end

readWaterConFile = waterCon;

end

