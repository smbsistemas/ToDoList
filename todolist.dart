import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoList createState() => _TodoList();
}

class _TodoList extends State<TodoList> {
  final _toDoController = TextEditingController();
  List _toDoList = [];
  List _toDoListDone = [];

  void _addToDo(String pTitle, int pindex) {
    setState(() {
      Map<String, dynamic> newToDo = Map();
      if (pindex != 99) {
        _toDoListDone.removeAt(pindex);
        newToDo['title'] = pTitle;
      } else {
        newToDo['title'] = _toDoController.text;
        _toDoController.text = "";
      }

      newToDo["ok"] = false;
      _toDoList.add(newToDo);
    });
  }

  void _addToDoDone(String pToDoDone, int pindex) {
    setState(() {
      Map<String, dynamic> newToDoDone = Map();
      newToDoDone['title'] = pToDoDone;
      newToDoDone["ok"] = true;
      _toDoListDone.add(newToDoDone);
      _toDoList.removeAt(pindex);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(padding: EdgeInsets.all(30)),
        Container(
          padding: EdgeInsets.all(10),
          child: Row(children: <Widget>[
            Text(
              'To-do list',
              style: TextStyle(fontSize: 40),
            ),
          ]),
        ),
        Container(padding: EdgeInsets.all(5)),
        Container(
            padding: EdgeInsets.all(15),
            child: Row(children: <Widget>[
              Text(
                'ADD NEW TASK',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ])),
        Container(
          padding: EdgeInsets.all(5),
          child: TextField(
            controller: _toDoController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 20.0, color: Colors.black),
              ),
              labelText: 'My awesome task',
            ),
          ),
        ),
        Container(
            child: RaisedButton(
          child: Text('+', style: TextStyle(fontSize: 40, color: Colors.black)),
          onPressed: () {
            _addToDo('', 99);
          },
        )),
        Container(
            padding: EdgeInsets.all(15),
            child: Row(children: <Widget>[
              Text(
                'TASK',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ])),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 0.0),
            itemCount: _toDoList.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                title: Text(_toDoList[index]["title"]),
                value: _toDoList[index]["ok"],
                onChanged: (c) {
                  setState(() {
                    _toDoList[index]["ok"] = c;
                    _addToDoDone(_toDoList[index]["title"], index);
                  });
                },
              );
            },
          ),
        ),
        Container(
            padding: EdgeInsets.all(5),
            child: Row(children: <Widget>[
              Text(
                'DONE',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ])),
        Expanded(
            child: ListView.builder(
          padding: EdgeInsets.only(top: 10.0),
          itemCount: _toDoListDone.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              title: Text(_toDoListDone[index]["title"]),
              value: _toDoListDone[index]["ok"],
              onChanged: (c) {
                setState(() {
                  _toDoListDone[index]["ok"] = c;
                  _addToDo(_toDoListDone[index]["title"], index);
                });
              },
            );
          },
        ))
      ],
    ));
  }
}
