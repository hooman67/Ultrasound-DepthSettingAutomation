result = zeros(4);

files = dir('cat_hist_4_3_4_3_4red*');
for ii = 1:4
    load(files(ii).name);
    Er = lrHsEr(zeros(size(value,1),1)+8,value(:,:),all_theta_4_3_4_3_4);
    result(1,ii) = Er;    
    save(strcat('Er_4_3_4_3_4',files(ii).name),'Er');
end

files = dir('cat_hist_4_3_4_3_6red*');
for ii = 1:4
    load(files(ii).name);
    Er = lrHsEr(zeros(size(value,1),1)+8,value(:,:),all_theta_4_3_4_3_6);
    result(2,ii) = Er;    
    save(strcat('Er_4_3_4_3_6',files(ii).name),'Er');
end

files = dir('cat_hist_4_3_4_3_8red*');
for ii = 1:4
    load(files(ii).name);
    Er = lrHsEr(zeros(size(value,1),1)+8,value(:,:),all_theta_4_3_4_3_8);
    result(3,ii) = Er;    
    save(strcat('Er_4_3_4_3_8',files(ii).name),'Er');
end

files = dir('cat_hist_4_3_4_3_10red*');
for ii = 1:4
    load(files(ii).name);
    Er = lrHsEr(zeros(size(value,1),1)+8,value(:,:),all_theta_4_3_4_3_10);
    result(4,ii) = Er;    
    save(strcat('Er_4_3_4_3_10',files(ii).name),'Er');
end

save('boneProbResults','result');