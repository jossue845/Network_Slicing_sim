function varargout = resultado(varargin)
% RESULTADO MATLAB code for resultado.fig
%      RESULTADO, by itself, creates a new RESULTADO or raises the existing
%      singleton*.
%
%      H = RESULTADO returns the handle to a new RESULTADO or the handle to
%      the existing singleton*.
%
%      RESULTADO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESULTADO.M with the given input arguments.
%
%      RESULTADO('Property','Value',...) creates a new RESULTADO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before resultado_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to resultado_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help resultado

% Last Modified by GUIDE v2.5 23-Aug-2022 21:30:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @resultado_OpeningFcn, ...
                   'gui_OutputFcn',  @resultado_OutputFcn, ...
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


% --- Executes just before resultado is made visible.
function resultado_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to resultado (see VARARGIN)

% Choose default command line output for resultado
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes resultado wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = resultado_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
load('Simulacion.mat')
set(handles.axes1, 'Visible', 'On')
set(handles.axes2, 'Visible', 'On')
set(handles.axes3, 'Visible', 'On')
set(handles.axes4, 'Visible', 'On')
set(handles.axes5, 'Visible', 'On')
axes(handles.axes1);
plot(vecTiempo, revenue)
title("Ingresos vs. tiempo"), ylabel("Ingresos"), xlabel("Tiempo")
grid minor
axes(handles.axes2);
stairs(vecTiempo, te, 'b')
title("Trafico eMMB vs. tiempo"), ylabel("Número de solicitudes"), xlabel("Tiempo")
grid on
axes(handles.axes4);
stairs(vecTiempo, tm, 'r')
title("Trafico mMTC vs. tiempo"), ylabel("Número de solicitudes"), xlabel("Tiempo")
grid on
axes(handles.axes5);
stairs(vecTiempo, tu, 'm')
title("Trafico URLLC vs. tiempo"), ylabel("Número de solicitudes"), xlabel("Tiempo")
grid on
axes(handles.axes3);
plot(vecTiempo, accratio, 'k')
title("Tasa de aceptación acumulada"), ylabel("Aceptación [%]"), xlabel("Tiempo")
axis([0 timeSlotTotal 0 1.2])
grid minor
%save('Resultado', 'te', 'tu', 'tm', 'revenue', 'accratio')

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
