function varargout = image_filter(varargin)
%IMAGE_FILTER MATLAB code file for image_filter.fig
%      IMAGE_FILTER, by itself, creates a new IMAGE_FILTER or raises the existing
%      singleton*.
%
%      H = IMAGE_FILTER returns the handle to a new IMAGE_FILTER or the handle to
%      the existing singleton*.
%
%      IMAGE_FILTER('Property','Value',...) creates a new IMAGE_FILTER using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to image_filter_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      IMAGE_FILTER('CALLBACK') and IMAGE_FILTER('CALLBACK',hObject,...) call the
%      local function named CALLBACK in IMAGE_FILTER.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help image_filter

% Last Modified by GUIDE v2.5 13-Mar-2018 11:04:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @image_filter_OpeningFcn, ...
                   'gui_OutputFcn',  @image_filter_OutputFcn, ...
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


% --- Executes just before image_filter is made visible.
function image_filter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for image_filter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes image_filter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = image_filter_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Title.
function Title_Callback(hObject, eventdata, handles)
% hObject    handle to Title (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Title.
function Title_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Title (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%% --- Executes on button press in pushbutton_info1.
%% 显示保存图像信息按钮的回调函数
function pushbutton_info1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_info1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% 显示进度条
h = waitbar(0,'Please wait...');
steps = 100;
for step = 1:steps
    % computations take place here
    waitbar(step / steps)
end
close(h) 
%%
imageinfo(handles.axes_image1);% 获取并显示图像信息


%% --- Executes on button press in pushbutton_save.
%% 保存图像按钮的回调函数
function pushbutton_save_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file path]= uiputfile('*.jpg','Save Image as');%保存函数的窗口
save_path=[path file]; % 保存图像的路径
imwrite(handles.img,char(save_path),'jpg');% 保存图像


%% --- Executes on button press in pushbutton_info0.
%% 原始图像信息的回调函数
function pushbutton_info0_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_info0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% 载入进度条
h = waitbar(0,'Please wait...');
steps = 100;
for step = 1:steps
    % computations take place here
    waitbar(step / steps)
end
close(h) 
%% 获取图像信息
imageinfo(handles.file);


%% --- Executes on button press in pushbutton_load.
%% 载入图像按钮
function pushbutton_load_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file, path]=uigetfile({'*.jpg';'*.bmp';'*.jpeg';'*.png'}, 'Load Image File within Avilable Extensions');% 选择图像对话窗口
image_path=[path file];% 获取图像的路径
handles.file=image_path;
handles.image = imread(image_path);% 读取图像
if (file==0)
    warndlg('You did not selected any file ') ; % fille is not selected
end

 [fpath, fname, fext]=fileparts(file);
 validex=({'.bmp','.jpg','.jpeg','.png'});
 found=0;
 
 for x = 1:length(validex)
     if(strcmpi(fext,validex{x})) % 判断图像格式
         found = 1;
         handles.img = imread(image_path);
         %% 进度条显示
         h = waitbar(0,'Please wait...');
         steps = 100;
         for step = 1:steps
             waitbar(step/steps)
         end
         
         close(h)
         %% 在坐标轴中显示图像
         axes(handles.axes_image0);cla;imshow(handles.img);
         axes(handles.axes_image1);cla;imshow(handles.img);
         
         guidata(hObject,handles);
         break;
         
     end
     
 end
 
 if(found==0)
     errordlg('Selected file does not match available extensions. Please select file from available extensions [ .jpg, .jpeg, .bmp, .png] ','Image Format Error');
 end
 %% 显示图像的灰度分布
 set(handles.axes_grayscale0,'Visible','on');
 set(handles.axes_grayscale1,'Visible','on');
 
 img_size = size(handles.img);
if numel(img_size) > 2 
    %% 图像为彩色图像
    %--- 更改坐标轴的title ------%
    set(handles.text_title0, 'String', 'RGB Component of Orignal Image');
    set(handles.text_title1, 'String', 'RGB Component of Filtered Image');
    %--------------------%
    r=handles.image(:,:,1);
    g=handles.image(:,:,2);
    b=handles.image(:,:,3);
    x=size(r); 
    x=(1:x(1,2));
    r=r(1,:); g=g(1,:); b=b(1,:);
    axes(handles.axes_grayscale0); plot(x,r,'r');hold on  % 绘制图像的颜色成分
    plot(x,g,'g'); plot(x,b,'b'); hold off;
else
    %% 图像为灰度图像
    %--- 更改坐标轴的title ------%
    set(handles.text_title0, 'String', 'Grayscale of Orignal Image');
    set(handles.text_title1, 'String', 'Grayscale of Filtered Image');
    %% 绘制灰度图像成分
    x=(1:img_size(1,2));
    r=handles.image(1,:);
    axes(handles.axes_grayscale0); plot(x,r,'r');
end
%% 更新图像成分曲线绘制
updateAxes_grayscale1(handles)


%% --- Executes on button press in pushbutton_filter.
%% 图像滤波
function pushbutton_filter_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
method_number = get(handles.popupmenu_filter,'Value'); % selected method（获取滤波器种类选择按钮的索引）
switch method_number
    case 1   % guassian
