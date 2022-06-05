%% Description
% 1.A MATLAB code for Human Learning Optimization(HLO) algorithm [1] is developed for a simple test problems in this file.
% 2.Main program of HLO which is "SHLO.m",and HLO code is tested and verified for a simple problem.
% 3.Anybody can use this code for their application, by developing their own fitness function for the unique problems.
% 4.For any new test problem (application), the following modifications are sufficient.They are listed down.
% 5.For complicated problems, it is better to introudce the re-learning operator given in [2] to obtain better results.
% 6.There is an adaptive simplified HLO in [3],which change the mode of 'pr'and 'pi'.

%% Problem Dependent variables
% popsize                       % Population size
% runtimes                      % Number of runs
% Gmax                          % Mzx number of generations - stopping criteria
% Dim=2;                        %Variable number
% bit=30;                       %Bits numbers
% Xmax=100;                     %Vaiable range
% Xmin=-100;                    %Vaiable range   
% load sphere_func_data.mat     %Test different function need change this files
%% Test problem 
% Evfit                         %Fitness function                    

%% References:
% 1.Ling Wang, Haoqi Ni, Ruixin Yang, Minrui Fei, Wei Ye. A Simple Human Learnibg Optimization Algorithm. 
% Communications in Computer and Information Science. 2014,v462:56-65
% 2.Ling Wang, Ruixin Yang, Haoqi Ni, Wei Ye, Minrui Fei, and Panos M. Pardalos. A Human Learning Optimization 
% Algorithm and Its Application to Multi-dimensional Knapsack Problems. Applied Soft Computing. 2015,34:736-743
% 3.Ling Wang, Haoqi Ni, Ruixin Yang, Panos M. Pardalos, Xin Du, Minrui Fei. An Adaptive Simplified Human 
% Learning Optimization Algorithm. Information Sciences. 2015,320:126-139
%% Açýklama
% 1.A Ýnsan Öðrenimi Optimizasyonu (HLO) algoritmasý için bir MATLAB kodu [1] bu dosyadaki basit bir test problemi için geliþtirilmiþtir.
% 2. "SHLO.m" olan HLO ana programý ve HLO kodu basit bir problem için test edilmiþ ve doðrulanmýþtýr.
% 3. Herkes bu problemi kendi uygulamalarýnda, kendine özgü problemler için kendi uygunluk fonksiyonunu geliþtirerek kullanabilir.
% 4.Herhangi bir yeni test problemi (uygulama) için aþaðýdaki deðiþiklikler yeterlidir.
% 5.Kompleks problemler için, daha iyi sonuçlar elde etmek için [2] 'de verilen yeniden öðrenme operatörünü zorlamak daha iyidir.
% 6. 'pr' ve 'pi' modunu deðiþtiren [3] 'te uyarlanabilir basitleþtirilmiþ bir HLO var.

%% Problem Baðýmlý deðiþkenler
% popsize% Nüfus büyüklüðü
% runtimes% Koþu sayýsý
% Gmax% Mzx nesil sayýsý - durma kriterleri
% Dim = 2; % Deðiþken sayý
% bit = 30; % Bit sayýlarý
% Xmax = 100; % Deðiþken aralýðý
% Xmin = -100; % Deðiþken aralýðý
% load sphere_func_data.mat% Test farklý fonksiyon bu dosyalarý deðiþtirmek gerekir
%% Test sorunu
% Evfit% Uygunluk Fonksiyonu

% %% Referanslar:
% 1.Ling Wang, Haoqi Ni, Ruixin Yang, Minrui Fei, Wei Ye. Basit Bir Ýnsan Öðrenme Optimizasyonu Algoritmasý.
% Bilgisayar ve Biliþim Biliminde Ýletiþim. 2014 v462: 56-65
% 2.Ling Wang, Ruixin Yang, Haoqi Ni, Wei Ye, Minrui Fei ve Panos M. Pardalos. Bir Ýnsan Öðrenme Optimizasyonu
% Algoritma ve Çok Boyutlu Sýrt Çantasý Problemlerine Uygulamasý. Uygulamalý Yumuþak Hesaplama. 2015,34: 736-743
% 3.Ling Wang, Haoqi Ni, Ruixin Yang, Panos M. Pardalos, Xin Du, Minrui Fei. Uyarlanabilir Basitleþtirilmiþ Ýnsan
% Öðrenme Optimizasyonu Algoritmasý. Bilgi Bilimleri 2015.320: 126-139