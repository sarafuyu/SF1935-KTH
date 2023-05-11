%% Problem 3: Konfidensintervall for Rayleighfordelning
    load wave_data.mat
    subplot(2,1,1), plot(y(1:end))
    subplot(2,1,2), hist_density(y)

%% My estimate
    % Estimate the Rayleigh distribution parameter using the ML method
    my_est = sqrt(sum(y.^2)/(2*numel(y)));
    % Set the confidence level (e.g., 95%)
    conf_level = 0.95;
    alpha = 1 - conf_level;
    % Calculate the chi-square values
    chi2_low = chi2inv(alpha/2, 2*numel(y));
    chi2_up = chi2inv(1-alpha/2, 2*numel(y));
    % Calculate the bounds of the confidence interval
    lower_bound = sqrt(chi2_low/(2*numel(y)));
    upper_bound = sqrt(chi2_up/(2*numel(y)));

%% Problem 3: Konfidensintervall (forts.)
    hold on % Gor sa att ploten halls kvar
    plot(lower_bound, 0, 'g*')
    plot(upper_bound, 0, 'g*')

%% Problem 3: Konfidensintervall (forts.)
    plot(0:0.1:6, raylpdf(0:0.1:6, my_est), 'r')
    hold off