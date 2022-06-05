%% y=x1*x1+x2*x2
function f = Evfit(fx,popsize,o)
% 1. Bu fonksiyon uygunluk fonksiyonlar�n� vekt�rlerle birlikte ger�ek kodda d�nd�r�r.
% 2.'o ',' sphere_func_data.mat 'dosyalar�ndaki de�i�kenler
% 3. Farkl� problemler uygunluk fonksiyonu olan 'f' �eklini de�i�tirebilir.
f = zeros(popsize,1);
f = (fx(:,1)-o(1,1)).^2 + (fx(:,2)-o(1,2)).^2;

end