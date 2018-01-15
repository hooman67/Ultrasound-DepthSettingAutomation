destDirRoot = 'Y:\workspace\hooman\depthAutomationData\Jason\bpmStudySet\';

imagefiles = dir('red_sl_*_p15.mat');
nfiles = length(imagefiles);    % Number of files found

for ii=1:nfiles
    
    %if the file is not too big to fit in ram here: 502594476 bytes
    if imagefiles(ii).bytes <= 502594476
        
        currentfilename = imagefiles(ii).name;
        
        load(imagefiles(ii).name);
        numberOfImages = size(im,3);
        
        
        
        
                val = zeros(820,574,numberOfImages);
        for i = 1:numberOfImages
            [wsh, val(:,:,i)] = extractBoneProbability_rect(im(:,:,i),12,12,12,6,'foroughi',[],[],[]);
        end
        
        
        tempHist = zeros(1,574,numberOfImages);
        for i =1:numberOfImages
            tempHist(:,:,i)=sum(val(:,:,i),1);
        end
        temp1 = reshape(tempHist(1,:,:),[574,numberOfImages]);
        
        val2 = transpose(temp1);
        
        tempName = strcat('hist_','12_12_12_6_');
        save(strcat(tempName,currentfilename), 'val2');
        
        clear('temp1','val2','val');
        
        
        
        
        
        
        val = zeros(820,574,numberOfImages);
        for i = 1:numberOfImages
            [wsh, val(:,:,i)] = extractBoneProbability_rect(im(:,:,i),12,3,12,3,'foroughi',[],[],[]);
        end
        
        
        tempHist = zeros(1,574,numberOfImages);
        for i =1:numberOfImages
            tempHist(:,:,i)=sum(val(:,:,i),1);
        end
        temp1 = reshape(tempHist(1,:,:),[574,numberOfImages]);
        
        val2 = transpose(temp1);
        
        tempName = strcat('hist_','12_3_12_3_');
        save(strcat(tempName,currentfilename), 'val2');
        
        clear('temp1','val2','val');
        
        
        
        
        
                val = zeros(820,574,numberOfImages);
        for i = 1:numberOfImages
            [wsh, val(:,:,i)] = extractBoneProbability_rect(im(:,:,i),16,3,16,3,'foroughi',[],[],[]);
        end
        
        
        tempHist = zeros(1,574,numberOfImages);
        for i =1:numberOfImages
            tempHist(:,:,i)=sum(val(:,:,i),1);
        end
        temp1 = reshape(tempHist(1,:,:),[574,numberOfImages]);
        
        val2 = transpose(temp1);
        
        tempName = strcat('hist_','16_3_16_3_');
        save(strcat(tempName,currentfilename), 'val2');
        
        clear('temp1','val2','val');
        
        
        
        clear('im','temp1','val2','val');
        
    end
end

