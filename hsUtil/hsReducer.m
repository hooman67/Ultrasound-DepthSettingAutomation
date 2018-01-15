% Get list of all BMP files in this directory
% DIR returns as a structure array.  You will need to use () and . to get
% the file names.

clear;clc;

sourceDirRoot = 'Y:\shared\images\Jorden\USCollectionStudy\';

%get all the folders in source dir
eval(sprintf('cd %s',sourceDirRoot));

directories = dir('p*');

for d = 2:12
    if (d ~= 5 && d~=7 && d~=8 && d~=9 && d~=5 && d~=6) %skip p76_size folder
        
        %swich cd to where .b8 is
        eval(sprintf('cd %s',strcat(sourceDirRoot,directories(d).name)));
        
        imInfo = dir('sfj_l_L1L2_T12L1.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('sfj_l_L1L2_T12L1.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            
            save(strcat('red_sfj_l_L1L2_T12L1',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('sfj_l_L2L3_L1L2.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('sfj_l_L2L3_L1L2.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            
 
            
            save(strcat('red_sfj_l_L2L3_L1L2',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('sfj_l_L3L4_L2L3.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('sfj_l_L3L4_L2L3.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            
    
            save(strcat('red_sfj_l_L3L4_L2L3',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('sfj_l_L4L5_L3L4.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('sfj_l_L4L5_L3L4.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));

            
            save(strcat('red_sfj_l_L4L5_L3L4',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('sfj_r_L1L2_T12L1.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('sfj_r_L1L2_T12L1.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            

            
            save(strcat('red_sfj_r_L1L2_T12L1',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('sfj_r_L2L3_L1L2.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('sfj_r_L2L3_L1L2.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            
       
            
            save(strcat('red_sfj_r_L2L3_L1L2',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('sfj_r_L3L4_L2L3.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('sfj_r_L3L4_L2L3.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            
         
            save(strcat('red_sfj_r_L3L4_L2L3',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('sfj_r_L4L5_L3L4.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('sfj_r_L4L5_L3L4.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));

            save(strcat('red_sfj_r_L4L5_L3L4',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        
        
        
        imInfo = dir('sl_l_L1L2_T12L1.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('sl_l_L1L2_T12L1.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            

            save(strcat('red_sl_l_L1L2_T12L1',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('sl_l_L2L3_L1L2.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('sl_l_L2L3_L1L2.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            
    
            
            save(strcat('red_sl_l_L2L3_L1L2',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('sl_l_L3L4_L2L3.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('sl_l_L3L4_L2L3.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            
     
            
            save(strcat('red_sl_l_L3L4_L2L3',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('sl_l_L4L5_L3L4.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('sl_l_L4L5_L3L4.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            

            save(strcat('red_sl_l_L4L5_L3L4',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('sl_r_L1L2_T12L1.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('sl_r_L1L2_T12L1.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
 
            
            save(strcat('red_sl_r_L1L2_T12L1',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('sl_r_L2L3_L1L2.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('sl_r_L2L3_L1L2.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            
 
            save(strcat('red_sl_r_L2L3_L1L2',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('sl_r_L3L4_L2L3.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('sl_r_L3L4_L2L3.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            

            save(strcat('red_sl_r_L3L4_L2L3',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('sl_r_L4L5_L3L4.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('sl_r_L4L5_L3L4.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            

            save(strcat('red_sl_r_L4L5_L3L4',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        
        
        imInfo = dir('ssp_L1L2.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('ssp_L1L2.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            

            save(strcat('red_ssp_L1L2',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('ssp_L2L3.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('ssp_L2L3.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            

            save(strcat('red_ssp_L2L3',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('ssp_L3L4.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('ssp_L3L4.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));

            
            save(strcat('red_ssp_L3L4',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('ssp_L4L5.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('ssp_L4L5.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
   
            
            save(strcat('red_ssp_L4L5',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        
        
        
        imInfo = dir('tmg_L1L2.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('tmg_L1L2.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
    
            
            save(strcat('red_tmg_L1L2',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('tmg_L2L3.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('tmg_L2L3.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            
    
            save(strcat('red_tmg_L2L3',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('tmg_L3L4.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('tmg_L3L4.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));

            
            save(strcat('red_tmg_L3L4',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('tmg_L4L5.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('tmg_L4L5.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            

            
            save(strcat('red_tmg_L4L5',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        
        
        imInfo = dir('tmb_L1.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('tmb_L1.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            
   
            save(strcat('red_tmb_L1',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('tmb_L2.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('tmb_L2.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
   
            
            save(strcat('red_tmb_L2',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('tmb_L3.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('tmb_L3.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            
    
            save(strcat('red_tmb_L3',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('tmb_L4.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('tmb_L4.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            
   
            
            save(strcat('red_tmb_L4',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('sl_l_sweep.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('sl_l_sweep.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            
     
            
            save(strcat('red_sl_l_sweep',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('sl_r_sweep.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('sl_r_sweep.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            
  
            
            save(strcat('red_sl_r_sweep',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('stp_l_sweep.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('stp_l_sweep.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            

            
            save(strcat('red_stp_l_sweep',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('stp_r_sweep.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('stp_r_sweep.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
   
            
            save(strcat('red_stp_r_sweep',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('tamb_sweep.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('tamb_sweep.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            
 
            save(strcat('red_tamb_sweep',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('tamg_sweep.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('tamg_sweep.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            
 
            save(strcat('red_tamg_sweep',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('tm_sweep.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('tm_sweep.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
   
            
            save(strcat('red_tm_sweep',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('ts_l_sweep.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('ts_l_sweep.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
            
 
            
            save(strcat('red_ts_l_sweep',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        imInfo = dir('ts_r_sweep.b8');
        if imInfo(1).bytes <= 502594476
            temp = load_b8('ts_r_sweep.b8');
            temp2 = cat(3,temp(:,43:616,1:25),temp(:,43:616,size(temp,3)-25:size(temp,3)));
     
            
            save(strcat('red_ts_r_sweep',directories(d).name),'temp2');
            clear('temp','temp2');
        end
        
        
        
    end
end