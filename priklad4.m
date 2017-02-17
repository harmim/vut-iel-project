clc;
clear;

%zadane hodnoty
U1=35;
U2=55;
R1=12;
R2=14;
R3=10;
L1=120*10^-3;
L2=100*10^-3;
C1=200*10^-6;
C2=105*10^-6;
f=70;

%uhlova frekvence
o=2*pi*f;

%vypocet determinantu matice 0
mat0 = [
    R1+o*L2*1i+R2+o*L1*1i -R2-o*L1*1i -o*L2*1i; 
    -o*L1*1i-R2 o*L1*1i+R2-(1/(o*C2))*1i-(1/(o*C1))*1i (1/(o*C2))*1i;
    -o*L2*1i (1/(o*C2))*1i o*L2*1i+R3-(1/(o*C2))*1i;
];
disp('Matice 0');
disp(mat0);
det0 = det(mat0);
disp('Determinant matice 0');
disp(det0);

%vypocet determinantu matice 2
mat2 = [
    R1+o*L2*1i+R2+o*L1*1i 0 -o*L2*1i; 
    -o*L1*1i-R2 35 (1/(o*C2))*1i;
    -o*L2*1i 55 o*L2*1i+R3-(1/(o*C2))*1i;
];
disp('Matice 2');
disp(mat2);
det2=det(mat2);
disp('Determinant matice 2');
disp(det2);

%vypocet proudu IC1
disp('IC1:');
IC1=det2/det0;
disp(IC1);

%vypocet reaktance XC1
XC1=-(1/(o*C1))*1i;
disp('XC1');
disp(XC1);

%vypocet napeti UC1
UC1=IC1*XC1;
disp('UC1');
disp(UC1);

%vypocet velikosti napeti UC1
disp('|UC1|');
disp(abs(UC1));

%vypocet fazoveho posunu FiC1
FiC1=atan(imag(UC1)/real(UC1));
disp('FiC1');
disp(FiC1);