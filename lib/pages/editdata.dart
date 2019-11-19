import 'package:flutter/material.dart';
import 'package:hello_world/pages/listarUsuarios.dart';
import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  final List list;
  final int index;
  EditData({this.list, this.index});

  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerCodigo;
  TextEditingController controllerUsuario;
  TextEditingController controllerContrasena;
  TextEditingController controllerAsesor;
  TextEditingController controllerUniversidad;
  TextEditingController controllerMateria;

  void editData() {
    var url = "http://192.168.1.9/usuario/editdata.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "codigo": controllerCodigo.text.trim(),
      "usuario": controllerUsuario.text.trim(),
      "contrasena": controllerContrasena.text.trim(),
      "asesor": controllerAsesor.text.trim(),
      "universidad": controllerUniversidad.text.trim(),
      "materia": controllerMateria.text.trim(),
    });
  }

  @override
  void initState() {
    controllerCodigo =
        new TextEditingController(text: widget.list[widget.index]['codigo']);
    controllerUsuario =
        new TextEditingController(text: widget.list[widget.index]['usuario']);
    controllerContrasena = new TextEditingController(
        text: widget.list[widget.index]['contrasena']);
    controllerAsesor =
        new TextEditingController(text: widget.list[widget.index]['asesor']);
    controllerUniversidad = new TextEditingController(
        text: widget.list[widget.index]['universidad']);
    controllerMateria =
        new TextEditingController(text: widget.list[widget.index]['materia']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text("Editar"),
        ),
        body: Form(
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: new TextFormField(
                        controller: controllerCodigo,
                        decoration: new InputDecoration(
                            hintText: "codigo", labelText: "Codigo")),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: new TextFormField(
                        controller: controllerUsuario,
                        decoration: new InputDecoration(
                            hintText: "usuario", labelText: "Usuario")),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.vpn_key, color: Colors.black),
                    title: new TextFormField(
                        controller: controllerContrasena,
                        decoration: new InputDecoration(
                            hintText: "contrasena", labelText: "Contraseña")),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.people, color: Colors.black),
                    title: new TextFormField(
                        controller: controllerAsesor,
                        decoration: new InputDecoration(
                            hintText: "asesor", labelText: "Asesor")),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.bookmark, color: Colors.black),
                    title: new TextFormField(
                        controller: controllerUniversidad,
                        decoration: new InputDecoration(
                            hintText: "universidad", labelText: "Universidad")),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.book, color: Colors.black),
                    title: new TextFormField(
                        controller: controllerMateria,
                        decoration: new InputDecoration(
                            hintText: "materia", labelText: "Materia")),
                  ),
                  const Divider(
                    height: 1.0,
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  new RaisedButton(
                    child: new Text("Guardar"),
                    color: Colors.orangeAccent,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      editData();
                      Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext contex) => new ListarUsuario(),
                      ));
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
