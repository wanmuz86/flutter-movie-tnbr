import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_detail.dart';
import 'package:http/http.dart' as http;
class DetailPage extends StatefulWidget {

  final String imdbID;
  DetailPage({required this.imdbID});


  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  // In dart and in some other language... you cannot do this..
  // Null safety means an object cannot be assigned to null value..
  // If you want to assign it to a null value you should add ? (Optional)
   MovieDetail? movie;


// Future (asynchronous because of API Call, That is why the return type is future)
// <What is the data type returrned from this future>..
// Normally best practice, fetchMovies -> Array , fetchMovie->Single
// It will accept omdbID as parameter

/// Replace the url with correct url
  ///
  /// Call the right function from the right class
  ///
  ///  var xxx = getMethod()...; <- normal way of calling function..
  ///  fetchMovie().then(val=>{}) <- this is how we call an async function...

  Future <MovieDetail> fetchMovie(String imdbId) async {
    final response =
    await http.get(Uri.parse('https://www.omdbapi.com/?i=$imdbId&apikey=87d10179'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return MovieDetail.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load movies');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchMovie(widget.imdbID).then((value) => setState(() {
      movie = value;
    }) );
  }

  // Beacuase movie is null safety, I cannot call movie directly..
  // I have to use ! (force unwrap)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Page"),),
      body: movie != null ? SingleChildScrollView(
        child: Column(
          children: [
            Image.network(movie!.poster, height: 300,),
            Text("${movie!.title}"),  
            Text("${movie!.year}"),
            Text("${movie!.plot}"),
            Text("${movie!.actors}"),
            Text("${movie!.director}"),
            Text("${movie!.genre}"),
          ],
        ),
      ) : Center(child: CircularProgressIndicator(),),
    );
  }
}
