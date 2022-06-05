%% y=x1*x1+x2*x2
function f = Evfit(fx,popsize,o)
% 1. Bu fonksiyon uygunluk fonksiyonlarýný vektörlerle birlikte gerçek kodda döndürür.
% 2.'o ',' sphere_func_data.mat 'dosyalarýndaki deðiþkenler
% 3. Farklý problemler uygunluk fonksiyonu olan 'f' þeklini deðiþtirebilir.
f = zeros(popsize,1);
f = (fx(:,1)-o(1,1)).^2 + (fx(:,2)-o(1,2)).^2;

end