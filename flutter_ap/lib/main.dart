import 'package:flutter/material.dart';
import 'package:flutter_ap/models/Gif.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http; 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp>{
  
Future<List<Git>> _listadoGifs;

Future<List<Git>> _getGifs() async{
  final response =await http.get("https://rickandmortyapi.com/api/character");
 if (response.statusCode == 200){
   print(response.body);

 } else {
   throw Exception("Fallo la conexión");
 } 
}



@override
void initState(){
    //todo: implement initState
    super.initState();

    _getGifs();
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('HOLA'),
          ),
        ),
      ),
    );
  }
} 


