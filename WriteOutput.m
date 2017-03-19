function WriteOutput = WriteOutput(filePath, dataMap)
fid=fopen(filePath,'a');

dataToWrite = dataMap.toString();
fprintf( fid, '%s\n', dataToWrite);

WriteOutput = '';