import 'package:flutter/material.dart';
import 'package:hello_world/pages/PowerPage.dart';
import 'package:hello_world/pages/listarUsuarios.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'detail.dart';

class ListarPeticiones extends StatefulWidget {
  _ListarPeticioneState createState() => _ListarPeticioneState();
}

class _ListarPeticioneState extends State<ListarPeticiones> {
  Future<List> getData() async {
    final response = await http.get("http://192.168.1.9/usuario/getdataPeticion.php");
    return json.decode(response.body);
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Listado de Peticiones"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Power(),
              ));
            },
          )
        ],
      ),floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new ListarUsuario(),
          ));
        },
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new Lista(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class Lista extends StatelessWidget {
  final List list;
  Lista({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Container(
            padding: const EdgeInsets.all(10.0),
            child: new GestureDetector(
              onTap: () => Navigator.of(context).push(
                new MaterialPageRoute(
                  //cambiar aqui
                  builder: (BuildContext context) => new Detail(
                    list: list,
                    index: i,
                  ),
                ),
              ),
              child: new Card(
                child: new ListTile(
                  title: new Text(
                    list[i]['usuario'],
                    style:
                        TextStyle(fontSize: 25.0, color: Colors.orangeAccent),
                  ),
                  leading: new Icon(
                    Icons.person_pin,
                    size: 77.0,
                    color: Colors.orangeAccent,
                  ),
                  subtitle: new Text(
                    "Materia: ${list[i]['materia']}",
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
