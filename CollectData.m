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

data = java.util.ArrayList(allData.values());
str = char(data.toString());
str = strrep(str,'[','');
str = strrep(str,']','');
str = strrep(str,'{','');

str = strsplit(str,'},');
data = readtable(str);

CollectData = data;
end