i = imread('C:\Users\ahmet\OneDrive\Masaüstü\BİTİRME PROJESİ\Görüntü işleme\daire.png');
c=i;
cn1 = rgb2ntsc(c);
cn1(:,:,2) = 0;
cn1(:,:,3) = 0;
cn1(:,:,1) = edge(cn1(:,:,1),'Prewitt');
c1 = ntsc2rgb(cn1);

cn2 = rgb2ntsc(c);
cn2(:,:,1) = 0;
cn2(:,:,3) = 0;
cn2(:,:,2) = edge(cn2(:,:,2),'Prewitt');
c2 = ntsc2rgb(cn2);

cn3 = rgb2ntsc(c);
cn3(:,:,1) = 0;
cn3(:,:,2) = 0;
cn3(:,:,3) = edge(cn3(:,:,3),'Prewitt');
c3 = ntsc2rgb(cn3);


%Ye = cn1(:,:,1);
%Ie = cn2(:,:,2);
%Qe = cn3(:,:,3);

Ye = c1;
Ie = c2;
Qe = c3;

S = cat(3,Ye,Ie,Qe);
T1 = imadd(Ye,Ie);
T = imadd(T1,Qe);

%Tor1 = bitor(Ye,Ie);
%Tor = bitor(Tor1,Qe);

figure
subplot(2,2,1),imshow(c1),title('Y edge')
subplot(2,2,2),imshow(c2),title('I edge')
subplot(2,2,3),imshow(c3),title('Q edge')
subplot(2,2,4),imshow(T),title('Toplam')










%YIQ için
c=i;
cn1 = rgb2ntsc(c);
cn1(:,:,2) = 0;
cn1(:,:,3) = 0;
cR1 = edge(cn1(:,:,1),'Prewitt');
%AAA = ntsc2rgb(double(cR1));

cn2 = rgb2ntsc(c);
cn2(:,:,1) = 0;
cn2(:,:,3) = 0;
cR2 = edge(cn2(:,:,2),'Prewitt');

cn3 = rgb2ntsc(c);
cn3(:,:,1) = 0;
cn3(:,:,2) = 0;
cR3 = edge(cn3(:,:,3),'Prewitt');

cN1 = cat(3,cR1,cn1(:,:,2),cn1(:,:,3));
cNY = ntsc2rgb(double(cN1));

cN2 = cat(3,cn2(:,:,1),cR2,cn2(:,:,3));
cNI = ntsc2rgb(double(cN2));

cN3 = cat(3,cn3(:,:,1),cn3(:,:,2),cR3);
cNQ = ntsc2rgb(double(cN3));

cT = cat(3,cR1,cR2,cR3);
cnT = ntsc2rgb(double(cT));

%cNI1 = edge(cNI(:,:,1));
%cNQ = edge(cNQ(:,:,3));

cn2 = cNY + cNI + cNQ;
%Sumc1 = imadd(cNY,cNI);
%Sumc = imadd(Sum1,cNQ);



%cNor1 = bitor(uint8(cNY),uint8(cNI));
%cNor = bitor(cNY,int8(cNQ));


subplot(3,4,11),imshow(cNI),title('YIQ Toplam')
subplot(3,4,12),imshow(cNQ),title('YIQ cnRR')