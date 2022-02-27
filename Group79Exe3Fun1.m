function [H, sign] = Group79Exe3Fun1(xV, eu_pr, B, alpha)
    n = length(xV);
    
    ci_xV = NaN(1, 2);
    
    klower = floor((B+1)*alpha/2);
    kup = B+1-klower;
    tailpercV = [klower kup]*100/B;
    
    boot_xV = NaN(B,1);
    for iB = 1:B
        rV = unidrnd(n,n,1);
        xbV = xV(rV);
        boot_xV(iB) = mean(xbV);
    end
    
    ci_xV(1:2) = prctile(boot_xV, tailpercV);
    
    if( eu_pr < ci_xV(1) )
        H = 1;
        sign = 1; % sign > 0 giati o deikths tis elladas einai simantika megaliteros
    elseif ( eu_pr > ci_xV(2) )
        H = 1;
        sign = -1; % edw o deikths einai simantika mikroteros
    else
        H = 0;
        sign = 0;
    end
            
            
    
end


