%% y=x1*x1+x2*x2
function f = Evfit(fx,popsize,o)
% 1. Bu fonksiyon uygunluk fonksiyonlarını vektörlerle birlikte gerçek kodda döndürür.
% 2.'o ',' sphere_func_data.mat 'dosyalarındaki değişkenler
% 3. Farklı problemler uygunluk fonksiyonu olan 'f' şeklini değiştirebilir.
f = zeros(popsize,1);
f = (fx(:,1)-o(1,1)).^2 + (fx(:,2)-o(1,2)).^2;

end