%         set(handles.text_parameter1, 'String', 'Sigma');
%         set(handles.text_parameter2, 'String', 'Mask Size');
%         handles.sigma = get(handles.parameter1, 'Value');
%         handles.masksize = get(handles.parameter2, 'Value');
        % handles.options = 'symmetric';
        handles.filter = fspecial('gaussian',handles.masksize,handles.sigma);% 滤波器设计
        handles.img = imfilter(handles.img,handles.filter); % 图像滤波
    case 2  % Laplace
        handles.filter = fspecial('laplacian',handles.alpha);
        handles.img = imfilter(handles.img,handles.filter);
    case 3  % unsharp
        handles.filter = fspecial('unsharp',handles.alpha);
        handles.img = imfilter(handles.img,handles.filter);
    case 4 % wiener
        img_size = size(handles.img);
        if numel(img_size) > 2
            handles.img = rgb2gray(handles.img);
%             handles.img(:,:,1) = wiener2(handles.img(:,:,1),[handles.masksize handles.masksize]);
%             handles.img(:,:,2) = wiener2(handles.img(:,:,2),[handles.masksize handles.masksize]);
%             handles.img(:,:,3) = wiener2(handles.img(:,:,3),[handles.masksize handles.masksize]);
        else
            handles.img = wiener2(handles.img,[handles.masksize handles.masksize]);
        end
       % handles.img = wiener2(handles.img,[handles.masksize handles.masksize]);
    case 5
        
%         [Gmag,Gdir] = imgradient(handles.img,handles.method);
%         handles.img = Gmag;
        img_size = size(handles.img);
        if numel(img_size) > 2
%             handles.img(:,:,1) = imgradient(handles.img(:,:,1),handles.method);
%             handles.img(:,:,2) = imgradient(handles.img(:,:,2),handles.method);
%             handles.img(:,:,3) = imgradient(handles.img(:,:,3),handles.method);
            handles.img = rgb2gray(handles.img);
        else
            [Gmag, Gdir] = imgradient(handles.img,handles.method);
            handles.img = uint8(Gmag);
            % handles.img = imgradient(handles.img,'prewitt');
        end
        
end

axes(handles.axes_image1);cla;imshow(handles.img,[]);% 更新显示滤波后的图像
updateAxes_grayscale1(handles);% 更新图像成分坐标图
guidata(hObject,handles);


%% --- Executes on button press in pushbutton_reset.
%% 重置按钮
function pushbutton_reset_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.img=handles.image;
axes(handles.axes_image1); cla; imshow(handles.img);
updateAxes_grayscale1(handles);
guidata(hObject,handles);


%% --- Executes on selection change in popupmenu_filter.
%% 滤波器选择按钮
function popupmenu_filter_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_filter contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_filter
method_number = get(handles.popupmenu_filter,'Value'); % 获取滤波器种类索引

%% 根据选择的滤波器不同，设置控件的不同属性
switch method_number
    case 1   % gaussian filter
        set(handles.text_parameter1, 'Enable', 'on');
        set(handles.parameter1, 'Enable', 'on');
        set(handles.text_parameter1, 'String', 'Sigma');
        set(handles.parameter1, 'String', '0.5');
        set(handles.parameter1, 'Value', 0.5);
        set(handles.text_parameter2, 'String', 'Mask Size');
        set(handles.text_parameter2, 'Visible', 'on');
        set(handles.parameter2, 'Visible', 'on')
        set(handles.parameter2, 'String', {'3x3';'5x5';'7x7';'9x9';'11x11'});
        handles.sigma = get(handles.parameter1, 'Value');
        handles.masksize = get(handles.parameter2, 'Value');
        handles.options = 'replicate';
%         handles.filter = fspecial('gaussian',handles.masksize,handles.sigma);       
    case {2,3}    % laplace/unsharp
        set(handles.text_parameter1, 'Enable', 'on');
        set(handles.parameter1, 'Enable', 'on');
        set(handles.text_parameter1, 'String', 'Alpha');
        set(handles.parameter1, 'String', '0.2');
        set(handles.parameter1, 'Value', 0.2);
        set(handles.text_parameter2, 'Visible', 'off');
        set(handles.parameter2, 'Visible', 'off')
        handles.alpha = get(handles.parameter1, 'Value');
    case 4
        set(handles.text_parameter1, 'String', 'Sigma');
        set(handles.text_parameter2, 'String', 'Mask Size');
        set(handles.text_parameter1, 'Enable', 'off');
        set(handles.parameter1, 'Enable', 'off');
        set(handles.text_parameter2, 'Visible', 'on');
        set(handles.parameter2, 'Visible', 'on')
        set(handles.parameter2, 'String', {'3x3';'5x5';'7x7';'9x9'; '11x11'});
        handles.masksize = get(handles.parameter2, 'Value');
    case 5
        set(handles.text_parameter1, 'String', 'Sigma');
        set(handles.text_parameter2, 'String', 'Mask Size');
        set(handles.text_parameter1, 'Enable', 'off');
        set(handles.parameter1, 'Enable', 'off');
        set(handles.text_parameter2, 'Visible', 'on');
        set(handles.parameter2, 'Visible', 'on')
        set(handles.parameter2, 'String', {'sobel';'prewitt';'central';'intermediate';'roberts'});
        handles.method = 'sobel';
