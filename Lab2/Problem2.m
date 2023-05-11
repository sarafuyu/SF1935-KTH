%% Problem 2: Maximum likelihood/Minsta kvadrat
    M = 1e4;
    b = 4;
    x = raylrnd(b, M, 1);
    hist_density(x, 40)
    hold on
    my_est_ml = sqrt(sum(x.^2)/(2*M)); % Skriv in din ML-skattning har
    my_est_mk = sqrt(2/pi)*mean(x); % Skriv in din MK-skattning har
    plot(my_est_ml, 0, 'r*');
    plot(my_est_mk, 0, 'g*');
    plot(b, 0, 'ro');
    % hold off

%% Problem 2: Maximum likelihood/Minsta kvadrat (forts.)
    x_axis = 0:0.1:17; % tillagd för att kunna ändra intervallen
    plot(x_axis, raylpdf(x_axis, my_est_ml), 'r');
    hold off