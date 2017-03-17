function p = grampoly2(k,m,i)
%GRAMPOLY2 Calculates Gram polynomials
%   Recursive version (slow for big k values)
%   Ref: P.A.Gorry, Anal. Chem. 62 (1990) 570

switch(k)
  case -1
    p = 0;
  case 0
    p = 1;
  otherwise
    p = 2*(2*k-1)/k/(2*m-k+1)*i*grampoly2(k-1,m,i)-(k-1)*(2*m+k)/k/(2*m-k+1)*grampoly2(k-2,m,i);
end
end