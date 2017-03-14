function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 05-Mar-2017 11:51:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%set global variable
global e;
global 	kB;
global	T;
global	NA;
global	multi;
%diffusion coefficients
global	H;
global	OH;
global	Na;

%CALCULATION 
	%define calculation array
global	n
n= 5000;
global	time
time= [0:1:n];
global tm
tm = time./60;

setglobal();

disp(e);
WriteLog('open');


%e
% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function flow_rate_Callback(hObject, eventdata, handles)
% hObject    handle to flow_rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of flow_rate as text
%        str2double(get(hObject,'String')) returns contents of flow_rate as a double


% --- Executes during object creation, after setting all properties.
function flow_rate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to flow_rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName,FilterIndex] = uigetfile('*.*');
con_delay = str2num(get(handles.con_delay, 'String'));
%makeTable();
outputOfread = readConFile(strcat(PathName, FileName),con_delay);
disp(outputOfread);
set(findobj('Tag','output'),'String',outputOfread)




function printColumn(C,needle)




% --- Executes during object creation, after setting all properties.
function text4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function mean_electrode_mass_Callback(hObject, eventdata, handles)
% hObject    handle to mean_electrode_mass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mean_electrode_mass as text
%        str2double(get(hObject,'String')) returns contents of mean_electrode_mass as a double


% --- Executes during object creation, after setting all properties.
function mean_electrode_mass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mean_electrode_mass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ph_delay_Callback(hObject, eventdata, handles)
% hObject    handle to ph_delay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ph_delay as text
%        str2double(get(hObject,'String')) returns contents of ph_delay as a double


% --- Executes during object creation, after setting all properties.
function ph_delay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ph_delay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function con_delay_Callback(hObject, eventdata, handles)
% hObject    handle to con_delay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of con_delay as text
%        str2double(get(hObject,'String')) returns contents of con_delay as a double


% --- Executes during object creation, after setting all properties.
function con_delay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to con_delay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[FileName,PathName,FilterIndex] = uigetfile('*.*');
ph_delay = str2num(get(handles.ph_delay, 'String'));

WriteLog('Reading PH File');
outputOfread = readPhFile(strcat(PathName, FileName),ph_delay);
disp(outputOfread);
set(findobj('Tag','output'),'String',outputOfread);
while(1)
choice = menu('Please load Conductivity file...','OK','Cancel');
    if choice==1 || choice==0
        break;  
    else
        return
    end
end
%READ COonduc file
WriteLog('Reading Conductivity File');
pushbutton2_Callback(hObject, eventdata, handles);
while(1)
choice = menu('Please load EC file...','OK','Cancel');
    if choice==1 || choice==0
        break;  
    else
        return
    end
end
% READ EC File
WriteLog('Reading EC File');
pushbutton5_Callback(hObject, eventdata, handles);


%makeTable();  

% --- Executes on button press in pushbutton4.
function main(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
param = guidata(hObject)
flowrt = str2num(param.flow_rate.String);
mnemass = param.mean_electrode_mass.String;
phdelay = param.ph_delay.String;
condelay = param.con_delay.String;


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function clickGetConductivity(hObject, eventdata, handles)
getCellData('meam_ph');

% --- Executes on button press in pushbutton6.
function clickGetEC(hObject, eventdata, handles)
getCellData('ph_cnd')

function getCellData(tabname)
[FileName,PathName,FilterIndex] = uigetfile('*.txt');
PH='ph';
TIME='t';
CONDUCTIVITY = 'cond';
TPERMIN = 't/m';
maxColumn = 3;
td =dlmread(strcat(PathName, FileName),'\t')
disp(td(3,1));





function output_Callback(hObject, eventdata, handles)




function output_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)


function edit8_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton5_Callback(hObject, eventdata, handles)
[FileName,PathName,FilterIndex] = uigetfile('*.*');
outputOfread = readECFile(strcat(PathName, FileName));
disp(outputOfread);
set(findobj('Tag','output'),'String',outputOfread)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on selection change in graph_pop_menu_x_axis.
function graph_pop_menu_x_axis_Callback(hObject, eventdata, handles)
% hObject    handle to graph_pop_menu_x_axis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns graph_pop_menu_x_axis contents as cell array
%        contents{get(hObject,'Value')} returns selected item from graph_pop_menu_x_axis
%axesHandle = findobj(gcf,'Tag','ph_graph');
axesHandle = findobj('Tag','ph_graph');
axes(axesHandle);
switch get(handles.graph_pop_menu_x_axis,'Value')   
  case 2
    Array=csvread('tmp\ph_calculation.csv');
    col1 = Array(:, 1);
    col2 = Array(:, 2);
    plot(col1, col2) % plot(x,y) x is iteration y is value
  case 3
    Array=csvread('tmp\conductivity_calculation.csv');
    col1 = Array(:, 1);
    col2 = Array(:, 2);
    plot(col1, col2)
  case 4  
    t = linspace(-pi,pi, 350);
    X = t .* sin( pi * sin(t)./t);
    Y = -abs(t) .* cos( pi * sin(t)./t);
    plot(X,Y);
    fill(X, Y, 'r');
   otherwise
end


% --- Executes during object creation, after setting all properties.
function graph_pop_menu_x_axis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to graph_pop_menu_x_axis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
popupMenuHandleX = findobj(gcbf,'Tag','graph_pop_menu_x_axis');
popupMenuHandleY = findobj(gcbf,'Tag','graph_pop_menu_y_axis');
allParameters = {'Time'
                ,'PH'
                ,'Conductivity'
                ,'Water Conductivity'
                ,'Calibrated Conductivity'
                ,'Concentration'
                ,'Total Salt Removed'
                ,'Capacity'};
set(popupMenuHandleX,'String', allParameters );
set(popupMenuHandleY,'String', allParameters );

% --- Executes on selection change in graph_pop_menu_y_axis.
function graph_pop_menu_y_axis_Callback(hObject, eventdata, handles)
% hObject    handle to graph_pop_menu_y_axis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns graph_pop_menu_y_axis contents as cell array
%        contents{get(hObject,'Value')} returns selected item from graph_pop_menu_y_axis


% --- Executes during object creation, after setting all properties.
function graph_pop_menu_y_axis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to graph_pop_menu_y_axis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
popupMenuHandle = findobj(gcbf,'Tag','graph_pop_menu_y_axis');
set(popupMenuHandle,'String', {'time','PH','Conductivity'});
