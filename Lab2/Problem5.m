%% Problem 5 - Test av normalitet
% Ladda upp datan till MATLAB från 'birth.dat'
fileID = fopen('birth.dat', 'rt');
rawData = fread(fileID, '*char')';
fclose(fileID);
% Replace consecutive delimiters with a single space
cleanData = regexprep(rawData, ' +', ' ');
% Read specific columns from the cleaned data
formatSpec = '%*f %*f %*f %f %f %*f %*f %*f %*f %*f %*f %*f %*f %*f %*f %f %f %*[^\n]';
dataArray = textscan(cleanData, formatSpec, ...
'Delimiter', ' ', ...
'CollectOutput', true);
data = cell2mat(dataArray);

% Extrahera de relevanta kolumnerna för de fyra variablerna
fodelsevikt = data(:,1);
mors_alder = data(:,2);
mors_vikt = data(:,3);
mors_langd = data(:,4);
% Använder `jbtest` för att utföra Jarque-Bera-testet på varje kolumn och lagrar resultaten.
[h1, p1] = jbtest(fodelsevikt);
[h2, p2] = jbtest(mors_alder);
[h3, p3] = jbtest(mors_vikt);
[h4, p4] = jbtest(mors_langd);

% Skriver ut resultatet för de fyra variablerna och kontrollera om de är normalfördelade vid signifikansnivån 5%.
alpha = 0.05;

% Barnets vikt
fprintf('Barnets födelsevikt: ');
if p1 < alpha
    fprintf('Inte normalfördelad (p-värde: %f)\n', p1);
else
    fprintf('Normalfördelad (p-värde: %f)\n', p1);
end

% Moderns ålder
fprintf('Moderns ålder: ');
if p2 < alpha
    fprintf('Inte normalfördelad (p-värde: %f)\n', p2);
else
    fprintf('Normalfördelad (p-värde: %f)\n', p2);
end

% Moderns vikt
fprintf('Moderns vikt: ');
if p3 < alpha
    fprintf('Inte normalfördelad (p-värde: %f)\n', p3);
else
    fprintf('Normalfördelad (p-värde: %f)\n', p3);
end

% Moderns längd
fprintf('Moderns längd: ');
if p4 < alpha
    fprintf('Inte normalfördelad (p-värde: %f)\n', p4);
else
    fprintf('Normalfördelad (p-värde: %f)\n', p4);
end