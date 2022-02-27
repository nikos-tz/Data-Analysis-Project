% Navrozidis Ioannis
% Tzatsis Nikolaos

datadir = 'C:\Users\zerva\Desktop\';
datatxt = 'Group79Exe1Data';

yearV = [2021; 2020];
weekV = [45; 48];

for i = 1:2
    
    xV = load([datadir, datatxt, int2str(i), '.txt']);
    
    %xV = xV/100;
    
    n = length(xV);
    
    num_bins = round(sqrt(n));
    
    year = yearV(i);
    week = weekV(i);
    
    figure(i);
    clf;
    
    subplot(2, 2, 1)
    histfit(xV, num_bins, 'normal')
    title([int2str(year), ' week ', int2str(week), ': normal fit'])
    
    subplot(2, 2, 2)
    histfit(xV, num_bins, 'exponential')
    title([int2str(year), ' week ', int2str(week), ': exponential fit'])
    
    subplot(2, 2, 3)
    boxplot(xV);
    title([int2str(year), ' week ', int2str(week), ': boxplot'])
    
    pu_normal = fitdist(xV, 'normal')
    pu_exp = fitdist(xV, 'exponential')
    
    
end



%{ 

    Sxolia:

    Gia tin Gallia kai tin Letonia xrisimopoihsame thn evdomada 43 anti tis  
    45 gia to 2020 kathws h 45 den yphrxe sto arxeio kai h 43 htan h pio 
    kontinh.


    Symperasmata:

    Arxika vlepoyme pws kai stis 2 katanomes tairiazoyn toso h kanoniki oso
    kai h ekthetiki katanomi. Omos kai ta 2 thikogrammata einai arketa mh
    simmetrika kathos i mia toys oura einai poly megaliteri apo thn allh,
    opote kataligoume sto oti i ekthetiki katanomi tairiazei kai perigrafei
    kalitera kai tis 2 katanomes. Telos, sthn konsola fainontai ta
    apotelesmata apo to fitdist() opoy paratiroyme oti to evros timwn toy
    diastimatos empistosinis gia thn mesi timi einai pio megalo gia tin
    ekthetiki katanomi kai stis 2 katanomes mas.
%}







