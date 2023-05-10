%% Problem 1: Simulering av konfidensintervall
% % Parametrar:
% n = 25; %Antal matningar
% mu = 2; %Vantevardet
% sigma = 1; %Standardavvikelsen
% alpha = 0.05;
% %Simulerar n observationer for varje intervall
% x = normrnd(mu, sigma,n,100); %n x 100 matris med varden
% %Skattar mu med medelvardet
% xbar = mean(x); %vektor med 100 medelvarden.
% %Beraknar de undre och ovre granserna
% undre = xbar - norminv(1-alpha/2)*sigma/sqrt(n);
% ovre = xbar + norminv(1-alpha/2)*sigma/sqrt(n);

%% Problem 1: Simulering av konfidensintervall (forts.)
% %Ritar upp alla intervall
% figure(1)
% hold on
% for k=1:100
% if ovre(k) < mu % Rodmarkerar intervall som missar mu
% plot([undre(k) ovre(k)],[k k],'r')
% elseif undre(k) > mu
% plot([undre(k) ovre(k)],[k k],'r')
% else
% plot([undre(k) ovre(k)],[k k],'b')
% end
% end
% %b1 och b2 ar bara till for att figuren ska se snygg ut.
% b1 = min(xbar - norminv(1 - alpha/2)*sigma/sqrt(n));
% b2 = max(xbar + norminv(1 - alpha/2)*sigma/sqrt(n));
% axis([b1 b2 0 101]) %Tar bort outnyttjat utrymme i figuren
% %Ritar ut det sanna vardet
% plot([mu mu],[0 101],'g')
% hold off

%% Problem 2: Maximum likelihood/Minsta kvadrat
% M = 1e4;
% b = 4;
% x = raylrnd(b, M, 1);
% hist_density(x, 40)
% hold on
% my_est_ml = sqrt(sum(x.^2)/(2*M)); % Skriv in din ML-skattning har
% my_est_mk = sqrt(2/pi)*mean(x); % Skriv in din MK-skattning har
% % plot(my_est_ml, 0, 'r*');
% % plot(my_est_mk, 0, 'g*');
% % plot(b, 0, 'ro');
% % hold off

%% Problem 2: Maximum likelihood/Minsta kvadrat (forts.)
% x_axis = 0:0.1:17; % tillagd för att kunna ändra intervallen
% plot(x_axis, raylpdf(x_axis, my_est_ml), 'r');
% hold off

%% Problem 3: Konfidensintervall for Rayleighfordelning
% load wave_data.mat
% subplot(2,1,1), plot(y(1:end))
% subplot(2,1,2), hist_density(y)

%% My estimate
% % Estimate the Rayleigh distribution parameter using the ML method
% my_est = sqrt(sum(y.^2)/(2*numel(y)));
% % Set the confidence level (e.g., 95%)
% conf_level = 0.95;
% alpha = 1 - conf_level;
% % Calculate the chi-square values
% chi2_low = chi2inv(alpha/2, 2*numel(y));
% chi2_up = chi2inv(1-alpha/2, 2*numel(y));
% % Calculate the bounds of the confidence interval
% lower_bound = sqrt(chi2_low/(2*numel(y)));
% upper_bound = sqrt(chi2_up/(2*numel(y)));

%% Problem 3: Konfidensintervall (forts.)
% hold on % Gor sa att ploten halls kvar
% plot(lower_bound, 0, 'g*')
% plot(upper_bound, 0, 'g*')

% %% Problem 3: Konfidensintervall (forts.)
% plot(0:0.1:6, raylpdf(0:0.1:6, my_est), 'r')
% hold off

%% Problem 4: Fordelningar av givna data
% load birth.dat
% x = birth(birth(:, 20) < 3, 3);
% y = birth(birth(:, 20) == 3, 3);
% 
% %% Använd length för att se storleken på vektorerna x och y
% x_length = length(x) % det här ger längden på vektorn x
% y_length = length(y) % det här ger längden på vektorn y
% whos x y; %% för att se detaljer om vektorerna x och y
% 
% %% Problem 4: Fordelningar av givna data (forts.)
% subplot(2,2,1), boxplot(x),
% axis([0 2 500 5000])
% subplot(2,2,2), boxplot(y),
% axis([0 2 500 5000])
% 
% %% Problem 4: Fordelningar av givna data (forts.)
% subplot(2,2,3:4), ksdensity(x),
% hold on
% [fy, ty] = ksdensity(y);
% plot(ty, fy, 'r')
% hold off

%% Problem 4: Fördelningar av givna data för alkoholkonsumtion
% load birth.dat
% x = birth(birth(:, 26) < 2, 3);
% y = birth(birth(:, 26) == 2, 3);
% 
% %% Använd length för att se storleken på vektorerna x och y
% x_length = length(x) % det här ger längden på vektorn x
% y_length = length(y) % det här ger längden på vektorn y
% whos x y; %% för att se detaljer om vektorerna x och y
% 
% %% Problem 4: Fordelningar av givna data (forts.)
% subplot(2,2,1), boxplot(x),
% axis([0 2 500 5000])
% subplot(2,2,2), boxplot(y),
% axis([0 2 500 5000])
% 
% %% Problem 4: Fordelningar av givna data (forts.)
% subplot(2,2,3:4), ksdensity(x),
% hold on
% [fy, ty] = ksdensity(y);
% plot(ty, fy, 'r')
% hold off

