nzc = 139;
root = 25;
n = 0:nzc-1;
xun = exp(-j*pi*root*n.*(n+1)/nzc);
%shift = 30;
grid('on');
for shift = 0:30
    m = 0: nzc -1;
    xum = zeros(1,length(m));
    xum(find((m >= 0) & (m<= nzc-shift-1))) = xun(shift+1:nzc);
    xum(find((m >= nzc-shift) & (m < nzc))) = xun(1:shift);

    %stem(m,abs(xum));
    %hold on;
    %stem(n,abs(xun));
    xun_ = conj(xun);
    y = 1/nzc .* sum(xum .* xun_);
    stem(shift,abs(y));
    hold on
end    
