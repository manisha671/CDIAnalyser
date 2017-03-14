function WriteOutput = WriteOutput(filePath, dataMap )


fid=fopen(filePath,'a');

fprintf( fid, '%s\n', dataMap.toString());


WriteOutput = '';