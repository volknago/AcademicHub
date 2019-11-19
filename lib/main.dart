import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hello_world/pages/Registro.dart';
import 'package:hello_world/pages/ServicioUsuario.dart';
import 'package:hello_world/pages/listarPeticiones.dart';
import 'package:hello_world/pages/listarUsuarios.dart';
import 'package:hello_world/pages/powerPage.dart';
import 'package:http/http.dart' as http;

void main() => runApp(LoginApp());

String username;

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter + Mysql',
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/powerPage': (BuildContext context) => new Power(),
        '/pages/registro': (BuildContext context) => new Registro(),
        '/servicioUsuario': (BuildContext context) => new ServicioUsuario(),
        '/LoginPage': (BuildContext context) => LoginPage(),
        '/pages/listarUsuario': (BuildContext context) => ListarUsuario(),
        '/pages/listarPeticiones': (BuildContext context) => ListarPeticiones(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();

  String mensaje = '';

  Future<List> login() async {
    final response =
        await http.post("http://192.168.1.9/usuario/login.php", body: {
      "usuario": controllerUser.text,
      "contrasena": controllerPass.text,
    });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        mensaje = "Usuario o contraseña incorrectas";
      });
    } else {
      if (datauser[0]['universidad'] == 'unibague') {
        Navigator.pushReplacementNamed(context, '/powerPage');
      } else if (datauser[0]['universidad'] == 'unmg') {
        Navigator.pushReplacementNamed(context, '/servicioUsuario');
      }
      setState(() {
        username = datauser[0]['username'];
      });
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
        child: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("assets/images/Fondo.jpg"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(top: 67.0),
                child: new CircleAvatar(
                  backgroundColor: Color(0xF81F7F3),
                  child: new Image(
                    width: 155,
                    height: 155,
                    image: new AssetImage('assets/images/Avatar.png'),
                  ),
                ),
                width: 170.0,
                height: 170.0,
                decoration: BoxDecoration(shape: BoxShape.circle),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 13),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextFormField(
                        controller: controllerUser,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            hintText: 'Codigo'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      margin: EdgeInsets.only(top: 15),
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextField(
                        controller: controllerPass,
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.vpn_key,
                              color: Colors.black,
                            ),
                            hintText: 'Contraseña'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 6,
                          right: 32,
                        ),
                        child: Text(
                          'Recordar Contraseña',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    new RaisedButton(
                      child: new Text("Ingresar"),
                      color: Colors.orangeAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0)),
                      onPressed: () {
                        login();
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      mensaje,
                      style: TextStyle(fontSize: 25.0, color: Colors.red),
                    ),
                    new RaisedButton(
                      child: new Text("Registrar"),
                      color: Colors.orangeAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0)),
                      onPressed: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Registro(),
                        ));
                      },
                    ),
                    Text(
                      mensaje,
                      style: TextStyle(fontSize: 25.0, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
