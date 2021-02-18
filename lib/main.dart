import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_http/local_json.dart';
import 'package:flutter_json_http/remote_api.dart';

void main() {
  runApp(MyApp());
}

class Ogrenci {
  int id;
  String isim;

  Ogrenci(this.id, this.isim);

  @override
  String toString() {
    // TODO: implement toString
    return"Adı : $isim id: $id";
  }

  factory Ogrenci.mapiNesneyeDonustur(Map<String, dynamic> gelenMap){
    return Ogrenci(gelenMap["id"], gelenMap["isim"]);
  }

  Ogrenci.fromMap(Map<String, dynamic> gelenMap):
      id = gelenMap["id"],
  isim = gelenMap["isim"];

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Ogrenci emine = Ogrenci(2, "emine");
    debugPrint(emine.toString());

    Map<String, dynamic> hasanMap = {"id" : 15, "isim" : "Hasan"};
    debugPrint("Adı : "+hasanMap["isim"]+ "id: " + hasanMap["id"].toString());

    Ogrenci yeni = Ogrenci.mapiNesneyeDonustur(hasanMap);
    debugPrint(yeni.toString());

    Map<String, dynamic> mehmetMap = {"id" : 5, "isim" : "Mehmet"};
    Ogrenci mehmet = Ogrenci.fromMap(mehmetMap);
    debugPrint(mehmet.toString() );

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json ve Api"),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LocalJsonKullanimi()));
            },child: Text("Local Json"), color: Colors.green,),
            RaisedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RemoteApiKullanimi()));
            },child: Text("Remote Api"),color: Colors.pinkAccent,)
          ],
        ),
      ),
    );
  }
}

