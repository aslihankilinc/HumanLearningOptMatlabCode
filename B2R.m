function Rpopus= B2R(popus,dim,Xmax,Xmin)
%% A��klama
% 1.Bu i�lev, ikili kodu, �nbelle�e almak i�in ger�ek koda d�n��t�rmektir
%Uygunluk i�levi%.
% 2.Input, boyutu [popsize, m] olan ikili matris popusudur.
% 3.Output, boyutu [popsize, 1] olan ger�ek matris Rpopus'tur.

%% code starts
[popsize m] = size(popus);
bit = m / dim;
Rpopus = zeros(popsize,dim);
for i = 1:popsize
    for d = 1:dim
       for j = 1 + (d-1) * bit:d * bit
           Rpopus(i,d) = Rpopus(i,d) + (popus(i,j) * 2^( d * bit -j));
       end
        Rpopus(i,d) = Xmin + (Xmax - Xmin) * (Rpopus(i,d) / ( 2^bit - 1));             
    end
end
end

