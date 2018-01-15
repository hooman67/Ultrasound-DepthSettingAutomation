function [b8Data header] = load_b8(filename)
% Jeffrey Abeysekera
% University of British Columbia
% July 2009
% Process a .b8 file from ultrasonix and return the data, b8Data, and 
% the header information in a struct, header

fid = fopen(filename,'r');
file_header = fread(fid,19,'int32');
header = struct(  'type', {file_header(1)}, ...
                    'frames', {file_header(2)}, ...
                    'width', {file_header(3)}, ...
                    'height', {file_header(4)}, ...
                    'samplesize', {file_header(5)}, ...
                    'upperleftx', {file_header(6)}, ...
                    'upperlefty', {file_header(7)}, ...
                    'upperrightx', {file_header(8)}, ...
                    'upperrighty', {file_header(9)}, ...
                    'bottomrightx', {file_header(10)}, ...
                    'bottomrighty', {file_header(11)}, ...
                    'bottomleftx', {file_header(12)}, ...
                    'bottomlefty', {file_header(13)}, ...
                    'probe', {file_header(14)}, ...
                    'txfrequency', {file_header(15)}, ...
                    'samplefrequency', {file_header(16)}, ...
                    'framerate', {file_header(17)}, ...
                    'linedensity', {file_header(18)}, ...
                    'extra',{file_header(19)}, ...
                    'extra1',{0} );
nFrames  = header.frames;      % number of frames
nLines   = header.width;       % number of lines
lLength  = header.height;      % length of each line in samples

% read b8 data from file
for frame_count = 1:nFrames
    v = fread(fid,nLines*lLength,'uchar');
    b8Data(:,:,frame_count) = reshape(v,nLines,lLength);
end

% close file
fclose(fid);

% cut out blank areas and leave only image data
ulx = header.upperleftx;
uly = header.upperlefty;
brx = header.bottomrightx;
bry = header.bottomrighty;

% HS
%b8Data = b8Data(ulx+4:brx-1,uly+1:bry+1)';


% 
% figure;
% imagesc(b8Data);
% colormap gray;
% title('8 bit Bmode Image');