import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("JSON APP"),
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: ()=> debugPrint("Search")
          ),
          new IconButton(
              icon: new Icon(Icons.add),
              onPressed: ()=>debugPrint("Add")
          )
        ],
      ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[

            new UserAccountsDrawerHeader(
                accountName: new Text("Dhiraj Jain"),
                accountEmail: new Text("dhirajj75@gmail.com"),

              decoration: new BoxDecoration(
                color: Colors.deepOrange
              ),
            ),

            new ListTile(
              title: new Text("First Page"),
              leading: new Icon(Icons.search, color: Colors.orange,),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),

            new ListTile(
              title: new Text("Second Page"),
              leading: new Icon(Icons.add, color: Colors.red,),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),

            new ListTile(
              title: new Text("Third Page"),
              leading: new Icon(Icons.title, color: Colors.purple,),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),

            new ListTile(
              title: new Text("Fourth Page"),
              leading: new Icon(Icons.list, color: Colors.green,),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),

            new Divider(
              height: 5.0,
            ),

            new ListTile(
              title: new Text("Close"),
              leading: new Icon(Icons.close, color: Colors.deepOrange),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
