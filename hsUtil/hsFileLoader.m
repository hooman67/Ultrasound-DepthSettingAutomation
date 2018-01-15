% DIR returns as a structure array.  You will need to use () and . to get
% the file names.

%clear;clc;

sourceDirRoot = 'Z:\workspace\hooman\depthAutomationData\jordenNew\';

%get all the folders in source dir
eval(sprintf('cd %s',sourceDirRoot));

directories = dir('p*');

for d = 11:11
        %swich cd to where .b8 is
        eval(sprintf('cd %s',strcat(sourceDirRoot,directories(d).name)));
        
        
        %imagefiles = dir('*cat_lr_helAndHanOnly_er*'); 
        %imagefiles = dir('*cat_lr_HandHandFirst10_SFJ_er*');
        imagefiles = dir('*cat_lr_HandHandFirst10_ALL_er*')
        directories(d).name
        for ii=1:length(imagefiles)
            load(imagefiles(ii).name);
            imagefiles(ii).name
            temp
        end
        pause;
        clc;
end