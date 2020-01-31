# Hand-written Digits Recognization using Multilayer Perceptron

This is the final project of MAT 128B Numerical Analysis taught by Prof. Javier Arsuaga at UC Davis. In this project, me and my partner implemented a simple MLP, a class of artificial neural network from scratch in MATLAB, and applied in to hand-written digits recognition problem.

## Results

### Number of Training Sets

With 1 hidden layer and 50 neurons,

|# of traning set| 20 (\*10000) | 50 | 100 | 200 | 400 |
|---|---|---|---|---|---|
|Accuracy| 10.14% | 24.55% | 72.32% | 85.87% | 92.73% |

### Number of Hidden Layers

With each layer having 50 neurons, and 100 * 10000 training sets,

|# of layer|1|2|3|4|5|
|---|---|---|---|---|---|
|Accuracy|72.31%|79.13%|69.42%|66.03%|40.32%|

### Number of Neurons

With 1 hidden layer and 10000 training sets,

|# of neurons|1|30|50|70|90|
|---|---|---|---|---|---|
|Accuracy|17.59%|60.89%|83.02%|91.16%|92.86%|

## Credits

Special thanks to my partner, Diwen Lu