import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_json_http/models/gonderi.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class RemoteApiKullanimi extends StatefulWidget {
  @override
  _RemoteApiKullanimiState createState() => _RemoteApiKullanimiState();
}

class _RemoteApiKullanimiState extends State<RemoteApiKullanimi> {


  Future<List<Gonderi>> _gonderiGetir() async {
    var response =
        await http.get("https://jsonplaceholder.typicode.com/posts");
    if (response.statusCode == 200) {
      //return Gonderi.fromJson(json.decode(response.body));
      return (json.decode(response.body) as List).map((tekGonderiMAp) => Gonderi.fromJson(tekGonderiMAp)).toList();
    } else {
      throw Exception("Bağlanamadı ${response.statusCode}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   /* _gonderiGetir().then((okunanGonderi) {
      gonderi = okunanGonderi;
      debugPrint("gelen değer: " + gonderi.title);
    }); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remote Api Kullanımı "),
      ),
      body: FutureBuilder(builder: (BuildContext context, AsyncSnapshot<List<Gonderi>> snapshot ){

        if(snapshot.hasData){
          return ListView.builder(itemBuilder: (context, index){

            return ListTile(
              title: Text(snapshot.data[index].title),
              subtitle: Text(snapshot.data[index].body),
              leading: CircleAvatar(child: Text(snapshot.data[index].id.toString()),),
            );

          }, itemCount: snapshot.data.length,);
        }else {
          return Center(child: CircularProgressIndicator(),);

        }
      }, future: _gonderiGetir(),),
    );
  }
}