%% Problem 5 - Test av normalitet
% % Ladda upp datan till MATLAB från 'birth.dat'
% fileID = fopen('birth.dat', 'rt');
% rawData = fread(fileID, '*char')';
% fclose(fileID);
% % Replace consecutive delimiters with a single space
% cleanData = regexprep(rawData, ' +', ' ');
% % Read specific columns from the cleaned data
% formatSpec = '%*f %*f %*f %f %f %*f %*f %*f %*f %*f %*f %*f %*f %*f %*f %f %f %*[^\n]';
% dataArray = textscan(cleanData, formatSpec, ...
% 'Delimiter', ' ', ...
% 'CollectOutput', true);
% data = cell2mat(dataArray);
% 
% % Extrahera de relevanta kolumnerna för de fyra variablerna
% fodelsevikt = data(:,1);
% mors_alder = data(:,2);
% mors_vikt = data(:,3);
% mors_langd = data(:,4);
% % Använder `jbtest` för att utföra Jarque-Bera-testet på varje kolumn och lagrar resultaten.
% [h1, p1] = jbtest(fodelsevikt);
% [h2, p2] = jbtest(mors_alder);
% [h3, p3] = jbtest(mors_vikt);
% [h4, p4] = jbtest(mors_langd);
% 
% % Skriver ut resultatet för de fyra variablerna och kontrollera om de är normalfördelade vid signifikansnivån 5%.
% alpha = 0.05;
% 
% % Barnets vikt
% fprintf('Barnets födelsevikt: ');
% if p1 < alpha
%     fprintf('Inte normalfördelad (p-värde: %f)\n', p1);
% else
%     fprintf('Normalfördelad (p-värde: %f)\n', p1);
% end
% 
% % Moderns ålder
% fprintf('Moderns ålder: ');
% if p2 < alpha
%     fprintf('Inte normalfördelad (p-värde: %f)\n', p2);
% else
%     fprintf('Normalfördelad (p-värde: %f)\n', p2);
% end
% 
% % Moderns vikt
% fprintf('Moderns vikt: ');
% if p3 < alpha
%     fprintf('Inte normalfördelad (p-värde: %f)\n', p3);
% else
%     fprintf('Normalfördelad (p-värde: %f)\n', p3);
% end
% 
% % Moderns längd
% fprintf('Moderns längd: ');
% if p4 < alpha
%     fprintf('Inte normalfördelad (p-värde: %f)\n', p4);
% else
%     fprintf('Normalfördelad (p-värde: %f)\n', p4);
% end

%% Problem 6: Regression
% % Läs in data från filen
% data = load('moore.dat');
% % Tilldela x och y från data
% x = data(:, 1);
% y = data(:, 2);
% % Ta logaritmen av y för att få w
% w = log(y);
% % Skapa matrisen X
% X = [ones(size(x)), x];
% % Använd regress-funktionen för att hitta skattning av beta
% [beta_hat,~,~,~,stats] = regress(w, X);
% R_square1 = stats(1)
% R_square2 = stats(2)
% R_square3 = stats(3)
% R_square4 = stats(4)
% % Bestäm vilken fördelning residualerna kommer från
% res = w - X * beta_hat;
% subplot(2, 1, 1);
% normplot(res);
% title('Normal Probability Plot of Residuals');
% subplot(2, 1, 2);
% hist(res);
% title('Histogram of Residuals');
% % Återgå till originalskala för y (y_hat)
% y_hat = exp(X * beta_hat);
% % Plotta den skattade modellen
% figure;
% plot(x, y, 'o', x, y_hat, '-');
% title('Scatter plot of data and fitted model');
% xlabel('Year');
% ylabel('# of Transistors');
% % Beräkna prediktionen för år 2025
% year_pred = 2025;
% log_y_pred = [1, year_pred] * beta_hat;
% y_pred = exp(log_y_pred);
% fprintf('The predicted number of transistors in 2025 is: %.2f\n', y_pred);

%% Multipel linjär regression
% Läs in datafilen
data = readmatrix('birth.dat');

% Hämta variablerna
birth_weight = data(:, 3);
mothers_height = data(:, 16);
mothers_weight = data(:, 15);
smoking = data(:, 24);
categorical_var = mothers_weight; % Modifiera detta för att extrahera kategoriseringen från Problem 4

% Enkel linjär regression: Födelsevikt beroende av moderns längd
X_simple = [ones(size(mothers_height)), mothers_height];
simple_model = X_simple \ birth_weight;

% Multipel linjär regression: Födelsevikt beroende av moderns längd, moderns vikt, rökvanor och kategorisk variabel
X_multiple = [ones(size(mothers_height)), mothers_height, mothers_weight, smoking, categorical_var];
multiple_model = X_multiple \ birth_weight;

% Konfidensintervall för den multipel regressionsmodellen
alpha = 0.05; % 95% konfidensintervall
n = length(birth_weight);
p = size(X_multiple, 2);
[~, ~, ~, ~, stats] = regress(birth_weight, X_multiple, alpha);
confidence_intervals = stats;

% Residualer
residuals = birth_weight - X_multiple * multiple_model;

% Normplot för residualerna
normplot(residuals);
title('Normplot för residualerna från multipel linjär regression');