import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Basit Görev Yöneticisi",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Görev Yöneticisi"),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();
  List gorevYoneticisi = [];

  elemanEkle() {
    setState(() {
      gorevYoneticisi.add(t1.text);
      t1.clear();
    });
  }

  elemanCikar() {
    setState(() {
      gorevYoneticisi.remove(t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: gorevYoneticisi.length,
              itemBuilder: (context, siraNumarasi) => ListTile(
                subtitle: Text("Yapılacak Görevler"),
                title: Text(gorevYoneticisi[siraNumarasi]),
              ),
            ),
          ),
          TextField(
            controller: t1,
          ),
          ElevatedButton(
            onPressed: elemanEkle,
            child: Text("Ekle"),
          ),
          ElevatedButton(
            onPressed: elemanCikar,
            child: Text("Çıkar"),
          ),
        ],
      ),
    );
  }
}
