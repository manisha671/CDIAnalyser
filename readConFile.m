function readConFile = readConFile(filePath, delay)

readData = readtable(filePath);
var = readData.Properties.VariableNames;
data = readData;

fileSize = size(data);

mainOutputText = [];

waterConductivity = readWaterConFile();
%waterConcentration = readWaterConcFile();

for ii=var
    OutputText = '';
    for iterate = 1:fileSize(1)
        currentPosition = iterate;
        outputPath = 'tmp\readCONfileOutput.dat';
        
        dataMap = java.util.ArrayList;
        disp(data.(ii{1})(currentPosition:currentPosition));
        if iterate >= delay && ( string(ii(1)) == 'value')
            conValueString = data.(ii{1})(currentPosition:currentPosition);
            conValue = double(conValueString);
            waterConductivityPosition = (currentPosition-delay) + 1;
            dataMap.add(strcat('time=',num2str(waterConductivityPosition)))
            dataMap.add(strcat('conductivity=',num2str(conValue)))
            if waterConductivityPosition > size(waterConductivity)
                WriteLog('skipping because : more conValue found than WaterConductivity' + waterConductivityPosition);
                break; 
            end
            waterCon = waterConductivity(waterConductivityPosition)
            caliCon = (  ((conValue/10) + (    (currentPosition-1)    /60))- waterCon) * 10000
            conc = (((caliCon-4.5)/121.29)^(1/0.9826)-0.13);
            dataMap.add(strcat('conductivityCalibrated=',num2str(caliCon)));
            dataMap.add(strcat('concentration=',num2str(conc)));
             
            %waterConcentrationPosition = (currentPosition-delay) + 1
            %if waterConcentrationPosition > size(waterConcentration)
            %   WriteLog('skipping reaseon: more conValue found than waterConcentration' + waterConcentrationPosition);
            %   WriteOutput(outputPath,dataMap);
            %   break;  
            %end
            %con = waterConcentration(waterConcentrationPosition)
            %goalValue2 = (((con-4.5)/121.29)^(1/0.9826)-0.13) 
            %dataMap.add(strcat('waterConductivityValue2=',num2str(currentPosition)));
            WriteOutput(outputPath,dataMap);
            
            OutputText = strcat(OutputText, ' S/No= ');
            OutputText = strcat(OutputText, num2str(iterate));
            OutputText = strcat(OutputText, ' CON= ');
            OutputText = strcat(OutputText, num2str(conValue));
            OutputText = strcat(OutputText, ' WaterCon= ');
            OutputText = strcat(OutputText, waterCon);
            OutputText = strcat(OutputText, ' VALUE= ');
            OutputText = strcat(OutputText, num2str(caliCon));
            OutputText = strcat(OutputText, '___');
            output = string({'CON : ' conValue ' Conductivity Calibrated By PH : ' waterCon}); 
            WriteLog(OutputText);
            WriteLog(output);
            mainOutputText = cat(1,mainOutputText ,string({caliCon}));
            WriteLog(mainOutputText);
        elseif iterate < delay && ( string(ii(1)) == 'value')
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
newFileLocation = 'tmp\con_calculation.csv';
fid=fopen(newFileLocation,'w');

for index = 1:size(mainOutputText)
    fprintf(fid, '%i,%s \n', index , mainOutputText{index} );
end
fclose(fid);

readConFile = mainOutputText;