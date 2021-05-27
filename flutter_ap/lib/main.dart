import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
    runApp(MyApp());
} 
 class MyApp extends StatelessWidget {
  @override
   Widget build(BuildContext context) {
    return MaterialApp(
      home: DataFromAPI(),
    );
  }
}
class DataFromAPI extends StatefulWidget{
  @override
  _DataFromAPIState createState() => _DataFromAPIState();

}
class _DataFromAPIState extends State<DataFromAPI>{
 getUserData() async{
  var response =
   await http.get(Uri.https('rickandmortyapi.com', 'api/character'));
  var jsonData = jsonDecode(response.body);
  List<User> users = [];
  for(var u in jsonData){
    User user = User(u['name'], u['status']);
    users.add(user);
  }
  print(users.length);
  return users;
 }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
      ),
      body: Container(
        child: Card(child: FutureBuilder(
          future: getUserData(),
          builder: (context, snapshot) {
            if(snapshot.data == null){
              return Container(
                child: Center(
                  child: Text('Loading...'),
                  ),
              );
            } else return ListView.builder(
              itemCount: snapshot.data.length,
            itemBuilder: (context, i){
              return ListTile(
                title: Text(snapshot.data[i].name),
              );
            });
          },
        ),),
      ),
    );
  }
}

class User {
  final String name, status;
  User(this.name, this.status);
}