function CollectData = CollectData()
filePath1 = 'tmp\readPHfileOutput.dat';
filePath2 = 'tmp\readCONfileOutput.dat';
filePath3 = 'tmp\readECFileOutput.dat';

allData = java.util.HashMap;

fid1 = fopen(filePath1);
tline = fgets(fid1);
i = 0;
while ischar(tline)  
getMapFromOutPutFormat(tline,allData,i);
i = i+1;
tline = fgets(fid1);
end

fid2 = fopen(filePath2);
tline = fgets(fid2);
i = 0;
while ischar(tline)
getMapFromOutPutFormat(tline,allData,i);
i = i+1;
tline = fgets(fid2);
end


fid3 = fopen(filePath3);
tline = fgets(fid3);
i = 0;
while ischar(tline)
getMapFromOutPutFormat(tline,allData,i);
i = i+1;
tline = fgets(fid3);
end

    function getMapFromOutPutFormat = getMapFromOutPutFormat(value,allData,position)
          rowData = value;
          rowData = strrep(rowData,'[','');
          rowData = strrep(rowData,']','');
          rowData = strsplit(rowData,',');
          keyValueCount = size(rowData);
          
          
          newMap = java.util.HashMap;
          time = 0;
          for iterate = 1:keyValueCount(2)
           keyValuePair = rowData{iterate};
           keyValuePair = strsplit(keyValuePair,'=');
           key = keyValuePair{1};
           value = keyValuePair{2};
           if strcmp(key,'time')
            time = value;
           end
           newMap.put(key,value);
          end
          
          if allData.containsKey(time) == true
               map = allData.get(time);
               map.putAll(newMap)
               allData.put(time,map);
          else
             allData.put(time,newMap); 
          end
    end

allDataMatlab = [];

for i = 1:1000
if allData.containsKey(num2str(i))    
    row = char(allData.get(num2str(i)).toString());
    row = strrep(row,'{','');
    row = strrep(row,'}','');
    row = strsplit(row,',');
    
    sizeOfRow = size(row);
 
    
     graphTime = '0';
     graphCapacity = '0';
     graphWaterConductivity = '0';
     graphConductivityCalibrated = '0';
     graphPhValue = '-';
    
    for j = 1:sizeOfRow(2) % Each Elements in HASH MAP basically KEY=VALUE
       
        %fidGraphTimevsConductivity = fopen('tmp\graph-time-vs-conductivity.dat');
        %fidGraphTimevsCon = fopen('tmp\graph-time-vs-con.dat'); 
        
       keyValuePairStr = row(j);
       keyValuePair = strsplit(string(keyValuePairStr),'=');
       
       keyValuePair(1)
       
       if contains(keyValuePair(1),'phValue','IgnoreCase',true)
        graphPhValue = keyValuePair(2);
        graphPhValue = strrep( graphPhValue , sprintf('\n'),'')
       end
       
       if contains(keyValuePair(1),'capacity','IgnoreCase',true)
           graphCapacity = keyValuePair(2);
       end
       
       if contains(keyValuePair(1),'waterConductivity','IgnoreCase',true)
           graphWaterConductivity = keyValuePair(2);
           graphWaterConductivity = strrep( graphWaterConductivity , sprintf('\n'),'');
       end
       
       if contains(keyValuePair(1),'time','IgnoreCase',true)
          graphTime = keyValuePair(2);
       end
       
       if contains(keyValuePair(1),'conductivityCalibrated','IgnoreCase',true)
         graphConductivityCalibrated = keyValuePair(2)     ; 
         graphConductivityCalibrated = strrep( graphConductivityCalibrated , sprintf('\n'),'')
       end
       
       if contains(keyValuePair(1),'concentration','IgnoreCase',true)
         graphConcentration = keyValuePair(2)     ; 
         graphConcentration = strrep( graphConcentration , sprintf('\n'),'')
       end
       
    end
    
    if graphTime ~= '0'
           fidGraphTimevsPH = fopen('tmp\graph-time-vs-ph.dat','a');
           fidGraphTimevsConductivity = fopen('tmp\graph-time-vs-water-conductivity.dat','a');
           fidGraphTimevsCon = fopen('tmp\graph-time-vs-con.dat','a'); 
           
           fprintf( fidGraphTimevsPH , '%s,%s\n', graphTime, graphPhValue); 
           fprintf( fidGraphTimevsConductivity , '%s,%s\n', graphTime, graphWaterConductivity); 
           fprintf( fidGraphTimevsCon , '%s,%s\n', graphTime, graphConcentration); 
          
           fclose(fidGraphTimevsPH);
           fclose(fidGraphTimevsConductivity);
           fclose(fidGraphTimevsCon);
   end
    
    
end
   
end

CollectData = '';
 
end