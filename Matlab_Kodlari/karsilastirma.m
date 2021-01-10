i = imread('C:\Users\ahmet\OneDrive\Masaüstü\BİTİRME PROJESİ\Görüntü işleme\daire.png');
img = rgb2gray(i);

Orjed2 = edge(img,'Prewitt');

%YIQ

YUQim = rgb2ntsc(i);
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

%RGB
Re = edge(i(:,:,1),'Prewitt');
Ge = edge(i(:,:,2),'Prewitt');
Be = edge(i(:,:,3),'Prewitt');
Sum1 = imadd(double(Re),double(Ge));
Sum = imadd(Sum1,double(Be));
%Sum = Re + Ge + Be;
Orjed = edge(img,'Prewitt');
Bor1 = bitor(Re,Ge);
Bor = bitor(Bor1,Be);
Band1 = bitand(Re,Ge);
Band = bitand(Bor1,Be);

figure
subplot(2,4,1),imshow(i),title('Orjinal')
subplot(2,4,2),imshow(T),title('YIQ Toplam')
subplot(2,4,3),imshow(Orjed2),title('Orjinal Edge')
subplot(2,4,4),imshow(Tor),title('YIQ OR')
subplot(2,4,5),imshow(i),title('Orjinal')
subplot(2,4,6),imshow(Sum),title('RGB Toplam')
subplot(2,4,7),imshow(Orjed),title('Orjinal Edge')
subplot(2,4,8),imshow(Bor),title('RGB OR')