function [err]=cmdCreateBonenessVolume(folder)
    %folder='c:\temp\data\';
    err=0;
    try
    disp('Reading file tmpInputUS.vtk');
    file_info=vtk_read_header([folder 'tmpInputUS.vtk']);
    disp('Header OK');
    file_data=vtk_read_volume(file_info);
    disp('Volume OK');
    boneness=[];
    parfor i=1:size(file_data,3)
        tmp0=imrotate(squeeze(file_data(:,:,i)),90);
%         disp(['rotated -90,' num2str(i)]);
%         [tmp1 tmp2]=extractBoneProbability(tmp0, 7, 0, 1);
        Mask = ones(size(tmp0));
        tmp1=extractBoneProbability(tmp0, 4, 2, 1.8, 1.5, Mask);
%         disp(['Probability map generated for ' num2str(i)]);
        boneness(:,:,i)=imrotate(tmp1,-90);
%         disp(['rotated 90, ' num2str(i)]);
%         subplot(1,2,1)
%         imagesc(tmp0);
%         subplot(1,2,2)
%         imagesc(boneness(:,:,i));
%         pause(0.01);
    end
    boneness(isnan(boneness)) = 0;
    disp(['Now saving ...']);
    writeVTK(boneness,file_info.Origin,[folder 'tmpBoneness.vtk'],file_info.PixelDimensions);
    disp(['Saved to tmpBoneness.vtk']);
    catch 
        err=-1
    end
end