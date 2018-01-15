% DIR returns as a structure array.  You will need to use () and . to get
% the file names.

clear;clc;

sourceDirRoot = 'Y:\workspace\hooman\depthAutomationData\jordenNew\';

%get all the folders in source dir
eval(sprintf('cd %s',sourceDirRoot));

directories = dir('p*');

for d = 1:21
    
    %swich cd to where .b8 is
    eval(sprintf('cd %s',strcat(sourceDirRoot,directories(d).name)));
    
    
    imagefiles = dir('*stp*Full2DHists.mat');
    load(imagefiles(1).name);
    stp_cat = val2;
    
    for ii=2:length(imagefiles)
        if isempty(strfind(imagefiles(ii).name,'sweep'))
            load(imagefiles(ii).name);
            stp_cat = vertcat(stp_cat,val2);
        end
    end
    save('stp_cat','stp_cat');
    
    
    imagefiles = dir('*ssp*Full2DHists.mat');
    load(imagefiles(1).name);
    ssp_cat = val2;
    
    for ii=2:length(imagefiles)
        if isempty(strfind(imagefiles(ii).name,'sweep'))
            load(imagefiles(ii).name);
            ssp_cat = vertcat(ssp_cat,val2);
        end
    end
    save('ssp_cat','ssp_cat');
    
    
    imagefiles = dir('*sfj*Full2DHists.mat');
    load(imagefiles(1).name);
    sfj_cat = val2;
    
    for ii=2:length(imagefiles)
        if isempty(strfind(imagefiles(ii).name,'sweep'))
            load(imagefiles(ii).name);
            sfj_cat = vertcat(sfj_cat,val2);
        end
    end
    save('sfj_cat','sfj_cat');
    
    
    imagefiles = dir('*sl*Full2DHists.mat');
    load(imagefiles(1).name);
    sl_cat = val2;
    
    for ii=2:length(imagefiles)
        if isempty(strfind(imagefiles(ii).name,'sweep'))
            load(imagefiles(ii).name);
            sl_cat = vertcat(sl_cat,val2);
        end
    end
    save('sl_cat','sl_cat');
    
    
    imagefiles = dir('*sweep*Full2DHists.mat');
    load(imagefiles(1).name);
    sweep_cat = val2;
    
    for ii=2:length(imagefiles)
        load(imagefiles(ii).name);
        sweep_cat = vertcat(sweep_cat,val2);
    end
    save('sweep_cat','sweep_cat');
    
end