%Resmin matlab ortamına alınması
i = imread('C:\Users\ahmet\OneDrive\Masaüstü\BİTİRME PROJESİ\Görüntü işleme\daire.png');

%Orjinal resim üzerinde edge işlemi (Gri seviye)
img = rgb2gray(i);
Orjed1 = edge(img,'Prewitt');

%RGB den YIQ renk uzayına dönüştürme
YUQim = rgb2ntsc(i); 

%YIQ renk kanallarına ayırma işlemi
Y= YUQim(:,:,1);
I= YUQim(:,:,2);
Q= YUQim(:,:,3);

%Her renk kanalında kenar bulma işlemi
Ye = edge(Y,'Prewitt');
Ie = edge(I,'Prewitt');
Qe = edge(Q,'Prewitt');

%Her bir renk kanalından gelen kenarları ekleyerek birleştirme
T1 = imadd(double(Ye),double(Ie));
T = imadd(T1,double(Qe));

%Her bir renk kanalından gelen kenarları mantıksal OR işlemiyle birleştirme
Tor1 = bitor(Ye,Ie);
Tor = bitor(Tor1,Qe);

%CAT fonksiyonu ile 3 boyutlu hale getirme
S1 = cat(3,Ye,Ie,Qe);
S = ntsc2rgb(double(S1)); %RGB den YIQ renk uzayına dönüştürme

%Sonuçlar
figure
subplot(3,4,1),imshow(i),title('Orjinal')
subplot(3,4,2),imagesc(Y),title('Y')
subplot(3,4,3),imagesc(I),title('I')
subplot(3,4,4),imagesc(Q),title('Q')
subplot(3,4,5),imshow(Ye),title('Y edge')
subplot(3,4,6),imshow(Ie),title('I edge')
subplot(3,4,7),imshow(Qe),title('Q edge')
subplot(3,4,8),imshow(T),title('Toplam')
subplot(3,4,9),imshow(Orjed1),title('Orjinal Edge')
subplot(3,4,10),imshow(Tor),title('OR')
subplot(3,4,11),imshow(S),title('CAT')
