function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 01-Jul-2013 13:52:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
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

    % Browse for the image file.
    [baseFileName, folder] = uigetfile('*.*', 'Specify an image file');

    % Create the full file name.
    fullImageFileName = fullfile(folder, baseFileName);
    
    set( handles.image_path ,'String', fullImageFileName );
    
    showGridImage(handles, imread(fullImageFileName));
    

function image_path_Callback(hObject, eventdata, handles)
% hObject    handle to image_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of image_path as text
%        str2double(get(hObject,'String')) returns contents of image_path as a double


% --- Executes during object creation, after setting all properties.
function image_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to image_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over image_path.
function image_path_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to image_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function num_rows_Callback(hObject, eventdata, handles)
% hObject    handle to num_rows (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num_rows as text
%        str2double(get(hObject,'String')) returns contents of num_rows as a double


% --- Executes during object creation, after setting all properties.
function num_rows_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num_rows (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function num_cols_Callback(hObject, eventdata, handles)
% hObject    handle to num_cols (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num_cols as text
%        str2double(get(hObject,'String')) returns contents of num_cols as a double


% --- Executes during object creation, after setting all properties.
function num_cols_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num_cols (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on image_path and none of its controls.
function image_path_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to image_path (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function showGridImage(handles, url)
    
    num_region_rows = str2double( get( handles.num_rows, 'String' ) );
    num_region_cols = str2double( get( handles.num_cols, 'String' ) );

    a = showGridMeasure( url, num_region_rows, num_region_cols, ...
                            0:num_region_rows*num_region_cols-1);
    imshow(a);
%     image(a)
%     axis image
    
    %# grid domains
%     xg = 0:50:200;
%     yg = 0:50:200;
%     %# label coordinates
%     [xlbl, ylbl] = meshgrid(xg+25, yg+25);
%     %# create cell arrays of number labels
%     lbl = strtrim(cellstr(num2str((1:numel(xlbl))')));
%     
%     text(xlbl(:), ylbl(:), lbl(:),'color','w',...
%         'HorizontalAlignment','center','VerticalAlignment','middle');

    
    axes(handles.axes1);
    
%     imshow( showGridMeasure( url, num_region_rows, num_region_cols, ...
%                             0:num_region_rows*num_region_cols-1) );

                        
                      



function correct_samples_Callback(hObject, eventdata, handles)
% hObject    handle to correct_samples (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of correct_samples as text
%        str2double(get(hObject,'String')) returns contents of correct_samples as a double


% --- Executes during object creation, after setting all properties.
function correct_samples_CreateFcn(hObject, eventdata, handles)
% hObject    handle to correct_samples (see GCBO)
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

    correct_regions = str2num(get( handles.correct_samples, 'String' ))
    %correct_regions = correct_regions+1;
    num_region_rows = str2double( get( handles.num_rows, 'String' ) );
    num_region_cols = str2double( get( handles.num_cols, 'String' ) );
    
    % number of lbp/histogram 
    radii = [ 3 6 9 12 ];
    
    fullImageFileName = get( handles.image_path ,'String' );
    
    image =  imread(fullImageFileName);
    
    computeRejectedRegions(handles, image, correct_regions, radii, num_region_rows, num_region_cols )



function computeRejectedRegions(handles, image, correct_regions, radii, num_region_rows, num_region_cols )

    % map the value to uniform implementation
    mapping = getmapping(8,'u2');

    descriptor = getMLBPDescriptor( image, mapping, radii, num_region_rows, num_region_cols );

    A = zeros( size(descriptor) );

    for i = 1:size(descriptor, 1)
       for j = 1:size(descriptor, 1)
           A(i,j) = getNormalizedCorrelation( descriptor(i, : ), descriptor( j, : ) );
       end
    end

    correct_correlation = A( correct_regions+1, correct_regions+1 );
    correct_mean = mean2( correct_correlation )
    correct_std = std2( correct_correlation )

    reject = zeros( num_region_rows*num_region_cols, 1 );
    accept = zeros( num_region_rows*num_region_cols, 1 );

    for k = 0:( num_region_rows*num_region_cols-1 )
        if any( k ~= correct_regions )
            test_mean = mean2( A( k+1, correct_regions+1 ) );
            % test_std = std2( A(k+1,correct_regions+1) );
            if ( test_mean <= ( correct_mean - 3*correct_std ) || ...
                    test_mean >= ( correct_mean + 3*correct_std ) )
                % reject
                reject(k+1) = k;
            else
                % accept
                accept(k+1) = k;
            end
        end
    end

    reject = find( reject(:) ~= 0 ) - 1;
    reject = reject'
    
    axes(handles.axes1);
    out = writeResults( image, num_region_rows, num_region_cols, correct_regions, reject );

    imshow(out);
