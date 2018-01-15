
numberOfImages = size(temp,3);

val = zeros(820,574,numberOfImages);
for i = 1:numberOfImages
    [wsh, val(:,:,i)] = extractBoneProbability_rect(temp(:,:,i),4,3,4,3,'foroughi',[],[],[]);
end


tempHist = zeros(1,574,numberOfImages);
for i =1:numberOfImages
    tempHist(:,:,i)=sum(val(:,:,i),1);
end
temp1 = reshape(tempHist(1,:,:),[574,numberOfImages]);

val2 = transpose(temp1);