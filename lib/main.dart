import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'const.dart'; //const sabitleri..
import './veri.dart'; //soru--

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

  // veri class
  Veri test_1 = Veri(); //SoruKitapcıgı

  // ButonFonk
  void butonFonk(bool secilenButon) {
    if (test_1.soruBittiMi() == true) {
      showDialog(
        // alertdialog gosterimi
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(
              "Yarışma Bitti",
              textAlign: TextAlign.center,
            ),
            // content: new Text("Alert Dialog body"),
            actions: <Widget>[
              new FlatButton(
                child: Icon(
                  Icons.refresh,
                  color: Color(0xffff3705),
                  size: 30.0,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      setState(() {
        test_1.testSifirlama(); // indexi başa al
        cevaplar = []; // dogru-yanlıs sıfırla
      });
    } else {
      setState(() {
        test_1.getSoruYaniti() == secilenButon
            ? cevaplar.add(kDogruIconu)
            : cevaplar.add(kYanlisIconu);

        test_1.sonrakiSoru();
      });
    }
  }

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
                // test_1.soruKitapcigi[soruIndex].soruMetni.toString(),
                test_1.getSoruMetni(),
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
                            // test_1.soruKitapcigi[soruIndex].soruYaniti = false;
                            butonFonk(false);
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
                            // test_1.soruKitapcigi[soruIndex].soruYaniti =
                            butonFonk(true);
                            // soruIndex++;
                            // if (soruIndex == 6) {
                            //  soruIndex = 0;
                            // }
                            // cevaplar.add(kYanlisIconu);
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}
