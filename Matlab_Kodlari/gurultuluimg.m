%Resmin matlab ortamına alınması
i = imread('C:\Users\ahmet\OneDrive\Masaüstü\BİTİRME PROJESİ\Görüntü işleme\daire.png');

%Resme salt & pepper gürültüsünün eklenmesi
i1 = imnoise(i, 'salt & pepper' ,0.1);
img1 = rgb2gray(i1);

%Resme gaussian gürültüsünün eklenmesi
i2 = imnoise(i, 'gaussian' ,0,0.02);
img2 = rgb2gray(i2);

%Orjinal resimlerde kenar bulma
Orjed3 = edge(img1,'Prewitt');
Orjed4 = edge(img2,'Prewitt');

%-------------------------------------
%YIQ renk uzayında salt & pepper gürültüsü eklenmiş resim için

YUQim = rgb2ntsc(i1);
YUQim1 = YUQim;

Y= YUQim(:,:,1);
I= YUQim(:,:,2);
Q= YUQim(:,:,3);

Ye = edge(Y,'Prewitt');
Ie = edge(I,'Prewitt');
Qe = edge(Q,'Prewitt');

S1 = cat(3,Ye,Ie,Qe);
S = ntsc2rgb(double(S1));

T1 = imadd(double(Ye),double(Ie));
T = imadd(T1,double(Qe));


Tor1 = bitor(Ye,Ie);
Tor = bitor(Tor1,Qe);

%RGB renk uzayında salt & pepper gürültüsü eklenmiş resim için
Re = edge(i1(:,:,1),'Prewitt');
Ge = edge(i1(:,:,2),'Prewitt');
Be = edge(i1(:,:,3),'Prewitt');
Sum1 = imadd(double(Re),double(Ge));
Sum = imadd(Sum1,double(Be));
%Sum = Re + Ge + Be;
Bor1 = bitor(Re,Ge);
Bor = bitor(Bor1,Be);


%---------------------------------------------------------

%YIQ renk uzayında gaussian gürültüsü eklenmiş resim için

YUQim2 = rgb2ntsc(i2);
YUQim3 = YUQim2;

Y1= YUQim2(:,:,1);
I1= YUQim2(:,:,2);
Q1= YUQim2(:,:,3);

Ye1 = edge(Y1,'Prewitt');
Ie1 = edge(I1,'Prewitt');
Qe1 = edge(Q1,'Prewitt');

S4 = cat(3,Ye1,Ie1,Qe1);
S3 = ntsc2rgb(double(S4));

T4 = imadd(double(Ye1),double(Ie1));
T3 = imadd(T4,double(Qe1));


Tor4 = bitor(Ye1,Ie1);
Tor3 = bitor(Tor4,Qe1);

%RGB renk uzayında gaussian gürültüsü eklenmiş resim için
Re1 = edge(i2(:,:,1),'Prewitt');
Ge1 = edge(i2(:,:,2),'Prewitt');
Be1 = edge(i2(:,:,3),'Prewitt');
Sum3 = imadd(double(Re1),double(Ge1));
Sum2 = imadd(Sum3,double(Be1));
%Sum2 = Re1 + Ge1 + Be1;
Bor3 = bitor(Re1,Ge1);
Bor2 = bitor(Bor3,Be1);




figure
subplot(4,4,1),imshow(i1),title('Orjinal Salt & Pepper')
subplot(4,4,2),imshow(T),title('YIQ Toplam S&P')
subplot(4,4,3),imshow(Orjed3),title('Orjinal Edge S&P')
subplot(4,4,4),imshow(Tor),title('YIQ OR S&P')
subplot(4,4,5),imshow(i1),title('Orjinal Salt & Pepper')
subplot(4,4,6),imshow(Sum),title('RGB Toplam S&P')
subplot(4,4,7),imshow(Orjed3),title('Orjinal Edge S&P')
subplot(4,4,8),imshow(Bor),title('RGB OR S&P')
subplot(4,4,9),imshow(i2),title('Orjinal Gaussian')
subplot(4,4,10),imshow(T3),title('YIQ Toplam Gaus')
subplot(4,4,11),imshow(Orjed4),title('Orjinal Edge Gaus')
subplot(4,4,12),imshow(Tor3),title('YIQ OR Gaus')
subplot(4,4,13),imshow(i2),title('Orjinal Gaussian')
subplot(4,4,14),imshow(Sum2),title('RGB Toplam Gaus')
subplot(4,4,15),imshow(Orjed4),title('Orjinal Edge Gaus')
subplot(4,4,16),imshow(Bor2),title('RGB OR Gaus')