function chiVal = chinsq(y,n)
%CHINSQ Calculates the sum of squares of fitting residuals

ny = length(y);
m = (ny-1)/2;

fnt = [];
for t = -m:m
  fnt = [fnt; fn(t,n,y)];
end

chiVal = sum((y(:) - fnt).^2);

end