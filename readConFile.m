function readConFile = readConFile(filePath, delay)

readData = readtable(filePath);
var = readData.Properties.VariableNames;
data = readData;

fileSize = size(data);

mainOutputText = [];

waterConductivity = readWaterConFile();
waterConcentration = readWaterConcFile();

for ii=var
    OutputText = '';
    for iterate = 1:fileSize(1)
        currentPosition = iterate;
        if iterate >= delay && ( string(ii(1)) == 'value')
            conValueString = data.(ii{1})(currentPosition:currentPosition);
            conValue = double(conValueString)
            waterConductivityPosition = (currentPosition-delay) + 1
            if waterConductivityPosition > size(waterConductivity)
                WriteLog('skipping reaseon: more conValue found than WaterConductivity' + waterConductivityPosition);
                break; 
            end
            waterCon = waterConductivity(waterConductivityPosition)
            goalValue = (conValue + (currentPosition/60)- waterCon) * 10000

            waterConcentrationPosition = (currentPosition-delay) + 1
            if waterConcentrationPosition > size(waterConcentration)
               WriteLog('skipping reaseon: more conValue found than waterConcentration' + waterConcentrationPosition);
               break;  
            end
            con = waterConcentration(waterConcentrationPosition)
            goalValue2 = (((con-4.5)/121.29)^(1/0.9826)-0.13) 
           
            OutputText = strcat(OutputText, ' S/No= ');
            OutputText = strcat(OutputText, num2str(iterate));
            OutputText = strcat(OutputText, ' CON= ');
            OutputText = strcat(OutputText, num2str(conValue));
            OutputText = strcat(OutputText, ' WaterCon= ');
            OutputText = strcat(OutputText, waterCon);
            OutputText = strcat(OutputText, ' VALUE= ');
            OutputText = strcat(OutputText, num2str(goalValue));
            OutputText = strcat(OutputText, '___');
            output = string({'CON : ' conValue ' Conductivity Calibrated By PH : ' waterCon}); 
            WriteLog(OutputText);
            WriteLog(output);
            mainOutputText = cat(1,mainOutputText ,string({goalValue}));
            WriteLog(mainOutputText);
        elseif iterate <= delay && ( string(ii(1)) == 'value')
            conValueString = data.(ii{1})(currentPosition:currentPosition);
            conValue = double(conValueString);
           	OutputText = strcat(OutputText, ' S/No= ');
            OutputText = strcat(OutputText, num2str(iterate));
            OutputText = strcat(OutputText, ' CON= ');
            OutputText = strcat(OutputText, num2str(conValue));
            OutputText = strcat(OutputText, ' VALUE= ');
            OutputText = strcat(OutputText, 'SKIPPED');
            OutputText = strcat(OutputText, '___');
            WriteLog(string({'Skipping : ' iterate '->' data.(ii{1})(iterate:iterate)})) 
        end
    end
end

fid=fopen('tmp\conductivity_calculation.csv','w');

for index = 1:size(mainOutputText)
    fprintf(fid, '%i,%s \n', index , mainOutputText{index} );
end
fclose(fid);

readConFile = mainOutputText;

