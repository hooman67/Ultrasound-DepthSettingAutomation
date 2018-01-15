imageFiles = dir('*.mat');
for ii = 64:71
    
    load(imageFiles(ii).name);
    numberOfImages = size(temp,3);
    
    val = zeros(820,574,numberOfImages);
    for i = 1:numberOfImages
        [wsh, val(:,:,i)] = extractBoneProbability_rect(temp(:,43:616,i),4,3,4,3,4,'foroughi',[],[],[]);
    end
    
    tempHist = zeros(1,574,numberOfImages);
    for i =1:numberOfImages
        tempHist(:,:,i)=sum(val(:,:,i),1);
    end
    temp1 = reshape(tempHist(1,:,:),[574,numberOfImages]);
    
    val2 = transpose(temp1);
    
    save(strcat('hist_4_3_4_3_4',imageFiles(ii).name), 'val2');
    
    clear('temp1','val2','val');
    
    
    
    
    val = zeros(820,574,numberOfImages);
    for i = 1:numberOfImages
        [wsh, val(:,:,i)] = extractBoneProbability_rect(temp(:,43:616,i),4,3,4,3,6,'foroughi',[],[],[]);
    end
    
    tempHist = zeros(1,574,numberOfImages);
    for i =1:numberOfImages
        tempHist(:,:,i)=sum(val(:,:,i),1);
    end
    temp1 = reshape(tempHist(1,:,:),[574,numberOfImages]);
    
    val2 = transpose(temp1);
    
    save(strcat('hist_4_3_4_3_6',imageFiles(ii).name), 'val2');
    
    clear('temp1','val2','val');
    
    
    
    
    
    val = zeros(820,574,numberOfImages);
    for i = 1:numberOfImages
        [wsh, val(:,:,i)] = extractBoneProbability_rect(temp(:,43:616,i),4,3,4,3,8,'foroughi',[],[],[]);
    end
    
    tempHist = zeros(1,574,numberOfImages);
    for i =1:numberOfImages
        tempHist(:,:,i)=sum(val(:,:,i),1);
    end
    temp1 = reshape(tempHist(1,:,:),[574,numberOfImages]);
    
    val2 = transpose(temp1);
    
    save(strcat('hist_4_3_4_3_8',imageFiles(ii).name), 'val2');
    
    clear('temp1','val2','val');
    
    
    
    
    val = zeros(820,574,numberOfImages);
    for i = 1:numberOfImages
        [wsh, val(:,:,i)] = extractBoneProbability_rect(temp(:,43:616,i),4,3,4,3,10,'foroughi',[],[],[]);
    end
    
    tempHist = zeros(1,574,numberOfImages);
    for i =1:numberOfImages
        tempHist(:,:,i)=sum(val(:,:,i),1);
    end
    temp1 = reshape(tempHist(1,:,:),[574,numberOfImages]);
    
    val2 = transpose(temp1);
    
    save(strcat('hist_4_3_4_3_10',imageFiles(ii).name), 'val2');
    

    
    
    
    clear('temp1','val2','val','temp');
end



