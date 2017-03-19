function readPhFile = readPhFile(filePath, delay)

WriteLog(strcat('Reading ph file from location ',filePath));
readData = readtable(filePath);
var = readData.Properties.VariableNames;
data = readData;

fileSize = size(data);

valueM = 0.00000000000001; % ???

e= 1.602e-19;

kB= 1.38e-23;

T= 298;

H = 9.30e-9;

NA= 6.02e23;

multi= e*NA;

J = (e^2)/(kB * T);

valueL = NA * 1000 * H;

OH = 5.30e-9;

N = NA * 1000 * OH;

mainOutputText = [];

for ii=var
    OutputText = '';
    for iterate = 1:fileSize(1)
        currentPosition = iterate;
        outputPath = 'tmp\readPHfileOutput.dat';
        dataMap = java.util.ArrayList;
        if iterate >= delay && ( string(ii(1)) == 'pH')
          
            phValueString = data.(ii{1})(currentPosition:currentPosition);
            phValue = double(phValueString);
            time = (currentPosition-delay) + 1;
            valueK = 10^(-phValue - (time/60));
            waterConductivity = J *((valueK * valueL)+(valueM/(valueK * N)));
            dataMap.add(strcat('time=',num2str(currentPosition)));
            dataMap.add(strcat('phValue=', num2str(phValue)));
            dataMap.add(strcat('waterConductivity=', num2str(waterConductivity)) );
            WriteOutput(outputPath,dataMap);
            
            %OutputText = strcat(OutputText, ' S/No= ');
            %OutputText = strcat(OutputText, num2str(iterate));
            %OutputText = strcat(OutputText, ' PH= ');
            %OutputText = strcat(OutputText, num2str(phValue));
            %OutputText = strcat(OutputText, ' VALUE= ');
            %OutputText = strcat(OutputText, num2str(goalValue));
            %OutputText = strcat(OutputText, '___');
            %output = string({'PH : ' phValue ' Water Conductivity : ' goalValue}); 
            %disp(output);
            %WriteLog(output);
            %mainOutputText = cat(1,mainOutputText ,string({goalValue}));
        elseif iterate < delay && ( string(ii(1)) == 'pH')
            phValueString = data.(ii{1})(currentPosition:currentPosition);
            phValue = double(phValueString);
           	%OutputText = strcat(OutputText, ' S/No= ');
            %OutputText = strcat(OutputText, num2str(iterate));
            %OutputText = strcat(OutputText, ' PH= ');
            %OutputText = strcat(OutputText, num2str(phValue));
            %OutputText = strcat(OutputText, ' VALUE= ');
            %OutputText = strcat(OutputText, 'SKIPPED');
            %OutputText = strcat(OutputText, '___');
            %output = string({'Skipping : ' iterate '->' data.(ii{1})(iterate:iterate)}); 
            dataMap.add(strcat('time=',num2str(currentPosition)));
            dataMap.add(strcat('phValue=', num2str(phValue)));
            %WriteLog(output);
            WriteOutput(outputPath,dataMap);
            
        end
    end
end

newFileLocation = 'tmp\ph_calculation.csv';

fid=fopen(newFileLocation,'w');

WriteLog('Writing all PH calculations.');
for index = 1:size(mainOutputText)
    fprintf(fid, '%i,%s \n', index , mainOutputText{index} );
end
fclose(fid);

readPhFile = mainOutputText;