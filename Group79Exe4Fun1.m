% Navrozidis Ioannis
% Tzatsis Nikolaos

function boot_cp = Group79Exe4Fun1(xM, yM, B, alpha, M)
    n = size(xM, 1);
  
    cidmxM = NaN(M,2); % the two are for the percentile bootstrap ci 
                  % for mean difference
    klower = floor((B+1)*alpha/2);
    kup = B+1-klower;
    tailpercV = [klower kup]*100/B;
        
    for iM = 1:M
        % Percentile bootstrap ci for mean
        bootdmxV = NaN(B,1);
        for iB=1:B
            rV = unidrnd(n,n,1);
            xbV = xM(rV);
            rV = unidrnd(n,n,1);
            ybV = yM(rV);
            bootdmxV(iB) = mean(xbV)-mean(ybV);
        end
        cidmxM(iM,1:2) = prctile(bootdmxV,tailpercV);
    end

    ibootV = find(cidmxM(:,1)<0 & cidmxM(:,2)>0);
    boot_cp = double(length(ibootV))/double(M);
    

end