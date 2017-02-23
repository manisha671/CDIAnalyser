function makeTable

clear
clc
close all

%// Create figure and uielements
handles.fig = figure('Position',[440 400 500 230]);

handles.DispButton = uicontrol('Style','Pushbutton','Position',[20 70 80 40],'String','Display table','Callback',@DispTableCallback);

%// Create table
LastName = {'Smith';'Johnson';'Williams';'Jones';'Brown'};
Age = [38;43;38;40;49];
Height = [71;69;64;67;64];
Weight = [176;163;131;133;119];
BloodPressure = [124 93; 109 77; 125 83; 117 75; 122 80];

handles.T = table(Age,Height,Weight,BloodPressure,'RowNames',LastName);

    function DispTableCallback(~,~)

        %// Place table in GUI
        uitable(handles.fig,'Data',handles.T{:,:},'ColumnWidth',{50},'ColumnName',{'Age','Height','Weight','BloodPressure'},...
            'RowName',LastName,'Position',[110 20 300 150]);


    end

end