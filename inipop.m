function f = inipop(popsize,m)

%% A��klama
% 1. Bu i�lev, [popsize, m] boyutundaki matris popusunu ba�latmakt�r.
% 2. Giri� matrisin boyutudur.
% 3. ��kt�, [popsize, m] boyutunda ikili matristir.

%% Intial the matrix
f = zeros(popsize,m);
for i = 1:popsize
    for j = 1:m
        if rand < 0.5
            f(i,j) = 1;
        else
            f(i,j) = 0;
        end
    end
end

end