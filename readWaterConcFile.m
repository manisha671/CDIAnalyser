function readWaterConcFile = readWaterConcFile()

filePath = 'tmp\conductivity_calculation.csv';

fid = fopen(filePath);
tline = fgets(fid);

waterConcentration = [];

while ischar(tline)
   rowData = strsplit(tline,',');
        
  rowDataToNumber = str2num(rowData{2}); 
  waterConcentration = cat(1,waterConcentration ,rowDataToNumber);
  tline = fgets(fid);
end

readWaterConcFile = waterConcentration;

end
