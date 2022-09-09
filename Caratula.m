function varargout = Caratula(varargin)
% CARATULA MATLAB code for Caratula.fig
%      CARATULA, by itself, creates a new CARATULA or raises the existing
%      singleton*.
%
%      H = CARATULA returns the handle to a new CARATULA or the handle to
%      the existing singleton*.
%
%      CARATULA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CARATULA.M with the given input arguments.
%
%      CARATULA('Property','Value',...) creates a new CARATULA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Caratula_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Caratula_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Caratula

% Last Modified by GUIDE v2.5 11-Aug-2022 23:08:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Caratula_OpeningFcn, ...
    'gui_OutputFcn',  @Caratula_OutputFcn, ...
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


% --- Executes just before Caratula is made visible.
function Caratula_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Caratula (see VARARGIN)

% Choose default command line output for Caratula
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Caratula wait for user response (see UIRESUME)
% uiwait(handles.figure1);
[im,map] = imread('BUHO.png');
[in,nap] = imread('LOGO.png');



axes(handles.axes1);
imshow(im,map);
axes(handles.axes2);
imshow(in,nap);

% --- Outputs from this function are returned to the command line.
function varargout = Caratula_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
GuiFig; %llamo a la siguiente ventana
closereq;       %Close the actual GUI
