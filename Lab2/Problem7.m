%% Multipel linjär regression
% Läs in datafilen
data = readmatrix('birth.dat');

% Hämta variablerna
birth_weight = data(:, 3);
mothers_height = data(:, 16);
mothers_weight = data(:, 15);
smoking = data(:, 24);
drinking = data(:, 26);
alcohol = data(:, 26);

for k=1:size(alcohol)
    if(alcohol(k) == 2)
        alcohol(k) == 1;
    else
        alcohol(k) == 0;
    end
end

% Enkel linjär regression: Födelsevikt beroende av moderns längd
X_simple = [ones(size(mothers_height)), mothers_height];
simple_model = X_simple \ birth_weight;

% Multipel linjär regression: Födelsevikt beroende av moderns längd, moderns vikt, rökvanor och kategorisk variabel
X_multiple = [ones(size(mothers_height)), mothers_height, mothers_weight, smoking];
X_multiple_modify = [ones(size(alcohol)), alcohol, mothers_weight, smoking];
multiple_model = X_multiple \ birth_weight;

% Konfidensintervall för den multipel regressionsmodellen
alpha = 0.05; % 95% konfidensintervall
n = length(birth_weight);
p = size(X_multiple_modify, 2);
[beta_hat, int_modify, res, ~, ~] = regress(birth_weight, X_multiple_modify, alpha);

fprintf('konfidensintervall: från %.2f till %.2f\n', int_modify(1,1), int_modify(1,2));
fprintf('konfidensintervall: från %.2f till %.2f\n', int_modify(2,1), int_modify(2,2));
fprintf('konfidensintervall: från %.2f till %.2f\n', int_modify(3,1), int_modify(3,2));
fprintf('konfidensintervall: från %.2f till %.2f\n', int_modify(4,1), int_modify(4,2));

beta_hat

% Normplot för residualerna
normplot(r);
title('Normplot för residualerna från multipel linjär regression');