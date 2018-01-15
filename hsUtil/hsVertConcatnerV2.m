% DIR returns as a structure array.  You will need to use () and . to get
% the file names.
sourceDirRoot = 'Y:\workspace\hooman\depthAutomationData\jordenNew\';

%get all the folders in source dir
eval(sprintf('cd %s',sourceDirRoot));

directories = dir('p*');

for d = 3:20
    
    %swich cd to where .b8 is
    eval(sprintf('cd %s',strcat(sourceDirRoot,directories(d).name)));
    
    load('sfj_cat.mat');
    load('sl_cat.mat');
    load('ssp_cat.mat');
    load('stp_cat.mat');
    load('sweep_cat.mat');
    
    sfj_second10Ps_cat = vertcat(sfj_second10Ps_cat,sfj_cat);
    sl_second10Ps_cat = vertcat(sl_second10Ps_cat,sl_cat);
    ssp_second10Ps_cat = vertcat(ssp_second10Ps_cat,ssp_cat);
    stp_second10Ps_cat = vertcat(stp_second10Ps_cat,stp_cat);
    sweep_second10Ps_cat = vertcat(sweep_second10Ps_cat,sweep_cat);
    
    clear('sfj_cat','sl_cat','ssp_cat','stp_cat','sweep_cat');
    
end