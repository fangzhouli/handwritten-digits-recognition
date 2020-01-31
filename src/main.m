% Load database.
load ../dat/mnist_all.mat;
% Inputs hidden layer number and neuron number.
prompt1 = 'Input your layer number: ';
l = input(prompt1);
prompt2 = 'Input your neuton per layer: ';
n = input(prompt2);
% Initialize all values needed.
W_in = (2*rand(784, n, 1)-1);
W_out = (2*rand(n, 10, 1)-1);
W_hid = zeros(n, n, l - 1);
for i = 1 : l - 1
    W_hid(:, :, i) = (2*rand(n, n, 1)-1);
end

OUT_hid = zeros(l, n);
OUT_out = zeros(1, 10);
delta_hid = zeros(l, n);
delta_out = zeros(1, 10);


% Training all digits
for itr = 1 : 100
    fprintf('Iterating for %d...\n', itr);
    for count = 1 : 10
        if count == 1
            p = im2double(train0);
            TARGET = [1 0 0 0 0 0 0 0 0 0];
        elseif count == 2
            p = im2double(train1);
            TARGET = [0 1 0 0 0 0 0 0 0 0];
        elseif count == 3
            p = im2double(train2);
            TARGET = [0 0 1 0 0 0 0 0 0 0];
        elseif count == 4
            p = im2double(train3);
            TARGET = [0 0 0 1 0 0 0 0 0 0];
        elseif count == 5
            p = im2double(train4);
            TARGET = [0 0 0 0 1 0 0 0 0 0];
        elseif count == 6
            p = im2double(train5);
            TARGET = [0 0 0 0 0 1 0 0 0 0];
        elseif count == 7
            p = im2double(train6);
            TARGET = [0 0 0 0 0 0 1 0 0 0];
        elseif count == 8
            p = im2double(train7);
            TARGET = [0 0 0 0 0 0 0 1 0 0];
        elseif count == 9
            p = im2double(train8);
            TARGET = [0 0 0 0 0 0 0 0 1 0];
        elseif count == 10
            p = im2double(train9);
            TARGET = [0 0 0 0 0 0 0 0 0 1];
        end

        for i = 1 : 1000
            % Initialize OUT for the hidden layers.
            OUT_hid(1, :) = 1 ./ (1 + exp(-p(i, :) * W_in));
            for j = 1 : l - 1
                OUT_hid(j + 1, :) = 1 ./ (1 + exp(-OUT_hid(j, :) * W_hid(:, :, j)));
            end
            % Initialize OUT for the output layer.
            OUT_out = 1 ./ (1 + exp(-OUT_hid(l, :) * W_out));
            % Calculate delta array for the output layer.
            delta_out = OUT_out .* (1 - OUT_out) .* (TARGET - OUT_out);
            % Updata the W_out.
            W_out = W_out + 0.1 * OUT_hid(l, :)' * delta_out;
            % Calculate and updata all W_hid.
            delta_hid(l, :) = (delta_out * W_out') .* (OUT_hid(l, :) .* (ones(1, n) - OUT_hid(l, :)));
            for m = 1 : l - 1             
                W_hid(:, :, l - m) = W_hid(:, :, l - m) + 0.1 * OUT_hid(l - m, :)' * delta_hid(l - m + 1, :);
                delta_hid(l - m, :) = (delta_hid(l - m + 1, :) * W_hid(:, :, l - m)') .* (OUT_hid(l - m, :) .* (1 - OUT_hid(l - m, :)));
            end
            % Update W_in.
            for j = 1 : 784
                for k = 1 : n
                    W_in(j, k) = W_in(j, k) + 0.1 * delta_hid(1, k) * p(i, j);
                end
            end
        end
    end
end

clear A delta* ERROR i j k l m n num OUT* prompt* TARGET W*