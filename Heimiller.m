%Phase shift pulse codes with good periodic correlation properties, R. C.%Heimiller

p = 7; % prime number

%pth roots of unity
% Construct a polynomial of form z^p - 1
eqn = zeros(1,p+1);
eqn(1) = 1;
eqn(p+1) = -1;

z = roots(eqn);

seq = zeros(p,p);
 
for i = 1:p
    for j = 1:p
        seq(i,j) = z(i) ^ j
    end
end
% periodic correlation of sequences formed from powers of a root of unity
% Select a root, example 5th root in z above is z(5)
% Cm = {1,z(5),z(5)^2.....,z(5)^6}
% Periodic auto-correlation of the sequence, make autocorr = 1
% Periodic cross correlation autocorr = 0, will slect root 4 & 5 for demo
autocorr = 0;
if(autocorr == 1)
    xun = seq(4,:);
else if(autocorr == 0)
    xun = seq(4,:);
    xum = seq(5,:);
end
end

for shift = 0:6
    m = 0: p -1;
    if(autocorr == 1)
        xum = zeros(1,length(m));
        xum(find((m >= 0) & (m<= p-shift-1))) = xun(shift+1:p);
        xum(find((m >= p-shift) & (m < p))) = xun(1:shift);
    end
    xun_ = conj(xun);
    y = sum(xum .* xun_);
    stem(shift,abs(y));
    hold on
end

