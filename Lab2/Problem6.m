%% Problem 6: Regression
% Läs in data från filen
data = load('moore.dat');
% Tilldela x och y från data
x = data(:, 1);
y = data(:, 2);
% Ta logaritmen av y för att få w
w = log(y);
% Skapa matrisen X
X = [ones(size(x)), x];
% Använd regress-funktionen för att hitta skattning av beta
[beta_hat,~,~,~,stats] = regress(w, X);
R_square1 = stats(1)
R_square2 = stats(2)
R_square3 = stats(3)
R_square4 = stats(4)
% Bestäm vilken fördelning residualerna kommer från
res = w - X * beta_hat;
subplot(2, 1, 1);
normplot(res);
title('Normal Probability Plot of Residuals');
subplot(2, 1, 2);
hist(res);
title('Histogram of Residuals');
% Återgå till originalskala för y (y_hat)
y_hat = exp(X * beta_hat);
% Plotta den skattade modellen
figure;
plot(x, y, 'o', x, y_hat, '-');
title('Scatter plot of data and fitted model');
xlabel('Year');
ylabel('# of Transistors');
% Beräkna prediktionen för år 2025
year_pred = 2025;
log_y_pred = [1, year_pred] * beta_hat;
y_pred = exp(log_y_pred);
fprintf('The predicted number of transistors in 2025 is: %.2f\n', y_pred);
