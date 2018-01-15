% Get list of all BMP files in this directory
% DIR returns as a structure array.  You will need to use () and . to get
% the file names.

clear;clc;

sourceDirRoot = 'Z:\workspace\hooman\depthAutomationData\jordenFinal\';

%get all the folders in source dir
eval(sprintf('cd %s',sourceDirRoot));

directories = dir('p*');

for d = 1:6
    if d ~= 16 %skip p76_size folder
        
        %swich cd to where .b8 is
        eval(sprintf('cd %s',strcat(sourceDirRoot,directories(d).name)));
        
        
        imagefiles = dir('*.mat');
        nfiles = length(imagefiles);    % Number of files found
        
        for ii=1:nfiles
    
            load(imagefiles(ii).name);
            numberOfImages = size(temp2,3);
            
            val = zeros(820,574,numberOfImages);
            for i = 1:numberOfImages
                [wsh, val(:,:,i)] = extractBoneProbability_rect(temp2(:,:,i),4,3,2,3,'foroughi',[],[],[]);
            end
            
            
            tempHist = zeros(1,574,numberOfImages);
            for i =1:numberOfImages
                tempHist(:,:,i)=sum(val(:,:,i),1);
            end
            temp1 = reshape(tempHist(1,:,:),[574,numberOfImages]);
            
            val2 = transpose(temp1);

            save(strcat('hist_4_3_2_3_',imagefiles(ii).name), 'val2');
            
            clear('temp2','temp1','val2','val');
        end

       
        
    end
end