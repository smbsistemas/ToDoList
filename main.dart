import 'package:flutter/material.dart';
import 'package:todolist/login.dart';
import 'package:todolist/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo list',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Todo´s'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: _image(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _content(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _line(),
          ),
        ],
      ),
    );
  }

  Widget _image() {
    return Container(
        child: Stack(children: <Widget>[
      Image.asset(
        'images/todos.jpg',
        fit: BoxFit.contain,
        height: 700,
      ),
    ]));
  }

  Widget _line() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 5.0,
        width: 130.0,
        color: Colors.black,
      ),
    );
  }

  Widget _content() {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.zero,
          topRight: Radius.zero,
        ),
      ),
      child: Row(children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 20),
        ),
        Container(
            child: ButtonTheme(
          minWidth: 150.0,
          height: 52.0,
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text("LOG IN",
                style: TextStyle(color: Colors.black, fontSize: 16)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.black)),
            color: Colors.white,
          ),
        )),
        Container(
          padding: const EdgeInsets.only(left: 10),
        ),
        Container(
            child: ButtonTheme(
          minWidth: 150.0,
          height: 52.0,
          child: RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPage()));
            },
            child: Text("REGISTER",
                style: TextStyle(color: Colors.white, fontSize: 16)),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Colors.black,
          ),
        )),
      ]),
    );
  }
}
