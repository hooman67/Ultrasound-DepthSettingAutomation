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
        
        
        imagefiles = dir('sfj_cat.mat');
        load(imagefiles(1).name);
        outName = 'sfj_cat_lr_helAndHanOnly_er';
        
        temp = lrHsEr(zeros(size(sfj_cat,1),1)+8,sfj_cat(:,43:616),all_theta)
        save(outName,'temp');
        
        
        imagefiles = dir('sl_cat.mat');
        load(imagefiles(1).name);
        outName = 'sl_cat_lr_helAndHanOnly_er';
        
        temp = lrHsEr(zeros(size(sl_cat,1),1)+8,sl_cat(:,43:616),all_theta)
        save(outName,'temp');
        
        
        imagefiles = dir('ssp_cat.mat');
        load(imagefiles(1).name);
        outName = 'ssp_cat_lr_helAndHanOnly_er';
        
        temp = lrHsEr(zeros(size(ssp_cat,1),1)+8,ssp_cat(:,43:616),all_theta)
        save(outName,'temp');
        
        
        imagefiles = dir('stp_cat.mat');
        load(imagefiles(1).name);
        outName = 'stp_cat_lr_helAndHanOnly_er';
        
        temp = lrHsEr(zeros(size(stp_cat,1),1)+8,stp_cat(:,43:616),all_theta)
        save(outName,'temp');
        
        
        imagefiles = dir('sweep_cat.mat');
        load(imagefiles(1).name);
        outName = 'sweep_cat_lr_helAndHanOnly_er';
        
        temp = lrHsEr(zeros(size(sweep_cat,1),1)+8,sweep_cat(:,43:616),all_theta)
        save(outName,'temp');
end