function readCONCFile = readCONCFile(filePath, delay)

readData = readtable(filePath);
var = readData.Properties.VariableNames;
data = readData;
fileSize = size(data);
mainOutputText = '';
con = 670.6862;

for ii=var
    OutputText = '';
    for iterate = 1:fileSize(1)
        currentPosition = iterate;
        if iterate > delay && ( string(ii(1)) == 'value')
            CONCValueString = data.(ii{1})(currentPosition:currentPosition);
            CONCValue = double(CONCValueString);
            goalValue = (((con-4.5)/121.29)^(1/0.9826)-0.13)
            %goalValue = J * (((valueK * valueL)+ ((valueM/valueK) * N)) ); 
            OutputText = strcat(OutputText, ' S/No= ');
            OutputText = strcat(OutputText, num2str(iterate));
            OutputText = strcat(OutputText, ' CON= ');
            OutputText = strcat(OutputText, num2str(CONCValue));
            OutputText = strcat(OutputText, ' VALUE= ');
            OutputText = strcat(OutputText, num2str(goalValue));
            OutputText = strcat(OutputText, '___');
            disp(   string({'CON : ' CONCValue ' Output : ' goalValue}));
        elseif iterate <= delay && ( string(ii(1)) == 'value')
            CONCValueString = data.(ii{1})(currentPosition:currentPosition);
            CONCValue = double(CONCValueString);
           	OutputText = strcat(OutputText, ' S/No= ');
            OutputText = strcat(OutputText, num2str(iterate));
            OutputText = strcat(OutputText, ' CON= ');
            OutputText = strcat(OutputText, num2str(CONCValue));
            OutputText = strcat(OutputText, ' VALUE= ');
            OutputText = strcat(OutputText, 'SKIPPED');
            OutputText = strcat(OutputText, '___');
            disp(string({'Skipping : ' iterate '->' data.(ii{1})(iterate:iterate)})) 
        end
    end
    mainOutputText = strcat(mainOutputText,OutputText);
end
readCONCFile = mainOutputText;

