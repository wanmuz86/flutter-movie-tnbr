import 'package:flutter/material.dart';
import 'package:movie_app/widgets/home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  var mockDatas = [
  {
  "Title": "The Lord of the Rings: The Fellowship of the Ring",
  "Year": "2001",
  "imdbID": "tt0120737",
  "Type": "movie",
  "Poster": "https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_SX300.jpg"
},
{
"Title": "The Lord of the Rings: The Return of the King",
"Year": "2003",
"imdbID": "tt0167260",
"Type": "movie",
"Poster": "https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg"
},
{
"Title": "The Lord of the Rings: The Two Towers",
"Year": "2002",
"imdbID": "tt0167261",
"Type": "movie",
"Poster": "https://m.media-amazon.com/images/M/MV5BZGMxZTdjZmYtMmE2Ni00ZTdkLWI5NTgtNjlmMjBiNzU2MmI5XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg"
},
{
"Title": "Lord of War",
"Year": "2005",
"imdbID": "tt0399295",
"Type": "movie",
"Poster": "https://m.media-amazon.com/images/M/MV5BMTYzZWE3MDAtZjZkMi00MzhlLTlhZDUtNmI2Zjg3OWVlZWI0XkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_SX300.jpg"
}];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Movie app"),),
        body: Column(
          children: [
            Row(
            children: [
              Expanded(child:
              TextField(
                decoration: InputDecoration(hintText: "Enter movie to search"),
              )
              ),
              TextButton(onPressed: (){}, child: Text("Search"))
            ],
          ),
            Expanded(
              child: ListView.builder(
                  itemCount: mockDatas.length,
                  itemBuilder: (context, index){
                return ListTile(
                  title: Text(mockDatas[index]["Title"]!),
                  subtitle: Text(mockDatas[index]["Year"]!),
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: Image.network(mockDatas[index]["Poster"]!),
                );
              }),
            )
    ]
        ),
      ),
    );
  }
}
