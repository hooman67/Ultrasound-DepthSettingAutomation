% DIR returns as a structure array.  You will need to use () and . to get
% the file names.

%clear;clc;

sourceDirRoot = 'Y:\workspace\hooman\depthAutomationData\jordenNew\';

%get all the folders in source dir
eval(sprintf('cd %s',sourceDirRoot));

directories = dir('p*');

for d = 1:21
        %swich cd to where .b8 is
        eval(sprintf('cd %s',strcat(sourceDirRoot,directories(d).name)));
        
        
        imagefiles = dir('*Full2DHists.mat');
       
        for ii=1:length(imagefiles)
            
            load(imagefiles(ii).name);
            outName = strrep(imagefiles(ii).name, 'Full2DHists.mat', '_lr_helAndHanOnly_er');
            
            temp = lrHsEr(zeros(size(val2,1),1)+8,val2(:,43:616),all_theta);
     
            save(outName,'temp');       
        end
end