function f = inipop(popsize,m)

%% Açýklama
% 1. Bu iþlev, [popsize, m] boyutundaki matris popusunu baþlatmaktýr.
% 2. Giriþ matrisin boyutudur.
% 3. Çýktý, [popsize, m] boyutunda ikili matristir.

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