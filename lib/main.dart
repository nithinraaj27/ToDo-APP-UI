import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // ignore: deprecated_member_use
  List todos = List();
  String input = "";

  @override
  void initState() {
    todos.add("one");
    todos.add("two");
    todos.add("three");
    todos.add("four");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff82DD72),
      appBar: AppBar(
        backgroundColor: Color(0xff39A327),
        title: Text("ToDo APP",
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            context: context,
            builder: (BuildContext context){
              return AlertDialog(
                title: Text("Add ToDo's"),
                content: TextField(
                  onChanged: (String value){
                    input = value;
                  },
                ),
                actions: [
                  // ignore: deprecated_member_use
                  FlatButton(
                      onPressed: (){
                        setState(() {
                          todos.add(input);
                        });
                        Navigator.of(context).pop();
                      } , child: Text("ADD"))
                ],
              );
            }
          );
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context,int index){
              return Dismissible(
                  key: Key(todos[index]),
                  child: Card(
                    margin: EdgeInsets.all(10),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: ListTile(
                      title: Text(todos[index]),
                    ),
                  ));
            }),
      ),
    );
  }
}

