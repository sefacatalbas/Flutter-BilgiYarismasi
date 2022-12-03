import './soru.dart';

class Veri {
  // Soru Index
  int _soruIndex = 0;

  List<SoruKontrol> _soruKitapcigi = [
    //_ priv. yaptı
    SoruKontrol(
        soruMetni: ' İlk Çağ Uygarlıklarından Sümerler yaziyi icat etmiştir.',
        soruYaniti: true),
    SoruKontrol(
        soruMetni: ' Sinekli Bakkal romanının yazarı Halide Edip Adıvardır.',
        soruYaniti: false),
    SoruKontrol(
        soruMetni:
            ' 2003 Yılında Euro Vizyonda ülkemizi Athena temsil etmiştir.',
        soruYaniti: false),
    SoruKontrol(soruMetni: ' Bir gün 86400 saniyedir.', soruYaniti: true),
    SoruKontrol(
        soruMetni: '3 büyük dince kutsal sayılan sehir Kudüstür.',
        soruYaniti: true),
    SoruKontrol(
        soruMetni: ' Cevdet Bey ve Ogulları eseri Atilla Ilhana aittir.',
        soruYaniti: false),
  ];

  // Veri İzni Soru Kitapcıgı
  String getSoruMetni() {
    return _soruKitapcigi[_soruIndex].soruMetni;
  }

  // Veri İzni Soru Yanıtı
  bool getSoruYaniti() {
    return _soruKitapcigi[_soruIndex].soruYaniti;
  }

  // SoruSıra
  void sonrakiSoru() {
    if (_soruIndex + 1 < _soruKitapcigi.length) {
      _soruIndex++;
    }
  }

  // SoruBittimi?Kontrolü
  bool soruBittiMi() {
    if (_soruIndex + 1 >= _soruKitapcigi.length) {
      return true;
    } else {
      return false;
    }
  }

  // TestiSıfırla
  void testSifirlama() {
    _soruIndex = 0;
  }
}
