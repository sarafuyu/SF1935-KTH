%% Problem 5 - Test av normalitet
    % Läs in datafilen
    data = readmatrix('birth.dat');
    % Hämta variablerna
    fodelsevikt = data(:, 3);
    mors_alder = data(:, 4);
    mors_vikt = data(:, 15);
    mors_langd = data(:, 16);

%% Normplot av datan
    %subplot(2,2,1), normplot(fodelsevikt), title('Födelsevikt') % nära, men ej norm fördelad
    %subplot(2,2,2), normplot(mors_alder), title('Moderns ålder') % nära, men ej norm fördelad
    %subplot(2,2,3), normplot(mors_vikt), title('Moderns vikt') % ej norm fördelad
    %subplot(2,2,4), normplot(mors_langd), title('Moderns längd') % är norm fördelad

    subplot(2,2,1), qqplot(fodelsevikt), title('Födelsevikt') % nära, men ej norm fördelad
    subplot(2,2,2), qqplot(mors_alder), title('Moderns ålder') % nära, men ej norm fördelad
    subplot(2,2,3), qqplot(mors_vikt), title('Moderns vikt') % ej norm fördelad
    subplot(2,2,4), qqplot(mors_langd), title('Moderns längd') % är norm fördelad

%% Använder `jbtest` för att utföra Jarque-Bera-testet på varje kolumn och lagrar resultaten.
    [h1, p1] = jbtest(fodelsevikt);
    [h2, p2] = jbtest(mors_alder);
    [h3, p3] = jbtest(mors_vikt);
    [h4, p4] = jbtest(mors_langd);

%% Barnets vikt
    fprintf('Barnets födelsevikt: ');
    if h1 == 0
        fprintf('Inte normalfördelad (p-värde: %f)\n', p1);
    else
        fprintf('Normalfördelad (p-värde: %f)\n', p1);
    end

%% Moderns ålder
    fprintf('Moderns ålder: ');
    if h2 == 0
        fprintf('Inte normalfördelad (p-värde: %f)\n', p2);
    else
        fprintf('Normalfördelad (p-värde: %f)\n', p2);
    end

%% Moderns vikt
    fprintf('Moderns vikt: ');
    if h3 == 0
        fprintf('Inte normalfördelad (p-värde: %f)\n', p3);
    else
        fprintf('Normalfördelad (p-värde: %f)\n', p3);
    end

%% Moderns längd
    fprintf('Moderns längd: ');
    if h4 == 0
        fprintf('Inte normalfördelad (p-värde: %f)\n', p4);
    else
        fprintf('Normalfördelad (p-värde: %f)\n', p4);
    end