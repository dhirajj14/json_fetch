import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'model/Data.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  Future<List<Data>> getAllData() async{

    var api="https://jsonplaceholder.typicode.com/photos";
    var data=await http.get(api);

    var jsonData = json.decode(data.body);

    List<Data>listof=[];

    for(var i in jsonData){

      Data data = new Data(i["id"], i["title"], i["url"], i["thumbnailUrl"]);
      listof.add(data);

    }

    return listof;

  }


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

      body: new ListView(
        children: <Widget>[

          new Container(
            margin: EdgeInsets.all(10.0),
            height: 250.0,
            child: new FutureBuilder(
                future: getAllData(),
                builder: (BuildContext c, AsyncSnapshot snapshot){
                  if(snapshot.data == null){
                    return Center(
                      child: new Text("Loading Data"),
                    );
                  }else{
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext c, int index){
                        return Card(
                          elevation: 10.0,
                          child: new Column(
                            children: <Widget>[

                              new Image.network(snapshot.data[index].url,

                                height: 150.0,
                                width: 150.0,
                                fit: BoxFit.cover,
                              ),

                            ],
                          ),
                        );
                      },
                    );
                  }
              }
              ),
            ),
        ],
      ),
    );
  }
}
