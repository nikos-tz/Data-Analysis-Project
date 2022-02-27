% Navrozidis Ioannis
% Tzatsis Nikolaos

user = 'Nikos';

datadir = ['C:\Users\', user, '\Desktop\'];
data1txt = 'Group79Exe1Data1';
data2txt = 'Group79Exe1Data2';

xV = load([datadir, data1txt, '.txt']);
yV = load([datadir, data2txt, '.txt']);

n = length(xV);

B = 1000;
alpha = 0.05;
H = 0;
M = 100;
hM = NaN(M,1);

klower = floor((B+1)*alpha/2);
kup = B+1-klower;

for iM = 1:M

    boot_xy = NaN(B,1);
    for iB=1:B
        xyV = [xV; yV];
        rV = unidrnd(2*n,2*n,1);
        xbV = xyV(rV(1:n));
        ybV = xyV(rV( (n+1) : (2*n)) );

        xb_KS = NaN(n,1);
        yb_KS = NaN(n,1);

        for i = 1:n
            xb_KS(i) = ( length( find(xbV <= xbV(i)) ) - 1 ) / n;
            yb_KS(i) = (length( find(ybV <= ybV(i)) ) - 1 ) / n;
        end

        xyb_KS = xb_KS - yb_KS;


        boot_xy(iB) = max( abs(xyb_KS) );   

    end

    x_KS = NaN(n,1);
    y_KS = NaN(n,1);

    for i = 1:n
        x_KS(i) = ( length( find(xV <= xV(i)) ) - 1 ) / n;
        y_KS(i) = (length( find(yV <= yV(i)) ) - 1 ) / n;
    end

    xy_KS = x_KS - y_KS;
    xy_KS = max( abs(xy_KS) );
    
    %{
        xrisimopoioyme to statistiko sta arxika mas deigmata kai blepoyme
        ti thesi toy mesa sta diatetagmena bootstrap statistika, opws
        akrivws mas lene oi shmeiwseis stin paragrafo 3.4.4 (selida 60) gia 
        ton elegxo tixaias antimetathesis 
    %}

    rank = length( find( boot_xy <= xy_KS ) ) + 1;


    if( (rank<klower) | (rank>kup) )
        H = 1; %reject

        if( rank>kup )
            rank = length( find( boot_xy < xy_KS ) ) + 1;
            if(rank<kup)
                H = 0;
            end
        end
    end
    
    hM(iM) = H;

end

reject_perc_boot = sum(hM) / M;

fprintf('\nfor alpha = %1.3f and M = %d \n', alpha, M )
fprintf('reject percentance from bootstrap is: %f\n', reject_perc_boot);



%{
    Vlepoyme oti kai stis 100 dokimes den eixame praktika kamia aporipsi
    tis ypothesis mas opote den mporoyme na poyme oti oi katanomes
    diaferoyn me vash to statistiko Kolmogorov-Smirnov
%}



