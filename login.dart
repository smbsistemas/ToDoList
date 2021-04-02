import 'package:flutter/material.dart';
import 'package:todolist/todolist.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _user = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(30),
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      child: IconButton(
                          icon: Icon(Icons.undo_outlined),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, "/");
                          })),
                ),
                Container(padding: EdgeInsets.all(10)),
                Container(
                  child: Row(children: <Widget>[
                    Text(
                      'Log in',
                      style: TextStyle(fontSize: 30),
                    ),
                  ]),
                ),
                Container(padding: EdgeInsets.all(10)),
                Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: _user,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //   labelText: 'e-mail',
                    ),
                  ),
                ),
                Container(padding: EdgeInsets.all(10)),
                Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: _password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      // labelText: 'password',
                    ),
                  ),
                ),
                Container(padding: EdgeInsets.all(10)),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.black,
                      child: Text('LOG IN'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TodoList()),
                        );
                      },
                    )),
              ],
            )));
  }

  Future _buildShowErrorDialog(BuildContext context, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text('Mensagem de erro:'),
          content: Text(_message),
          actions: <Widget>[
            FlatButton(
                child: Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
      context: context,
    );
  }

  void _addUser() {
    setState(() {
      Map<String, dynamic> newUser = Map();
      //  _saveData();
    });
  }
}
