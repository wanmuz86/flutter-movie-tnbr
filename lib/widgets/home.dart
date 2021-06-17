import 'package:flutter/material.dart';
import 'package:movie_app/widgets/detail.dart';
import 'package:movie_app/models/movie_search.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<MovieSearch> mockDatas = [
    ];
  var searchEditingController = TextEditingController();


  Future <List<MovieSearch>> fetchMovies(String searchText) async {
    final response =
    await http.get(Uri.parse('https://www.omdbapi.com/?s=$searchText&apikey=87d10179'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return MovieSearch.moviesFromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load movies');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie app"),),
      body: Column(
          children: [
            Row(
              children: [
                Expanded(child:
                TextField(
                  controller: searchEditingController,
                  decoration: InputDecoration(hintText: "Enter movie to search"),
                )
                ),
                TextButton(onPressed: (){
                  fetchMovies(searchEditingController.text).then((value) =>
                      setState(() {
                        mockDatas = value;
                      })
                  );

                }, child: Text("Search"))
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: mockDatas.length,
                  itemBuilder: (context, index){
                    return ListTile(
                        title: Text(mockDatas[index].title),
                        subtitle: Text(mockDatas[index].year),
                        trailing: Icon(Icons.arrow_forward_ios),
                        leading: Image.network(mockDatas[index].poster),
                        onTap:(){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=>DetailPage(imdbID: mockDatas[index].imdbId,))
                          );
                        }
                    );
                  }),
            )
          ]
      ),
    );

  }

}
