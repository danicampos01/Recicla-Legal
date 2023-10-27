import 'package:financial/home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green.shade300,
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://d3ugyf2ht6aenh.cloudfront.net/stores/001/351/163/products/c02611-1164cea49b5e1f446616123897864287-640-0.png",
                          ))),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                const TextField(
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "Login",
                      labelStyle: TextStyle(color: Colors.black),
                    )),
                const TextField(
                    autofocus: true,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.black),
                    )),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: ButtonTheme(
                    height: 60.0,
                    child: RaisedButton(
                      onPressed: () => {
                        print("pressionei o botão"),
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const HomePage()),
                        ),
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: const Text(
                        "Entrar",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ), //Text
                      color: Colors.lightGreen.shade200,
                    ), //RaisedButton
                  ),
                ), //ButtonTheme
              ],
            ),
          ),
        ));
  }
}
