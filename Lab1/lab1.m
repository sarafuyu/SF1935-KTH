%% Problem 1: Simulering av exponentialfordelade slumptal

% mu = 10;
% N = 1e4;
% y = exprnd(mu, N, 1); % Genererar N exp-slumptal
% hist_density(y); % Skapar ett normaliserat histogram
% t = linspace(0, 100, N/10);% Vektor med N/10 punkter
% hold on
% plot(t, exppdf(t, mu), 'r') % 'r' betyder rod linje
% hold off

% Hur förhåller sig histogrammet till den röda linjen och hur förklaras variationen kring denna linje?

% Histogrammet visar den empiriska fördelningen av de N slumpmässiga 
% observationerna, medan den röda linjen visar den teoretiska 
% täthetsfunktionen för en Exponential(1/10)-fördelning. Histogrammet ger 
% en uppskattning av fördelningen av slumpvariabeln baserat på de 
% observerade datavärdena, medan den teoretiska täthetsfunktionen ger en 
% matematisk modell av fördelningen.

% Om antalet observationer är tillräckligt stort bör histogrammet 
% approximera den teoretiska fördelningen som ges av täthetsfunktionen. 
% Variationen kring den röda linjen beror på slumpmässiga variationer i 
% datavärdena. Om antalet observationer är litet, kan histogrammet visa 
% större variationer från den teoretiska fördelningen.

% Det är vanligt att använda histogram som en grafisk illustration av en 
% fördelning för att undersöka dess form och egenskaper. Genom att jämföra 
% histogrammet med den teoretiska täthetsfunktionen kan man få en 
% uppfattning om hur väl fördelningen beskrivs av modellen och om det finns 
% några avvikelser eller icke-normalitet i data.

%% Problem 2: Stora talens lag

% mu = 0.5;
% M = 500;
% X = exprnd(mu, M, 1);
% plot(ones(M, 1)*mu, 'r-.')
% hold on
% for k = 1:M
%     plot(k, mean(X(1:k)), '.')
%     if k == 1
%         legend('Sant \mu', ['Skattning av ' ...
%             '\mu'],'AutoUpdate','off')
%     end
%     xlabel(num2str(k)), pause(0.001)
% end

% Punkten med x-värde k är medelvärdet av k exponentialfördelade stokastiska variabler. Ser det ut som förväntat?

% Ja, det ser ut som förväntat. Enligt den stora talens lag, när antalet 
% termer i medelvärdet går mot oändligheten, kommer medelvärdet att närma 
% sig det sanna väntevärdet för den exponentialfördelade variabeln, som i 
% detta fall är $\mu = 0.5$.

% I koden simuleras M = 500 exponentialfördelade stokastiska variabler och 
% medelvärdet av de första k variablerna plottas mot k. Plotten visar att 
% medelvärdet närmar sig det sanna väntevärdet för varje ökande k och att 
% variationen kring det sanna väntevärdet minskar med ökande k. Detta 
% stöder den stora talens lag och visar att medelvärdet av en stor mängd 
% oberoende, likafördelade stokastiska variabler konvergerar mot deras 
% sanna väntevärde när antalet variabler ökar.

%% Problem 3: Vantevarde av exp.fordelad stokastisk variabel
% mu = 10;
% N = 1e4;
% medel = 0;
% for i = 1:10
%     y = exprnd(mu, N, 1);
%     r = mean(y);
%     medel = medel + r;
%     disp(['Uppskattning ' num2str(i) ': ' num2str(r)])
% end
% disp(['Medel: ' num2str(medel/10)])

% Medelvärdet av slumptalen ger en uppskattning av väntevärdet för den 
% exponentiella fördelningen. Ju fler simuleringar vi gör och ju större 
% N är, desto bättre blir vår uppskattning.

% För att prova detta kan vi göra simuleringen och medelvärdet beräkningen 
% flera gånger och se hur resultatet varierar. Vi kan också testa olika 
% värden på N för att se hur detta påverkar uppskattningen.

