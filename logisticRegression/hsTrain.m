num_labels = 13;
lambda = 0.1;
acc = zeros(140,1);


km = 1;
for r = 0:27
   
    X = input(:,r*5+1:616);
    
    input_layer_size  = size(X, 2);
    m = size(X, 1);
    
    [all_theta] = oneVsAll(X, y, num_labels, lambda);
    
    
    p = helFull2DHists(:,r*5+1:616);
    pred = predictOneVsAll(all_theta, p);
    
    acc(km) = mean(double(pred == y_hel+8)) * 100;
    km = km+1;
    
        fprintf('\n Iteration %d\n', r);
end


    