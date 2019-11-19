import 'package:flutter/material.dart';

class ServicioUsuario extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(title: Text('Pagina Servicios'),),
      body: new Column(
        children: <Widget>[
          new Text('Esta es Otra U'),
          RaisedButton(
            child: Text("Salir"),
            onPressed: (){
            Navigator.pushReplacementNamed(context, '/LoginPage');
            },
          ),
        ],
      ),
      );
  }
}