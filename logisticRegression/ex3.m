
%% Setup the parameters you will use for this part of the exercise
input_layer_size  = 574;% 574 = 616-43 ignore the first 43 lines in the image. %616;  % 400 = 20x20 Input Images of Digits
num_labels = 13;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)

m = size(X, 1);

fprintf('\nTraining One-vs-All Logistic Regression...\n')

lambda = 0.1;
[all_theta] = oneVsAll(X, y, num_labels, lambda);

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ================ Part 3: Predict for One-Vs-All ================
%  After ...
pred = predictOneVsAll(all_theta, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

