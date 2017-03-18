function f = fn(t,m,n)
%FN Calculates the approximation function to be convolved with the data
%   t: position of sample within the window
%   m: window size [-m:m], of 2m+1 elements
%   n: polynomial degree

gff = @(a,b) prod(a-(0:b-1)); % a(a-1)(a-2)..(a-b+1) % prod(a:(a-b+1)) does not work % #nicehack

f = [];
for i = -m:m
  fi = 0;
  for k = 0:n
    fi = fi + (2*k+1)*gff(2*m,k)/gff(2*m+k+1,k+1)*grampoly(k,m,i)*grampoly(k,m,t);
  end
  f = [f fi];
end
end
