%% Calculate bone probability map of US slice stack using LPT filter presented by Hacihaliloglu et al.
% The bpm slilces are saved as mha files keeping the associated tracking
% information for volume reconstruction

% fileNames{1} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-5-27-12-9\RecordedImg000000001302F040.mha';
% fileNames{2} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-5-27-13-5\RecordedImg0000000022AF42E0.mha';
% %fileNames{3} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-5-27-13-5\RecordedImg0000000022D3A470.mha';
% fileNames{3} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-5-27-13-39\RecordedImg00000000223AFB20.mha';
fileNames{1} = '\\smbhome\rcl\shared\images\Spine Injection Study Data-Saint Pauls\#05_2014-5-29-12-49\RecordedImg000000002367FE50.mha';
% fileNames{4} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-5-29-13-23\RecordedImg0000000023222EC0.mha';
% fileNames{5} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-5-29-13-46\RecordedImg0000000022E5A970.mha';
% fileNames{1} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-9-16-13-10\RecordedImg000000002106C840.mha';
% fileNames{2} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-9-16-13-46\RecordedImg000000002106B340.mha';
% fileNames{3} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-9-16-14-13\RecordedImg0000000020ADEA90.mha';
% fileNames{4} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-9-18-12-24\RecordedImg00000000213F34B0.mha';
% fileNames{5} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-9-18-12-59\RecordedImg0000000012977850.mha';
%fileNames{1} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-9-18-13-30\RecordedImg0000000012D8FD50.mha';

% saveFileNames{1} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-5-27-12-9\processed\lpt_bpmSlices.mha';
% saveFileNames{2} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-5-27-13-5\processed\lpt_bpmSlices1.mha';
% %saveFileNames{3} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-5-27-13-5\processed\lpt_bpmSlices2.mha';
% saveFileNames{3} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-5-27-13-39\processed\lpt_bpmSlices.mha';
saveFileNames{1} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-5-29-12-49\processed\lpt_bpmSlices.mha';
% saveFileNames{4} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-5-29-13-23\processed\lpt_bpmSlices.mha';
% saveFileNames{5} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-5-29-13-46\processed\lpt_bpmSlices.mha';
% saveFileNames{1} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-9-16-13-10\processed\lpt_bpmSlices.mha';
% saveFileNames{2} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-9-16-13-46\processed\lpt_bpmSlices.mha';
% saveFileNames{3} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-9-16-14-13\processed\lpt_bpmSlices.mha';
% saveFileNames{4} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-9-18-12-24\processed\lpt_bpmSlices.mha';
% saveFileNames{5} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-9-18-12-59\processed\lpt_bpmSlices.mha';
%saveFileNames{1} = 'R:\shared\images\Spine Injection Study Data-Saint Pauls\2014-9-18-13-30\processed\lpt_bpmSlices.mha';

% [fileName pathName] = uigetfile('*.*');

for i=1:size(fileNames,2)
% read header
fid_input=fopen(fileNames{i},'rb');
if(fid_input<0)
    fprintf('could not open file %s\n',fileNames{i});
    return
end

readelementdatafile=false;
header = '';
while(~readelementdatafile)
    str=fgetl(fid_input);
    s=find(str=='=',1,'first');
    if(~isempty(s) )
        type=str(1:s-1); 
        data=str(s+1:end);
        while(type(end)==' '); type=type(1:end-1); end
        if(sum(isstrprop(data, 'wspace')) == length(data))
            data = '??';
        else
            while(data(1)==' '); data=data(2:end); end
        end
    else
        type=''; data=str;
    end

    header = strcat(header,str);
    header = strcat(header,'\n');
    
    if strcmp(type,'ElementDataFile')
       readelementdatafile=true;
    end
end

% read data
file_info=mha_read_header(fileNames{i});
disp('Header OK');
US=mha_read_volume(file_info);
disp('Volume OK');

% permute US volume such that image orientation fits requirements of
% algorithm (probe at top of image pointing downwards)
US = permute(US,[2,3,1]);
% initialize volume for bone probability map
LPTvol = US;
for slice=1:size(US,3)
    imageUS = flipud(US(:,:,slice));
    LPTvol(:,:,slice) = flipud(lpt(double(imageUS)));
end
% reorient resulting bone probability map such that it can consistently be
% shown in the slicer RAS coordinate system
LPTvol = permute(LPTvol,[3,1,2]);
% for slice=1:size(LPTvol,3)
%      LPTvol(:,:,slice) = fliplr(flipud(LPTvol(:,:,slice)));
% end
% origin has to be moved due to inconsistent coordinate systems in Slicer
% (RAS) and VTK (LPS). The flipping information of the first two axis
% available during runtime in Slicer get lost when saving as a VTK image.

% normalize between 0 and 1 and convert to double
% LPTvol = double(LPTvol)/255;
% header = strrep(header, 'MET_UCHAR', 'MET_DOUBLE')

%origin = file_info.Origin;
% origin(1) = -origin(1);
% origin(2) = 0;
%writeVTK(LPTvol,origin,'C:\home\temp\BPM_Ilker\BPM.vtk', [1 1 1]);

 metaData = file_info;
 pixelData = LPTvol;
%   WRITE OUT VOLUME
fid=fopen(saveFileNames{i}, 'w');
DataType = class(pixelData);
% write meta data
% metaDataCellArr = struct2cell(metaData);
% fields = fieldnames(metaData);
% Print the header data to the output file
fprintf(fid,header);
% for i=1:numel(fields)
%     fprintf(fid,fields{i});
%     if ischar(metaDataCellArr{i})
%         fprintf(fid,' = %s\n',metaDataCellArr{i});
%     else
%         fprintf(fid,' = ');
%         fprintf(fid,'%d ',metaDataCellArr{i});
%         fprintf(fid,'\n');
%     end
% end
fwrite(fid, pixelData,DataType);
%fwrite(fid, metaData,DataType);
fclose('all');
end
%mha_write_volume('C:\home\temp\BPM_Ilker\testOutput.mha',pixelWithMetaStruct, true)
