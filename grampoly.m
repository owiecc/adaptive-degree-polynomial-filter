function p = grampoly(k,m,i)
%GRAMPOLY2 Calculates Gram polynomials
%   Recursive version with caching (fast)
%   Ref: P.A.Gorry, Anal. Chem. 62 (1990) 570

persistent pval % cache

try
  idxsp = ismember(pval(:,1:3),[k,m,i],'rows'); % check if solution exists
  idxp = find(idxsp,1); % find the row index
catch
  idxp = []; % no solution exists
end

if idxp
  p = pval(idxp,4); % get p value from cache
else 
  
  % recursive calculation of Gram polynomials
  switch(k)
    case -1
      p = 0;
    case 0
      p = 1;
    otherwise
      p = 2*(2*k-1)/k/(2*m-k+1)*i*grampoly(k-1,m,i)-(k-1)*(2*m+k)/k/(2*m-k+1)*grampoly(k-2,m,i);
  end
  
  pval = [pval; k, m, i, p]; % add solution to cache
  
end
end