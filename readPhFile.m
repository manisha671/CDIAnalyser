function readPhFile = readPhFile(filePath)
%'C:\Matlab\CDIAnalyzer\data\test\ph_file.csv'
readData = readtable(filePath);
var = readData.Properties.VariableNames;
data = readData;

fileSize = size(data);

delay = 20;
valueM = 0.00000000001; % ???

e= 1.602e-19;

kB= 1.38e-23;

T= 298;

H = 5.5986 * 10^18;

NA= 6.02e23;

multi= e*NA;

J = (e^2)/(kB * T);

valueL = NA * 1000 * H;

OH = 10; % ???

N = NA * 1000 * OH;


for ii=var
    for iterate = 1:fileSize(1)
        if iterate > delay && ( string(ii(1)) == 'value')
            currentPosition = iterate;
            phValueString = data.(ii{1})(currentPosition:currentPosition);
            %phValueString = data;
            phValue = double(phValueString);
            
            valueK = 10^(-1 * (phValue + (currentPosition/60)));
            goalValue = J * ((valueK * valueL)+ (valueM/(valueK * N)) ); 
             
            disp(   string({'PH : ' phValue ' Output : ' goalValue}));
        elseif iterate <= delay && ( string(ii(1)) == 'value')
           disp(string({'Skipping : ' iterate '->' data.(ii{1})(iterate:iterate)})) 
        end
    end
end

