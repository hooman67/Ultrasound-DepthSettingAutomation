function [ Er ] = lrHsEr( y, X, all_theta )

pred = predictOneVsAll(all_theta, X);

Er = mean(double(pred == y))*100;
%fprintf('\nTesting Set Accuracy: %f\n', mean(double(pred == y)) * 100);

end

