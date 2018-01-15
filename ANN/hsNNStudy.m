Results1 = zeros(1000,1) - 1;

lambda = 1;
options = optimset('MaxIter', 1000);
input_layer_size  = 574;
num_labels = 13;

for i= 0:15
    hidden_layer_size = 5*i + 25;
    
    fprintf('\nInitializing Neural Network Parameters ...\n')
    
    initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
    initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);
    
    % Unroll parameters
    initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];
    
    
    
    m = size(X, 1);
    
    
    
    
    % Create "short hand" for the cost function to be minimized
    costFunction = @(p) nnCostFunction(p, ...
        input_layer_size, ...
        hidden_layer_size, ...
        num_labels, X, y, lambda);
    
    
    
    
    % Now, costFunction is a function that takes in only one argument (the
    % neural network parameters)
    [nn_params, cost] = fmincg(costFunction, initial_nn_params, options);
    
    % Obtain Theta1 and Theta2 back from nn_params
    Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
        hidden_layer_size, (input_layer_size + 1));
    
    Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
        num_labels, (hidden_layer_size + 1));
    
    
    
    
    pred = predict(Theta1, Theta2, X);
    
    Results1(i+1) =  mean(double(pred == y)) * 100;
    
    fprintf('\nTraining Set Accuracy: %f\n', Results1(i+1));
    clear('nn_params','Theta1','Theta2','cost','costFunction','initial_nn_params','initial_Theta1','initial_Theta2');
end
save('studyResults','Results1');


Results2 = zeros(1000,1) - 1;
for i= 0:15
    hidden_layer_size = 5*i + 25;
    
    fprintf('\nInitializing Neural Network Parameters ...\n')
    
    initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
    initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);
    
    % Unroll parameters
    initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];
    
    
    
    m = size(X, 1);
    
    
    
    
    % Create "short hand" for the cost function to be minimized
    costFunction = @(p) nnCostFunction(p, ...
        input_layer_size, ...
        hidden_layer_size, ...
        num_labels, X, y, lambda);
    
    
    
    
    % Now, costFunction is a function that takes in only one argument (the
    % neural network parameters)
    [nn_params, cost] = fmincg(costFunction, initial_nn_params, options);
    
    % Obtain Theta1 and Theta2 back from nn_params
    Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
        hidden_layer_size, (input_layer_size + 1));
    
    Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
        num_labels, (hidden_layer_size + 1));
    
    
    
    
    pred = predict(Theta1, Theta2, X);
    
    Results2(i+1) =  mean(double(pred == y)) * 100;
    
    fprintf('\nTraining Set Accuracy: %f\n', Results2(i+1));
    clear('nn_params','Theta1','Theta2','cost','costFunction','initial_nn_params','initial_Theta1','initial_Theta2');
end
save('studyResults','Results2');



Results3 = zeros(1000,1) - 1;
for i= 0:15
    hidden_layer_size = 5*i + 25;
    
    fprintf('\nInitializing Neural Network Parameters ...\n')
    
    initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
    initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);
    
    % Unroll parameters
    initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];
    
    
    
    m = size(X, 1);
    
    
    
    
    % Create "short hand" for the cost function to be minimized
    costFunction = @(p) nnCostFunction(p, ...
        input_layer_size, ...
        hidden_layer_size, ...
        num_labels, X, y, lambda);
    
    
    
    
    % Now, costFunction is a function that takes in only one argument (the
    % neural network parameters)
    [nn_params, cost] = fmincg(costFunction, initial_nn_params, options);
    
    % Obtain Theta1 and Theta2 back from nn_params
    Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
        hidden_layer_size, (input_layer_size + 1));
    
    Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
        num_labels, (hidden_layer_size + 1));
    
    
    
    
    pred = predict(Theta1, Theta2, X);
    
    Results3(i+1) =  mean(double(pred == y)) * 100;
    
    fprintf('\nTraining Set Accuracy: %f\n', Results3(i+1));
    clear('nn_params','Theta1','Theta2','cost','costFunction','initial_nn_params','initial_Theta1','initial_Theta2');
end
save('studyResults','Results3');
