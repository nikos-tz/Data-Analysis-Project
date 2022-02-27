% Navrozidis Ioannis
% Tzatsis Nikolaos

%{
    Ta dedomena apo to FullEodyData.xlsx gia tin Ellada einai lathos. Pio
    sigkekrimena einai lathos oi arithmoi twn rapid kai pcr test, opote tha
    ylopoihsoyme tin lysh alla den tha mporesoyme na tin testaroyme, kathws
    den mporesame na vroyme kapoy alloy ta dedomena
%}

gr_prM = NaN(7,12); % pinakas me toys hmerisious diktes thetikotitas tis elladas
                    % kathe stili einai kai mia vdomada
                    
eu_prV = NaN(12,1); % Eixame to Belgio ws xwra A opote edw pera tha htan oi
                    % oi teleftaies 9 evdomadas toy 21' kai oi prwtes 3 toy
                    % 22', tha mporoysame na ftiaksoyme ayton ton pinaka
                    % alla den exei nohma kathws den exoyme ayton tis
                    % elladas

[n, m] = size(gr_prM);

B = 1000;
alpha = 0.05;

hV = NaN(m,1);
signV = NaN(m,1);

for i = 1:m 
    [hV(i), signV(i)] = Group79Exe3Fun1(gr_prM(:,i), eu_prV(i), B, alpha);
end

gr_pr_mu = mean(gr_prM);

x = [44:52 1:3];

figure(1)
clf

plot(x, gr_pr_mu);
hold on

plot(x, eu_prV);
hold on

for i = 1:m
    
    if(signV(i) > 0)
        plot( [x(i) x(i)], [gr_pr_mu(i) eu_prV(i)], '-g', 'LineWidth', 2)
        hold on
    elseif(signV(i) < 0)
        plot( [x(i) x(i)], [gr_pr_mu(i) eu_prV(i)], '-r', 'LineWidth', 2)
        hold on
    end
    
end

xlabel('week')
ylabel('percentage')
title(sprintf('positivity rate of Greece and EU'))








