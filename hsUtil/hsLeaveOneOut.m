% DIR returns as a structure array.  You will need to use () and . to get
% the file names.

%clear;clc;

sourceDirRoot = 'Y:\workspace\hooman\depthAutomationData\jordenNew\';

%lr stuff
input_layer_size  = 574;% 574 = 616-43 ignore the first 43 lines in the image. %616;  % 400 = 20x20 Input Images of Digits
num_labels = 13;
lambda = 0.1;

%get all the folders in source dir
eval(sprintf('cd %s',sourceDirRoot));

directories = dir('p*');

begIndex = 10985;
endIndex = 1;

for d = 2:20
        %swich cd to the director
        eval(sprintf('cd %s',strcat(sourceDirRoot,directories(d).name)));
        
        %get the info about all_files_cat without loading it this makes 
        %the program much faster
        matObj = matfile('all_files_cat.mat');
        allFilesDetails = whos(matObj);
        allFilesLeng = allFilesDetails(1).size(1);
        
        
        %load the concatenated hists
        load('sfj_cat.mat');
        load('sl_cat.mat');
        if d~=20
            load('ssp_cat.mat');
        end
        load('stp_cat.mat');
        load('sweep_cat.mat');
        load('o_cat.mat');
        load('tmg_cat.mat');
        load('tmb_cat.mat');
        
        %adjust the end index to leave this one out:
        endIndex = begIndex + allFilesLeng + 1;
        
        
        X = vertcat(oldX(1:begIndex,:),oldX(endIndex:252235,:));
        y = vertcat(oldy(1:begIndex,:),oldy(endIndex:252235,:));
        
        %train classifier
        [all_theta] = oneVsAll(X, y, num_labels, lambda);
        
        sfjEr = lrHsEr(zeros(size(sfj_cat,1),1)+8,sfj_cat(:,43:616),all_theta);
        slEr  = lrHsEr(zeros(size(sl_cat,1),1)+8,sl_cat(:,43:616),all_theta);
         if d~=20
             sspEr = lrHsEr(zeros(size(ssp_cat,1),1)+8,ssp_cat(:,43:616),all_theta);
         else
             sspEr=-1;
         end
        stpEr = lrHsEr(zeros(size(stp_cat,1),1)+8,stp_cat(:,43:616),all_theta);
        sweepEr = lrHsEr(zeros(size(sweep_cat,1),1)+8,sweep_cat(:,43:616),all_theta);
        oEr = lrHsEr(zeros(size(o_cat,1),1)+8,o_cat(:,43:616),all_theta);
        tmgEr = lrHsEr(zeros(size(tmg_cat,1),1)+8,tmg_cat(:,43:616),all_theta);
        tmbEr = lrHsEr(zeros(size(tmb_cat,1),1)+8,tmb_cat(:,43:616),all_theta);
        
        save('multi_cat_lr_LOO_er','sfjEr','slEr','sspEr','sfjEr','stpEr','sweepEr','oEr','tmgEr','tmbEr');
        
        %adjust the beg index to leave this one out:
        begIndex = begIndex + allFilesLeng;
        
        clear('all_theta','sfj_cat','sl_cat','ssp_cat','stp_cat','sweep_cat','o_cat','tmg_cat','tmb_cat','X','y');
end