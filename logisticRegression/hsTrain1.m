num_labels = 13;
lambda = 0.1;
acc = zeros(11,1);


km = 1;
for r = 40:50
   
    X = input(:,r:616);
    
    input_layer_size  = size(X, 2);
    m = size(X, 1);
    
    [all_theta] = oneVsAll(X, y, num_labels, lambda);
    
    
    p = jason_thirdIm(:,r:616);
    pred = predictOneVsAll(all_theta, p);
    
    acc(km) = mean(double(pred == j_labels)) * 100;
    km = km+1;
    
        fprintf('\n Iteration %d\n', r-39);
end
