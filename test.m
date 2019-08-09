correct = 0;
total = 0;
for itr = 1 : 10
    if itr == 1
        [row, ~] = size(test0);
        t = im2double(test0);
    elseif itr == 2
        [row, ~] = size(test1);
        t = im2double(test1);
    elseif itr == 3
        [row, ~] = size(test2);
        t = im2double(test2);
    elseif itr == 4
        [row, ~] = size(test3);
        t = im2double(test3);
    elseif itr == 5
        [row, ~] = size(test4);
        t = im2double(test4);
    elseif itr == 6
        [row, ~] = size(test5);
        t = im2double(test5);
    elseif itr == 7
        [row, ~] = size(test6);
        t = im2double(test6);
    elseif itr == 8
        [row, ~] = size(test7);
        t = im2double(test7);
    elseif itr == 9
        [row, ~] = size(test8);
        t = im2double(test8);
    elseif itr == 10
        [row, ~] = size(test9);
        t = im2double(test9);
    end
    
    total = total + row;
    
    for i = 1 : row
        Output = 1 ./ (1 + exp(-t(i, :) * W_in));
        for j = 1 : l - 1
            Output = 1 ./ (1 + exp(-Output * W_hid(:, :, j)));
        end
        Output = 1 ./ (1 + exp(-Output * W_out));
        [m, n] = max(Output);
        %disp(Output);
        if n == itr
            correct = correct + 1;
        else
            fprintf('Expected Value: %d\n', itr - 1);
            disp(Output);
        end
    end
end

fprintf('Correct Ratio: %f\n', (correct / total));