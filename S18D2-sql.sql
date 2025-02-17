-- 1) Biyografi türünü tür tablosuna ekleyiniz.
SELECT * FROM tur;

INSERT INTO tur (ad)
VALUES ('Biyografi');

-- 2) Nurettin Belek isimli yazarı yazar tablosuna ekleyiniz.
SELECT * FROM yazar;

INSERT INTO yazar (ad, soyad)
VALUES ('Nurettin', 'Belek');

-- 3) 10B sınıfındaki öğrencileri 10C sınıfına geçirin.
SELECT * FROM ogrenci;

UPDATE ogrenci
SET sinif = '10C'
WHERE sinif = '10B';

-- 4) Tüm kitapların puanını 5 puan arttırınız.
SELECT * FROM kitap;

UPDATE kitap
SET puan = puan + 5;

-- 5) Adı Mehmet olan tüm yazarları silin.
SELECT * FROM yazar;

DELETE FROM yazar WHERE ad = 'Mehmet';

-- 6) Kişisel Gelişim isimli bir tür oluşturun.
SELECT * FROM tur;

INSERT INTO tur (ad)
VALUES ('Kişisel Gelişim');

-- 7) 'Benim Üniversitelerim' isimli kitabın türünü 'Kişisel Gelişim' yapın.
SELECT * FROM kitap;

UPDATE kitap
SET turno = 7
WHERE ad = 'Benim Üniversitelerim';

-- 8) Öğrenci tablosunu kontrol etmek amaçlı tüm öğrencileri görüntüleyen "ogrencilistesi" adında bir fonksiyon oluşturun.
CREATE OR REPLACE FUNCTION ogrencilistesi()
RETURNS TABLE(ogrno BIGINT, ad VARCHAR, soyad VARCHAR, cinsiyet VARCHAR, sinif VARCHAR, puan INT, dtarih VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT ogrenci.ogrno, ogrenci.ad, ogrenci.soyad, ogrenci.cinsiyet, ogrenci.sinif, ogrenci.puan, ogrenci.dtarih
    FROM public.ogrenci ogrenci;
END;
$$ LANGUAGE plpgsql;


SELECT * FROM ogrencilistesi();


-- 9) kitap tablosuna yeni kitap eklemek için "ekle" adında bir prosedür oluşturun.
CREATE OR REPLACE PROCEDURE ekle(k_ad VARCHAR, k_puan INT, k_yazarno BIGINT, k_turno BIGINT)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO public.kitap (ad, puan, yazarno, turno)
    VALUES (k_ad, k_puan, k_yazarno, k_turno);
END;
$$;


-- 10) Öğrenci noya göre öğrenci silebilmeyi sağlayan "sil" adında bir prosedür oluşturun.
CREATE OR REPLACE PROCEDURE sil(o_ogrno BIGINT)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM public.ogrenci
    WHERE ogrno = o_ogrno;
END;
$$;
