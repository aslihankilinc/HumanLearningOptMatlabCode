%% A demo of HLO
% Coded by Panpan Li, Ji Pei, Yalan Wen; reviewed by Ling Wang
% revised on 2017-12-8 
% 1. This is a simple demo of HLO [1]. It is just tested by a simple function
% which is y = x1^2 + x2^2.
% 2.This code defines the population size in 'popsize', number of design 
% variables in 'Dim', number of runs in 'runtimes', maximum number of
% generations in 'Gmax',current generation in 't'and bit number for each
% variable is 'bit'.
% 3.'Xmin' and 'Xmax' are the lower and upper bounds of the design variables.
% 4.'pr'is the probability of random learning ,the values of (pi-pr) and
% (1-pi) represents the probabilities of performing individual learning and
% social learning, respectiely.
% 5.'IKD' is the individual knowledge database since the size of IKD=1 here;
% 'SKD' is the social knowledge database and the size of SKD is 1 in this demo.
% 6.For complicated problems, it highly recommends to introudce the re-learning
% operator given in [2] to obtain much better results.
% 7.HLO is sensitive to the parameters p_r and pi. A simple adaptive strategy 
% is given in [3] to relieve the effort of parameter setting.
% Bu, HLO'nun basit bir demosu [1]. 
% Sadece y = x1 ^ 2 + x2 ^ 2 olan basit bir fonksiyonla test edilir. 
% 2.Bu kod 'popsize' popülasyon büyüklüðünü, 'Dim' tasarým deðiþkenlerinin sayýsýný,
% 'çalýþma zamanlarýnda' çalýþma sayýsýný, 
% 'Gmax' cinsinden maksimum nesil sayýsýný,
% 't' cinsinden mevcut üretimi ve her biri için bit sayýsýný tanýmlar. deðiþken 'bit'.
% 3. 'Xmin' ve 'Xmax', tasarým deðiþkenlerinin alt ve üst sýnýrlarýdýr.
% 
% (p-pr) ve (1-pi) 'nin deðerleri, bireysel öðrenme ve sosyal öðrenme
% 5. 'IKD', burada IKD'nin büyüklüðü = 1 olduðu için kiþisel bilgi veritabanýdýr;
% 'SKD' Sosyal bilgi veritabaný olup SKD'nin büyüklüðü bu demoda 1'dir. 


%% Code starts
clear;
clc;
format long;
popsize = 50;            
runtimes = 1;           % Koþu sayýsý
Gmax = 3000;            % Maksimum nesil sayýsý - durma kriterleri
Dim = 2;                % Deðiþken sayý
bit = 32;              %  Bit sayýlarý
m = bit * Dim;          %Bireysel uzunluk
Xmax = 100;             %Deðiþken aralýk
Xmin = -100;            %Deðiþken aralýk           
p_r = 5.0 / m;               
p_i = 0.85 + 2.0 / m;          

load sphere_func_data.mat;   %Transfer the data of the F1:Shifted Sphere Function in CEC2005

for cn=1:runtimes
%%Ýlk popülasyon
    popus = inipop(popsize,m);    
    Rpopus = B2R(popus,Dim,Xmax,Xmin);                      %% Ýkili dosyayý gerçek koda dönüþtürün
    
%% Uygunluk fonksiyonunu deðerlendirin ve IKD ve SKD'yi baþlatýn
    Fits = Evfit(Rpopus,popsize,o);                         % Uygunluk fonksiyonu deðerlendirmesi
    IKDfits = Fits;                                         % % en iyi kiþisel uygunluk  
    IKD = popus;           
    
%% Ýlk SKD
    [arrange,position] = sort(IKDfits,1);               
    SKDfit = IKDfits(position(1,1),1);                    
    SKD = IKD(position(1,1),:);                            % En iyi birey (ikili)
    
%% Nesil Baþlýyor
    for t = 1:Gmax
        for i = 1:popsize
            for j = 1:m
             prob = rand;
                if  prob < p_r && prob > 0                     	% rasgele öðrenme ise eðer rand <0.5
                    if rand < 0.5
                        popus(i,j) = 1;
                    else
                        popus(i,j) = 0;
                    end
                elseif prob >= p_r && prob < p_i                   % bireysel öðrenme
                    popus(i,j) = IKD(i,j);
                elseif prob >= p_i  && prob < 1               	% sosyal öðrenme
                    popus(i,j) = SKD(1,j);   
                end
            end
        end
%% Uygunluk fonksiyonu deðerlendirmesi
        Rpopus = B2R(popus,Dim,Xmax,Xmin);                	%% binary-string'i gerçek deðiþkenlere dönüþtürün
        Fits = Evfit(Rpopus,popsize,o);                  	%% Uygunluk fonksiyonu deðerlendirmesi
%% IKD'yi deðerlendirin
        for i = 1:popsize
            if Fits(i) < IKDfits(i)
                IKDfits(i) = Fits(i);
                IKD(i,:) = popus(i,:);
            end
        end
%% SKD'yi deðerlendirin
        [arrange,postion] = sort(IKDfits,1);                           
        if arrange(1,1) < SKDfit   	% Bu kuþaðýn en iyi spor gloabl iyi uygunluk daha iyi olduðunda, o zaman güncelleme
            SKDfit = arrange(1,1);
            SKD = IKD(postion(1,1),:);
        end
        if (mod(t,200))==0
        fprintf('the %d round\n',t);
        end
        
    end
    fprintf('runtimes = %d\n the best value is:',cn);
    disp(SKDfit);
end
