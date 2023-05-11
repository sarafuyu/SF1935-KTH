%% Problem 4: Fordelningar av givna data
    load birth.dat
    x = birth(birth(:, 20) < 3, 3);
    y = birth(birth(:, 20) == 3, 3);
    % Uppgift men med alkohol som undersöks
    % x = birth(birth(:, 26) < 2, 3);
    % y = birth(birth(:, 26) == 2, 3);

%% Använd length för att se storleken på vektorerna x och y
    x_length = length(x) % det här ger längden på vektorn x
    y_length = length(y) % det här ger längden på vektorn y
    whos x y; %% för att se detaljer om vektorerna x och y

%% Problem 4: Fordelningar av givna data (forts.)
    subplot(2,2,1), boxplot(x),
    axis([0 2 500 5000])
    subplot(2,2,2), boxplot(y),
    axis([0 2 500 5000])

%% Problem 4: Fordelningar av givna data (forts.)
    subplot(2,2,3:4), ksdensity(x),
    hold on
    [fy, ty] = ksdensity(y);
    plot(ty, fy, 'r')
    hold off