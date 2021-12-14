import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterjsonparse/filmler.dart';
import 'package:flutterjsonparse/filmlercevap.dart';
import 'package:flutterjsonparse/kisiler.dart';
import 'package:flutterjsonparse/kisilercevap.dart';
import 'package:flutterjsonparse/mesajlar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void mesajParse(){
    String strVeri = '{ "mesajlar" : { "mesaj_kod" : 1,"mesaj_icerik" : "başarılı"  } }';
    var jsonVeri=json.decode(strVeri);
    var jsonNesne=jsonVeri["mesajlar"];
    var mesaj=Mesajlar.fromJson(jsonNesne);
    print("Mesaj Kod : ${mesaj.mesaj_kod}");
    print("Mesaj içerik : ${mesaj.mesaj_icerik}");

  }
  void kisilerParse(){
    String strVeri = '{"kisiler":[{"kisi_id":"1","kisi_ad":"Ahmet","kisi_tel":"12312312"}'
        ',{"kisi_id":"2","kisi_ad":"Mehmet","kisi_tel":"912318212"}]}';
    var jsonVeri=json.decode(strVeri);
    var jsonArray=jsonVeri["kisiler"] as List;
    List<Kisiler> kisilerListesi =jsonArray.map((jsonArrayNesnesi) => Kisiler.fromJson(jsonArrayNesnesi)).toList();
    for(var k in kisilerListesi){
      print("***************");
      print("Kisi id : ${k.kisi_id}");
      print("Kisi ad : ${k.kisi_ad}");
      print("Kisi tel : ${k.kisi_tel}");
    }
  }
  void kisilerCevapParse(){
    String strVeri = '{"success":1,"kisiler":[{"kisi_id":"1","kisi_ad":"Ahmet","kisi_tel":"12312312"},'
        '{"kisi_id":"2","kisi_ad":"Mehmet","kisi_tel":"912318212"}]}';
    var jsonVeri=json.decode(strVeri);
    var kisilerCevap=KisilerCevap.fromJson(jsonVeri);
    print("Success : ${kisilerCevap.success}");
    List<Kisiler> kisilerListesi=kisilerCevap.kisilerListesi;
    for(var k in kisilerListesi){
      print("***************");
      print("Kisi id : ${k.kisi_id}");
      print("Kisi ad : ${k.kisi_ad}");
      print("Kisi tel : ${k.kisi_tel}");
    }
  }
  void filmlerCevapParse(){

  String strVeri = '{"success":1,"filmler":[{"film_id":"1","film_ad":"Interstellar"'
      ',"film_yil":"2015","film_resim":"interstellar.png",'
      '"kategori":{"kategori_id":"4","kategori_ad":"Bilim Kurgu"},'
      '"yonetmen":{"yonetmen_id":"1","yonetmen_ad":"Christopher Nolan"}},'
      '{"film_id":"3","film_ad":"The Pianist","film_yil":"2002","film_resim":"thepianist.png",'
      '"kategori":{"kategori_id":"3","kategori_ad":"Drama"},'
      '"yonetmen":{"yonetmen_id":"4","yonetmen_ad":"Roman Polanski"}}]}';
  var jsonVeri=json.decode(strVeri);
  var filmlerCevap=FilmlerCevap.fromJson(jsonVeri);
  int succces=filmlerCevap.success;
  List<Filmler> filmlerListesi=filmlerCevap.filmlerListesi;
  print("Success: $succces");
  for(var f in filmlerListesi){
    print("***************");
    print("Film id : ${f.film_id}");
    print("Film adı : ${f.film_ad}");
    print("Film yıl : ${f.film_yil}");
    print("Film resim : ${f.film_resim}");
    print("Film Kategori : ${f.kategori.kategori_ad}");
    print("Film yonetmen : ${f.yonetmen.yonetmen_adi}");

  }




}

  @override
  void initState() {
    super.initState();
   // mesajParse();
    // kisilerParse();
   // kisilerCevapParse();
    filmlerCevapParse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


          ],
        ),
      ),

    );
  }
}
