% Get list of all BMP files in this directory
% DIR returns as a structure array.  You will need to use () and . to get

imagefiles = dir('*_BPM.mat');
nfiles = length(imagefiles);    % Number of files found

for ii=1:nfiles
    
    
    imagefiles = dir('*_BPM.mat');
    currentfilename = imagefiles(ii).name;
    load(currentfilename);
    currentfilename = strrep(currentfilename,'.mat','');
    
    eval(sprintf('temp = %s;',currentfilename));
    numberOfImages = size(temp,3);
    
    
    tempHist = zeros(1,616,numberOfImages);
    for i =1:numberOfImages
        tempHist(:,:,i)=sum(temp(:,:,i),1);
    end
    temp1 = reshape(tempHist(1,:,:),[616,numberOfImages]);
    
    val2 = transpose(temp1);
    
    currentfilename = strrep(currentfilename,'BPM','Full2DHists.mat');
    save(currentfilename, 'val2');
    

    clear;
    
end




