% Navrozidis Ioannis
% Tzatsis Nikolaos

user = 'nikos';

datadir = ['C:\Users\', user, '\Desktop\'];
data1txt = 'Group79Exe4Data1';

xallM = load([datadir, data1txt, '.txt']);

m = size(xallM, 2);
B = 1000;
alpha = 0.05;
M = 100;

boot_cpV = NaN(m, 1);

for im = 1:m
   boot_cpV(im) = Group79Exe4Fun1(xallM(1:9, im), xallM(10:18, im), B, alpha, M); 
end

x = [ 1 2 3 4 5 ];
figure(1)
clf

plot(x, boot_cpV)

%{
        to matlab lanthasmena bgazei toys teleftaioys 4 arithmous mhden,
        kanonika einai konta sto 1 opote yparxei simfwnia apotelesmatwn. an
        kalesoyme tin sinarthsh gia im = 4 tha doyme oti to ibootV vgaine
        94 kai to boot_cp 0.94 alla meta sthn timh boot_cpV vazei mhden.
        Isws fysika na exoyme kanei kai emeis kapoy lathos

%}
