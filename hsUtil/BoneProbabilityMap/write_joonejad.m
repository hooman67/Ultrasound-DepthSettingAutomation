
RefrenceUSFile= listing(7).name;
FileNumberString=RefrenceUSFile(1:2);
%     EnhancedUSFile='rw_foroughi_OR11.mha';
EnhancedUSFile= cell2mat(name_array(i))
OutputFile= [EnhancedUSFile(1:end-4),'_SEQ','.mha'];
% read header
fid_input=fopen(RefrenceUSFile,'rb');
if(fid_input<0)
    fprintf('could not open file %s\n',RefrenceUSFile);
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
file_info=mha_read_header(RefrenceUSFile);
disp('Reference Header OK');
US=mha_read_volume(EnhancedUSFile);
disp('Enhanced Volume OK');

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
fid=fopen(OutputFile, 'w');
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

%mha_write_volume('C:\home\temp\BPM_Ilker\testOutput.mha',pixelWithMetaStruct, true)
