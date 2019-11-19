import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Registro extends StatefulWidget {
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<Registro> {
  TextEditingController controllerCodigo = new TextEditingController();
  TextEditingController controllerUsuario = new TextEditingController();
  TextEditingController controllerContrasena = new TextEditingController();
  TextEditingController controllerAsesor = new TextEditingController();
  TextEditingController controllerUniversidad = new TextEditingController();
  TextEditingController controllerMateria = new TextEditingController();

  var _formkey = GlobalKey<FormState>();

  void registro() {
    var url = "http://192.168.1.9/usuario/adddata.php";
    http.post(url, body: {
      "codigo": controllerCodigo.text.trim(),
      "usuario": controllerUsuario.text.trim(),
      "contrasena": controllerContrasena.text.trim(),
      "asesor": controllerAsesor.text.trim(),
      "universidad": controllerUniversidad.text.trim(),
      "materia": controllerMateria.text.trim(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text("Registrarse"),
        ),
        body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: ListView(
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new ListTile(
                        leading: const Icon(Icons.email, color: Colors.black),
                        title: new TextFormField(
                          controller: controllerCodigo,
                          decoration: new InputDecoration(
                            hintText: "codigo",
                            labelText: "Codigo",
                          ),
                        )),
                    new ListTile(
                      leading:
                          const Icon(Icons.person_pin, color: Colors.black),
                      title: new TextFormField(
                        controller: controllerUsuario,
                        decoration: new InputDecoration(
                          hintText: "usuario",
                          labelText: "Usuario",
                        ),
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(Icons.vpn_key, color: Colors.black),
                      title: new TextFormField(
                        controller: controllerContrasena,
                        decoration: new InputDecoration(
                          hintText: "contrasena",
                          labelText: "Contraseña",
                        ),
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(Icons.people, color: Colors.black),
                      title: new TextFormField(
                        controller: controllerAsesor,
                        decoration: new InputDecoration(
                          hintText: "asesor",
                          labelText: "Asesor:Si/No",
                        ),
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(Icons.bookmark, color: Colors.black),
                      title: new TextFormField(
                        controller: controllerUniversidad,
                        decoration: new InputDecoration(
                          hintText: "universidad",
                          labelText: "Universidad",
                        ),
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(Icons.book, color: Colors.black),
                      title: new TextFormField(
                        controller: controllerMateria,
                        decoration: new InputDecoration(
                          hintText: "materia",
                          labelText: "Materia",
                        ),
                      ),
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
                        if (_formkey.currentState.validate()) {
                          registro();
                          Navigator.pop(context);
                        }
                      },
                    ),
                    new RaisedButton(
                      child: new Text("Salir"),
                      color: Colors.orangeAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {
                        registro();
                        Navigator.pop(context);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
