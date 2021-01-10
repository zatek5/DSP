%Resmin matlab ortamına alınması
i = imread('C:\Users\ahmet\OneDrive\Masaüstü\BİTİRME PROJESİ\Görüntü işleme\daire.png');
s=i;

%Orjinal resim üzerinde edge işlemi (Gri seviye)
img = rgb2gray(i);
Orjed = edge(img,'Prewitt');

%RGB renk kanallarına ayırarak kenar bulma işlemi
Re = edge(i(:,:,1),'Prewitt'); 
Ge = edge(i(:,:,2),'Prewitt');
Be = edge(i(:,:,3),'Prewitt');

%Her bir renk kanalından gelen kenarları ekleyerek birleştirme
Sum1 = imadd(double(Re),double(Ge));
Sum = imadd(Sum1,double(Be));

%Her bir renk kanalından gelen kenarları mantıksal OR işlemiyle birleştirme
Bor1 = bitor(Re,Ge);
Bor = bitor(Bor1,Be);

%Ekleyerek birleştirme ve OR işlemi arasında ki farkları bulma işlemi
Xor1 = bitxor(Bor,Sum);
Sumxor = Sum;


for i=1:391
    for j=1:518
        if Sumxor(i,j)==2 || Sumxor(i,j)==3
            Sumxor(i,j)=1;
        end
    end
end

Xor = bitxor(Bor,Sumxor);

i=s;
%Sonuçlar
figure
subplot(3,4,1),imshow(i),title('Orjinal')
i=s;
i(:,:,2) = 0;
i(:,:,3) = 0;
subplot(3,4,2),imshow(i),title('R')
i =s;
i(:,:,1) = 0;
i(:,:,3) = 0;
subplot(3,4,3),imshow(i),title('G')
i =s;
i(:,:,1) = 0;
i(:,:,2) = 0;
subplot(3,4,4),imshow(i),title('B')
i =s;
subplot(3,4,5),imshow(Orjed),title('Orjinal Edge')
subplot(3,4,6),imshow(Re),title('R edge')
subplot(3,4,7),imshow(Ge),title('G edge')
subplot(3,4,8),imshow(Be),title('B edge')
subplot(3,4,9),imshow(Sum),title('Toplam')
subplot(3,4,10),imshow(Bor),title('OR')
%subplot(3,4,11),imshow(Xor1),title('Ekleme ve Or Farkı')
subplot(3,4,11),imshow(Xor),title('Toplam ve Or Farkı')



