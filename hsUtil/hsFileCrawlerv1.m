% Get list of all BMP files in this directory
% DIR returns as a structure array.  You will need to use () and . to get
% the file names.

clear;clc;

imagefiles = dir('*.b8');      
nfiles = length(imagefiles);    % Number of files found

for ii=1:nfiles
   currentfilename = imagefiles(ii).name;

    temp = load_b8(currentfilename);
    
    val = zeros(820,616,40);
    for i = 1:20
        [wsh, val(:,:,i)] = extractBoneProbability_rect(temp(:,:,i),4,3,4,3,'foroughi',[],[],[]);
    end
    j = 21;
    for i = (size(temp,3)-20):size(temp,3)
        [wsh, val(:,:,j)] = extractBoneProbability_rect(temp(:,:,i),4,3,4,3,'foroughi',[],[],[]);
        j = j+1;
    end

    save(strcat(currentfilename, '_BMP'), 'val');
   
    
    tempHist = zeros(1,616,40);
    for i =1:size(val,3)
        tempHist(:,:,i)=sum(val(:,:,i),1);
    end
    temp1 = reshape(tempHist(1,:,:),[616,size(val,3)]);
    
    val2 = transpose(temp1);

    save(strcat(currentfilename, '_Full2DHists'), 'val2');

end







;