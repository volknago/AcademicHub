import 'package:flutter/material.dart';
import 'package:hello_world/main.dart';

import 'package:hello_world/pages/listarPeticiones.dart';
import 'package:hello_world/pages/listarUsuarios.dart';

class Power extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Pagina de Sesion'),
      ),
      body: new Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(2.0),
                child: new RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new ListarUsuario(),
                    ));
                  },
                  child: new Icon(
                    Icons.list,
                    color: Colors.blueAccent,
                    size: 40.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(2.0),
                ),
              ),
              new Text('Esta es la lista de Usuarios'),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(2.0),
                child: new RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new ListarPeticiones(),
                    ));
                  },
                  child: new Icon(
                    Icons.list,
                    color: Colors.blueAccent,
                    size: 40.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(2.0),
                ),
              ),
              new Text('Esta es la lista de Peticiones'),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(2.0),
                child: new RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new LoginApp(),
                    ));
                  },
                  child: new Icon(
                    Icons.exit_to_app,
                    color: Colors.blueAccent,
                    size: 40.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(2.0),
                ),
              ),
              new Text('Esta es la salida'),
            ],
          ),
          
        ],
      ),
    );
  }
}