end
guidata(hObject,handles);

%% --- Executes during object creation, after setting all properties.
function popupmenu_filter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%% --- Executes on button press in pushbutton_gauss.
%% 给图像添加高斯噪声
function pushbutton_gauss_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_gauss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.img = imnoise(handles.img,'gaussian');
axes(handles.axes_image1); cla; imshow(handles.img); % 更新显示添加噪声后的图像
guidata(hObject,handles);
updateAxes_grayscale1(handles); % 更新显示图像成分曲线


%% --- Executes on button press in pushbutton_poisson.
%% 给图像添加泊松噪声
function pushbutton_poisson_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_poisson (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% h = waitbar(0,'Please wait...');
% steps = 200;
% for step = 1:steps
%     % computations take place here
%     waitbar(step / steps)
% end
% close(h) 
handles.img = imnoise(handles.img,'poisson');
axes(handles.axes_image1); cla; imshow(handles.img);
guidata(hObject,handles);
updateAxes_grayscale1(handles);

%% --- Executes on button press in pushbutton_salt.
%% 给图像添加椒盐噪声
function pushbutton_salt_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_salt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.img = imnoise(handles.img,'salt & pepper',0.02);
axes(handles.axes_image1); cla; imshow(handles.img);
guidata(hObject,handles);
updateAxes_grayscale1(handles);

%% --- Executes on button press in pushbutton_speckle.
%% 给图像添加斑点噪声
function pushbutton_speckle_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_speckle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.img = imnoise(handles.img,'speckle',0.04);
axes(handles.axes_image1); cla; imshow(handles.img);
guidata(hObject,handles);
updateAxes_grayscale1(handles);

%% 更新图像成分曲线
function updateAxes_grayscale1(handles)
img_size = size(handles.img);
if numel(img_size) > 2
    set(handles.text_title0, 'String', 'RGB Component of Orignal Image');
    set(handles.text_title1, 'String', 'RGB Component of Filtered Image');
    r=handles.img(:,:,1);
    g=handles.img(:,:,2);
    b=handles.img(:,:,3);
    x=size(r); 
    x=(1:x(1,2));
    r=r(1,:); g=g(1,:); b=b(1,:);
    axes(handles.axes_grayscale1); plot(x,r,'r');hold on
    plot(x,g,'g'); plot(x,b,'b'); hold off;
else
    set(handles.text_title0, 'String', 'Grayscale of Orignal Image');
    set(handles.text_title1, 'String', 'Grayscale of Filtered Image');
    x=(1:img_size(1,2));
    r=handles.img(1,:);
    axes(handles.axes_grayscale1); plot(x,r,'r');
end



function parameter1_Callback(hObject, eventdata, handles)
% hObject    handle to parameter1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of parameter1 as text
%        str2double(get(hObject,'String')) returns contents of parameter1 as a double

method_number = get(handles.popupmenu_filter,'Value');
str = get(hObject,'String');
set(hObject, 'Value', str2double(str));
%% 根据不同的滤波器种类设置参数的类型
switch method_number
    case 1
        handles.sigma = get(hObject, 'Value');% 高斯滤波器，该参数为sigma
    case {2,3}
        handles.alpha = get(hObject, 'Value');% 拉普拉斯滤波器，该参数为alpha
end
guidata(hObject,handles);

%% --- Executes during object creation, after setting all properties.
%% 初始化该控件的状态
function parameter1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to parameter1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'String', '0.5');
set(hObject, 'Value', 0.5);
handles.sigma = get(hObject, 'Value');
guidata(hObject,handles);


%% --- Executes on selection change in parameter2.
%% 第二个参数设置
function parameter2_Callback(hObject, eventdata, handles)
% hObject    handle to parameter2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns parameter2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from parameter2
method_number = get(handles.popupmenu_filter,'Value');

%% 根据滤波器的种类设置参数的类型
switch method_number
    case {1,4} % 滤波器的参数为滤波器的size
        value = get(hObject, 'Value');
        if value == 1
            handles.masksize = 3;
        elseif value == 2
            handles.masksize = 5;
        elseif value == 3
            handles.masksize = 7;
        elseif value == 4
            handles.masksize = 9;
        elseif value == 5
            handles.masksize = 11;
        end
    case 5 % 参数为梯度滤波器的种类
        value = get(hObject, 'Value');
        if value == 1
            handles.method = 'sobel';
        elseif value == 2
            handles.method = 'prewitt';
        elseif value == 3
            handles.method = 'central';
        elseif value == 4
            handles.method = 'intermediate';
        elseif value == 5
            handles.method = 'roberts';
        end
end
guidata(hObject,handles);

%% --- Executes during object creation, after setting all properties.
%% 初始化该控件的状态
function parameter2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to parameter2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.masksize = 3;
guidata(hObject,handles);


