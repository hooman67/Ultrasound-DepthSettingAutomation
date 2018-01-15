% Get list of all BMP files in this directory
% DIR returns as a structure array.  You will need to use () and . to get
% the file names.

%clear;clc;

sourceDirRoot = 'Z:\workspace\hooman\depthAutomationData\jordenNew\';

%get all the folders in source dir
eval(sprintf('cd %s',sourceDirRoot));

directories = dir('p*');

for d = 1:21
    %swich cd to where .b8 is
    eval(sprintf('cd %s',strcat(sourceDirRoot,directories(d).name)));
    
    
    imagefiles = dir('stp');
    nfiles = length(imagefiles);    % Number of files found
    
    for ii=2:nfiles
        
        
        
        newfilename = strrep(imagefiles(ii).name, '.b8', '');
        newfilename = strcat(newfilename,'.mat');
        movefile(imagefiles(ii).name,newfilename);
        
        
    end
    
end