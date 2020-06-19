import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "BEM KM PNP",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> daftarorang = new List();

  var presidium = [
    {
      "nama": "Putra Ramadhan",
      "gambar": "rama.jpeg",
      "jabatan": "Presiden Mahasiswa",
      "jurusan": "Teknik Mesin"
    },
    {
      "nama": "Andre Okvironi",
      "gambar": "andre.jpeg",
      "jabatan": "Wakil Presiden Mahasiswa",
      "jurusan": "Teknik Elektro"
    },
    {
      "nama": "Fanani",
      "gambar": "fanani.jpeg",
      "jabatan": "Sekretaris Negara",
      "jurusan": "Teknik Mesin"
    },
    {
      "nama": "Febri Zummiati",
      "gambar": "febri.jpeg",
      "jabatan": "Kepala Audit Internal",
      "jurusan": "Teknologi Informasi"
    },
    {
      "nama": "Nur Atikah",
      "gambar": "nur.jpeg",
      "jabatan": "Kepala Kestari",
      "jurusan": "Akuntansi"
    },
    {
      "nama": "Dungga Caniago",
      "gambar": "dungga.jpeg",
      "jabatan": "Menteri PSDM",
      "jurusan": "Teknik Mesin"
    },
    {
      "nama": "Evan Mahdy",
      "gambar": "evan.jpeg",
      "jabatan": "Menteri Dalam Negeri",
      "jurusan": "Teknik Elektro"
    },
    {
      "nama": "Sahrul Efendi",
      "gambar": "sahrul.jpeg",
      "jabatan": "Menteri Luar Negeri",
      "jurusan": "Teknologi Informasi"
    },
    {
      "nama": "Afit Arifin",
      "gambar": "afit.jpeg",
      "jabatan": "Menteri Sospol",
      "jurusan": "Teknik Elektro"
    },
    {
      "nama": "Akbar Madi",
      "gambar": "akbar.jpeg",
      "jabatan": "Menteri Kesmma",
      "jurusan": "Teknik Sipil"
    },
    {
      "nama": "Gita Novia A.",
      "gambar": "gita.jpeg",
      "jabatan": "Menteri Keuangan",
      "jurusan": "Akuntansi"
    },
    {
      "nama": "Yulianti",
      "gambar": "yuli.jpeg",
      "jabatan": "Menteri Komrisbang",
      "jurusan": "Teknologi Informasi"
    },
    {
      "nama": "Oktaviani",
      "gambar": "opi.jpeg",
      "jabatan": "Menteri Perempuan",
      "jurusan": "Akuntansi"
    }
  ];

  _buatList() async {
    for (var i = 0; i < presidium.length; i++) {
      final presidiumnya = presidium[i];
      final String gambar = presidiumnya["gambar"];

      daftarorang.add(new Container(
          padding: new EdgeInsets.all(5.0),
          child: new Card(
            child: new Column(
              children: <Widget>[
                new Hero(
                    tag: presidiumnya["nama"],
                    child: new Material(
                      child: new InkWell(
                        onTap: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Detail(
                              nama: presidiumnya['nama'],
                              gambar: gambar,
                              jabatan: presidiumnya['jabatan'],
                              jurusan: presidiumnya['jurusan']),
                        )),
                        child: new Image.asset(
                          "assets/$gambar",
                          fit: BoxFit.cover,
                          height: 120,
                          width: 120,
                        ),
                      ),
                    )),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new Text(
                  presidiumnya["nama"],
                  style: new TextStyle(fontSize: 15.0),
                )
              ],
            ),
          )));
    }
  }

  @override
  void initState() {
    _buatList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "BEM KM PNP",
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarorang,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  Detail({this.nama, this.gambar, this.jabatan, this.jurusan});

  final String nama;
  final String gambar;
  final String jabatan;
  final String jurusan;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Halaman Detail'),
        ),
        body: Center(
      child: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            new Container(
                height: 240.0,
                child: new Hero(
                    tag: nama,
                    child: new Material(
                      child: new InkWell(
                        child: new Image.asset(
                          "assets/$gambar",
                        ),
                      ),
                    ))),
            SizedBox(height: 30),
            new Text(
              nama,
              style: new TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlue,
              ),
            ),
            SizedBox(height: 10),
            new Text(
              jabatan,
              style: new TextStyle(fontSize: 20.0, color: Colors.black),
            ),
            SizedBox(height: 10),
            new Text(
              jurusan,
              style: new TextStyle(fontSize: 20.0, color: Colors.black),
            ),
          ],
        ),
      ),
    ));
  }
}
