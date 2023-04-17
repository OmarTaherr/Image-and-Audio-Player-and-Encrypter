function varargout = project(varargin)
%PROJECT MATLAB code file for project.fig
%      PROJECT, by itself, creates a new PROJECT or raises the existing
%      singleton*.
%
%      H = PROJECT returns the handle to a new PROJECT or the handle to
%      the existing singleton*.
%
%      PROJECT('Property','Value',...) creates a new PROJECT using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to project_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      PROJECT('CALLBACK') and PROJECT('CALLBACK',hObject,...) call the
%      local function named CALLBACK in PROJECT.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project

% Last Modified by GUIDE v2.5 04-Feb-2023 22:15:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_OpeningFcn, ...
                   'gui_OutputFcn',  @project_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before project is made visible.
function project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in in.
function in_Callback(hObject, eventdata, handles)
% hObject    handle to in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[file,path]=uigetfile();
fullname=strcat(path,file);
img=imread(fullname);
imgg=rgb2gray(img);
imge=imnoise(img,"gaussian",.1,.7); 
axes(handles.axes1);
imshow(img)
axes(handles.axes2);
imshow(imgg)
axes(handles.axes3);
imshow(imge)

[file,path]=uigetfile();
fullpath=strcat(path,file);

global y
global fs
[y,fs]=audioread(fullpath);

global x
x=audioplayer(y,fs);
% --- Executes on button press in pause.
function pause_Callback(hObject, eventdata, handles)
% hObject    handle to pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x
pause(x)

% --- Executes on button press in resume.
function resume_Callback(hObject, eventdata, handles)
% hObject    handle to resume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x
resume(x)

% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x
stop(x)

% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x
play(x)

% --- Executes on button press in orig.
function orig_Callback(hObject, eventdata, handles)
% hObject    handle to orig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of orig
global x
global y
global fs

set(handles.orig,'value',1);
set(handles.encr,'value',0);
set(handles.speed5,'enable','on');
set(handles.speed10,'enable','on');
set(handles.speed15,'enable','on');
set(handles.speed20,'enable','on');
set(handles.speed5,'value',0);
set(handles.speed10,'value',1);
set(handles.speed15,'value',0);
set(handles.speed20,'value',0);
x=audioplayer(y,fs);
resume(x);

% --- Executes on button press in encr.
function encr_Callback(hObject, eventdata, handles)
% hObject    handle to encr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of encr
global x
global y
global fs
set(handles.orig,'value',0);
set(handles.encr,'value',1);
set(handles.speed5,'enable','off');
set(handles.speed10,'enable','on');
set(handles.speed15,'enable','off');
set(handles.speed20,'enable','off');
set(handles.speed5,'value',0);
set(handles.speed10,'value',1);
set(handles.speed15,'value',0);
set(handles.speed20,'value',0);
x=audioplayer(y.*50,fs);
resume(x);

% --- Executes on button press in speed5.
function speed5_Callback(hObject, eventdata, handles)
% hObject    handle to speed5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y
global fs
global x
set(handles.speed5,'value',1);
set(handles.speed10,'value',0);
set(handles.speed15,'value',0);
set(handles.speed20,'value',0);
x=audioplayer(y,fs*0.5);
resume(x);
% Hint: get(hObject,'Value') returns toggle state of speed5


% --- Executes on button press in speed10.
function speed10_Callback(hObject, eventdata, handles)
% hObject    handle to speed10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y
global fs
global x
set(handles.speed5,'value',0);
set(handles.speed10,'value',1);
set(handles.speed15,'value',0);
set(handles.speed20,'value',0);
x=audioplayer(y,fs*1);
resume(x);

% Hint: get(hObject,'Value') returns toggle state of speed10


% --- Executes on button press in speed15.
function speed15_Callback(hObject, eventdata, handles)
% hObject    handle to speed15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y
global fs
global x
set(handles.speed5,'value',0);
set(handles.speed10,'value',0);
set(handles.speed15,'value',1);
set(handles.speed20,'value',0);
x=audioplayer(y,fs*1.5);
resume(x);

% Hint: get(hObject,'Value') returns toggle state of speed15


% --- Executes on button press in speed20.
function speed20_Callback(hObject, eventdata, handles)
% hObject    handle to speed20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y
global fs
global x
set(handles.speed5,'value',0);
set(handles.speed10,'value',0);
set(handles.speed15,'value',0);
set(handles.speed20,'value',1);
x=audioplayer(y,fs*2);
resume(x);

% Hint: get(hObject,'Value') returns toggle state of speed20
