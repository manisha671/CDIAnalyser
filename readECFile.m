function readECFile = readECFile(filePath)

fid = fopen(filePath);
tline = fgets(fid);

previousNS = 0;

dataStart = 0;
nsChanged = 0;
previousCapacity = 0;
currentCapacity = 0;

while ischar(tline)

    if dataStart == 1
       
        rowData = strsplit(tline,'\t');
       
        nsChangeString = rowData{1};
        nsChange = str2num(nsChangeString);
        
        if (nsChange ~= previousNS)
            nsChanged = 1;
        else
            nsChanged = 0;
        end
        
        if nsChanged == 1
           rowCapacityString = rowData{4};
           rowCapacity = str2num(rowCapacityString);
           currentCapacity = (rowCapacity - previousCapacity) * 3600;
           previousCapacity = rowCapacity;
           disp(string({rowData{4} ' = '  currentCapacity }))
        end
    end
    
    if dataStart == 0 && startsWith(tline,'Ns','IgnoreCase',true)
        dataStart = 1;
    end
   
    tline = fgets(fid);
    
    if nsChanged == 1
        %disp(string({currentCapacity}));
    end
    
end

end

