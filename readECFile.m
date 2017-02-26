function readECFile = readECFile(filePath)
%readData = readtable(filePath);

fid = fopen(filePath);
tline = fgets(fid);

dataStart = 0;
while ischar(tline)
    if dataStart == 1
        rowData = strsplit(tline,'\t');
        counter = rowData{8};
        inc = rowData{9};
        
        disp(string({'counter{8}'  rowData{8} 'inc.{9}'  rowData{9} }))

    end
    
    if dataStart == 0 && startsWith(tline,'mode	ox/red	error','IgnoreCase',true)
        dataStart = 1;
    end
    tline = fgets(fid);
end

end

