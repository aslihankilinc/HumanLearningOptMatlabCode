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
%% A��klama
% 1.A �nsan ��renimi Optimizasyonu (HLO) algoritmas� i�in bir MATLAB kodu [1] bu dosyadaki basit bir test problemi i�in geli�tirilmi�tir.
% 2. "SHLO.m" olan HLO ana program� ve HLO kodu basit bir problem i�in test edilmi� ve do�rulanm��t�r.
% 3. Herkes bu problemi kendi uygulamalar�nda, kendine �zg� problemler i�in kendi uygunluk fonksiyonunu geli�tirerek kullanabilir.
% 4.Herhangi bir yeni test problemi (uygulama) i�in a�a��daki de�i�iklikler yeterlidir.
% 5.Kompleks problemler i�in, daha iyi sonu�lar elde etmek i�in [2] 'de verilen yeniden ��renme operat�r�n� zorlamak daha iyidir.
% 6. 'pr' ve 'pi' modunu de�i�tiren [3] 'te uyarlanabilir basitle�tirilmi� bir HLO var.

%% Problem Ba��ml� de�i�kenler
% popsize% N�fus b�y�kl���
% runtimes% Ko�u say�s�
% Gmax% Mzx nesil say�s� - durma kriterleri
% Dim = 2; % De�i�ken say�
% bit = 30; % Bit say�lar�
% Xmax = 100; % De�i�ken aral���
% Xmin = -100; % De�i�ken aral���
% load sphere_func_data.mat% Test farkl� fonksiyon bu dosyalar� de�i�tirmek gerekir
%% Test sorunu
% Evfit% Uygunluk Fonksiyonu

% %% Referanslar:
% 1.Ling Wang, Haoqi Ni, Ruixin Yang, Minrui Fei, Wei Ye. Basit Bir �nsan ��renme Optimizasyonu Algoritmas�.
% Bilgisayar ve Bili�im Biliminde �leti�im. 2014 v462: 56-65
% 2.Ling Wang, Ruixin Yang, Haoqi Ni, Wei Ye, Minrui Fei ve Panos M. Pardalos. Bir �nsan ��renme Optimizasyonu
% Algoritma ve �ok Boyutlu S�rt �antas� Problemlerine Uygulamas�. Uygulamal� Yumu�ak Hesaplama. 2015,34: 736-743
% 3.Ling Wang, Haoqi Ni, Ruixin Yang, Panos M. Pardalos, Xin Du, Minrui Fei. Uyarlanabilir Basitle�tirilmi� �nsan
% ��renme Optimizasyonu Algoritmas�. Bilgi Bilimleri 2015.320: 126-139