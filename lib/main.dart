import 'package:flutter/material.dart';
import 'const.dart'; //const sabitleri..

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.blueGrey[600],
            appBar: AppBar(
              backgroundColor: Colors.blueGrey[700],
              centerTitle: true,
              title: Text(
                'BİLGİ YARIŞMASI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontFamily: 'Anton',
                ),
              ),
            ),
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> cevaplar = [];

  List<SoruKontrol> soruKitapcigi = [
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

  int soruIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        ClipOval(
          child: Image.network(
            'https://e7.pngegg.com/pngimages/753/499/png-clipart-qur-an-computer-icons-islam-islam-logo-religion-thumbnail.png',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                // 'Bilgi Testi',
                soruKitapcigi[soruIndex].soruMetni.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontFamily: 'AnekDevanagari',
                ),
              ),
            ),
          ),
        ),
        Wrap(
          // direction: Axis.vertical,
          alignment: WrapAlignment.center, //baslangıc noktası..
          spacing: 10, //yatay padding
          runSpacing: 5, // dikey ''
          children: cevaplar,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Color(0xffd93025),
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            // bool dogruYanit = yanitlar[soruIndex];
                            setState(() {
                              soruKitapcigi[soruIndex].soruYaniti == false
                                  ? cevaplar.add(kDogruIconu)
                                  : cevaplar.add(kYanlisIconu);
                              soruIndex++;
                              if (soruIndex == 6) {
                                soruIndex = 0;
                              }
                              // cevaplar.add(kYanlisIconu);
                            });
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Color(0xff2dae33),
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            // bool dogruYanit = yanitlar[soruIndex];
                            setState(() {
                              soruKitapcigi[soruIndex].soruYaniti == true
                                  ? cevaplar.add(kDogruIconu)
                                  : cevaplar.add(kYanlisIconu);
                              soruIndex++;
                              if (soruIndex == 6) {
                                soruIndex = 0;
                              }
                              // cevaplar.add(kYanlisIconu);
                            });
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}

class SoruKontrol {
  String soruMetni;
  bool soruYaniti;

  SoruKontrol({required this.soruMetni, required this.soruYaniti});
}
