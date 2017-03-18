function f = fn(t,n,y)
%FN Calculates the approximated data points
%   t: position of sample within the window
%   n: polynomial degree
%   y: data

ny = length(y);
m = (ny-1)/2;

gff = @(a,b) prod(a-(0:b-1)); % a(a-1)(a-2)..(a-b+1) % prod(a:(a-b+1)) does not work % #nicehack
yi = @(i,m) y(i+m+1);

f = 0;
for i = -m:m
  for k = 0:n
    f = f + (2*k+1)*gff(2*m,k)/gff(2*m+k+1,k+1)*grampoly(k,m,i)*grampoly(k,m,t)*yi(i,m);
  end
end
end