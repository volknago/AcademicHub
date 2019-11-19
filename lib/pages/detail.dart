import 'package:flutter/material.dart';
import 'package:hello_world/pages/editdata.dart';
import 'package:hello_world/pages/listarUsuarios.dart';
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index, this.list});
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void deteleData() {
    var url = "http://192.168.1.9/usuario/deleteData.php";
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void peticionData() {
    var url = "http://192.168.1.9/usuario/peticionedit.php";
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void peticionData2() {
    var url = "http://192.168.1.9/usuario/peticionedit2.php";
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirmar() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Seguro que desea Eliminar '${widget.list[widget.index]['usuario']}'"),
      actions: <Widget>[
        new RaisedButton(
            child: new Text(
              "Eliminar!",
              style: new TextStyle(color: Colors.black),
            ),
            color: Colors.yellowAccent,
            onPressed: () {
              deteleData();
              Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (BuildContext contex) => new ListarUsuario(),
                ),
              );
            }),
        new RaisedButton(
          child: new Text(
            "Cancelar",
            style: new TextStyle(color: Colors.black),
          ),
          color: Colors.blueAccent,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
    showDialog(context: context, child: alertDialog);
  }

  void confirmarPeticion() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Seguro que desea Realizar Peticion '${widget.list[widget.index]['usuario']}'"),
      actions: <Widget>[
        new RaisedButton(
            child: new Text(
              "Si!",
              style: new TextStyle(color: Colors.black),
            ),
            color: Colors.yellowAccent,
            onPressed: () {
              //Agregar Metodo de peticion
              peticionData();
              Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (BuildContext contex) => new ListarUsuario(),
                ),
              );
            }),
        new RaisedButton(
            child: new Text(
              "No!",
              style: new TextStyle(color: Colors.black),
            ),
            color: Colors.yellowAccent,
            onPressed: () {
              //Agregar Metodo de peticion
              peticionData2();
              Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (BuildContext contex) => new ListarUsuario(),
                ),
              );
            }),
        new RaisedButton(
          child: new Text(
            "Salir",
            style: new TextStyle(color: Colors.black),
          ),
          color: Colors.blueAccent,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: new Text("${widget.list[widget.index]['usuario']}")),
      body: new Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  widget.list[widget.index]['usuario'],
                  style: new TextStyle(fontSize: 20.0),
                ),
                Divider(),
                new Text(
                  "Materia : ${widget.list[widget.index]['materia']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("Editar"),
                      color: Colors.blueAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0)),
                      onPressed: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new EditData(
                            list: widget.list, index: widget.index),
                      )),
                    ),
                    VerticalDivider(),
                    new RaisedButton(
                      child: new Text("Eliminar"),
                      color: Colors.blueAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0)),
                      onPressed: () => confirmar(),
                    ),
                    VerticalDivider(),
                    new RaisedButton(
                      child: new Text("Peticion"),
                      color: Colors.blueAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0)),
                      //Cambiar boton
                      onPressed: () => confirmarPeticion(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