%% Problem 4: Monte Carlo-skattning av talet pi

% N = 1e6;
% U = 2*rand(1,N)-1; % Genererar U(-1,1)-ford. slumptal
% V = 2*rand(1,N)-1;
% plot(U,V,'o'), hold on % Plottar de genererade punkterna
% X = -1:0.01:1;
% plot(X,sqrt(1-X.^2),'r') % Plottar enhetscirkeln
% plot(X,-sqrt(1-X.^2),'r')
% Z = (sqrt(U.^2+V.^2)<=1); % Beraknar narmevarde pa pi
% pi = 4*mean(Z);
% disp(['pi = ' num2str(pi)])

%% Problem 5 - Beräkning av sannolikheter

% Bin - binomialfördelning
% N - normalfördelning
% Exp - exponentialfördelning

% cdf - fördelningsfunktioner/sannolikhet att X <= x (fördelningen)
% pdf - sannolikhets-täthets/funktioner: summerad sannolikhet (behöver integrering)

% Definiera parametrar för fördelningarna
p = 0.3; n = 10;    % Värden X1
mu = 5; sigma = 3;  % Värden X2
lambda = 1/7;       % Värden X3

% Beräkningar frågor
% Fråga 1: fx(Xk) = Fx(Xk) -> använd cdf funktionerna
% Fråga 2: p(Xk > 7) = 1 - p(Xk <= 7)
% Fråga 3: P(3 < Xk <= 4) = P(Xk = 4) - P(Xk = 3)

% disp('Fråga 1')
% disp(['P(X1 ≤ 3) = ' num2str(binocdf(3,n,p))]) % X1
% disp(['P(X2 ≤ 3) = ' num2str(normcdf(3,mu,sigma))]) % X2
% disp(['P(X3 ≤ 3) = ' num2str(expcdf(3,7))]) % X3
% 
% disp('Fråga 2')
% disp(['P(Xk > 7) = ' num2str(1-binocdf(7,n,p))]) % X1
% disp(['P(Xk > 7) = ' num2str(1-normcdf(7,mu,sigma))]) % X2
% disp(['P(Xk > 7) = ' num2str(1-expcdf(7,7))]) % X3
% 
% disp('Fråga 3')
% disp(['P(3 < Xk ≤ 4) = ' num2str(binocdf(4, n, p) - binocdf(3, n, p))]) % X1
% disp(['P(3 < Xk ≤ 4) = ' num2str(normcdf(4, mu, sigma) - normcdf(3, mu, sigma))]) % X2
% disp(['P(3 < Xk ≤ 4) = ' num2str(exppdf(4, lambda) - exppdf(3, lambda))]) % X3

%% Problem 6: Tathetsfunktion for normalfordelning

% dx = 0.01;
% x = -10:dx:10; % Skapar en vektor med dx som inkrement
% y = normpdf(x,2,2);
% plot(x,y)

%% Problem 6: Tathetsfunktion for gammafordelning

% dx = 0.01;
% x = 0:dx:10; % Skapar en vektor med dx som inkrement
% y = gampdf(x,1,2);
% plot(x,y), hold on
% z = gampdf(x,5,1);
% plot(x,z,'r')

%% Problem 6: Fordelningsfunktion for gammafordelning

% dx = 0.01;
% x = 0:dx:10; % Skapar en vektor med dx som inkrement
% y = gamcdf(x,1,2);
% plot(x,y), hold on
% z = gamcdf(x,5,1);
% plot(x,z,'r')

%% Problem 7: Multivariat normalfordelning

% Reella värden
mux = 0;        % Förflyttar på x-axeln 
muy = 0;        % Förflyttar på y-axeln   

% Positiva värden
sigmax = 4;     % positiv tillsammans -> luta åt höger, annars vänster
sigmay = -4;    % små tal -> mindre avstånd mellan ringar

% Värden [−1, 1]
rho = -0,5;     % Pressar samman cirklarna          

plot_mvnpdf(mux, muy, sigmax, sigmay, rho)
