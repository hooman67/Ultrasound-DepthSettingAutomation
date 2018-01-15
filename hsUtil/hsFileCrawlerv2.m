% Get list of all BMP files in this directory
% DIR returns as a structure array.  You will need to use () and . to get
% the file names.

clear;clc;

sourceDirRoot = 'Y:\shared\images\Jorden\USCollectionStudy\';
destDirRoot = 'Y:\workspace\hooman\depthAutomationData\jordenNew\';

%get all the folders in source dir
eval(sprintf('cd %s',sourceDirRoot));

directories = dir('p*');

for d = 1:21
    if d ~= 16 %skip p76_size folder
        
        %swich cd to where .b8 is
        eval(sprintf('cd %s',strcat(sourceDirRoot,directories(d).name)));
        
        
        imagefiles = dir('*.b8');
        nfiles = length(imagefiles);    % Number of files found
        
        for ii=1:nfiles
            
            %if the file is not too big to fit in ram here: 502594476 bytes
            if imagefiles(ii).bytes <= 502594476
                
                currentfilename = imagefiles(ii).name;
                
                temp = load_b8(strcat(strcat(sourceDirRoot,directories(d).name),strcat('\',currentfilename)));
                numberOfImages = size(temp,3);
                
                val = zeros(820,616,numberOfImages);
                for i = 1:numberOfImages
                    [wsh, val(:,:,i)] = extractBoneProbability_rect(temp(:,:,i),4,3,4,3,'foroughi',[],[],[]);
                end
                
                
                tempHist = zeros(1,616,numberOfImages);
                for i =1:numberOfImages
                    tempHist(:,:,i)=sum(val(:,:,i),1);
                end
                temp1 = reshape(tempHist(1,:,:),[616,numberOfImages]);
                
                val2 = transpose(temp1);
                
                %cd to dest
                %          eval(sprintf('cd %s',strcat(destDirRoot,directories(d).name)));
                save(strcat(strcat(destDirRoot,strcat(directories(d).name,'\')), strcat(currentfilename, '_BMP') ), 'val');
                save(strcat(strcat(destDirRoot,strcat(directories(d).name,'\')), strcat(currentfilename, '_Full2DHists') ), 'val2');
                
                %cd back to source dir read the next file
                %   eval(sprintf('cd %s',strcat(sourceDirRoot,directories(d).name)));
                
                clear('temp','temp1','val2');
                
            end
        end
        
        
    end
end