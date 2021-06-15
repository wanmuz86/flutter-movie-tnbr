class MovieSearch {
  final String title;
  final String year;
  final String imdbId;
  final String type;
  final String poster;
// Initializer
  MovieSearch({required this.title, required this.year,
    required this.imdbId, required this.type,
  required this.poster});

  // Transform json to Class
  factory MovieSearch.fromJson(Map<String, dynamic> json){
    return MovieSearch(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: json["Type"],
        poster: json["Poster"]);
  }
  // Transform json to Array
  List<MovieSearch> moviesFromJson(dynamic json ){
    var searchResult = json["Search"];
    List<MovieSearch> results = new List.empty();
    if (searchResult != null){
      searchResult.forEach((v)=>{
        results.add(MovieSearch.fromJson(v))
      });
      return results;
    }
    return results;
  }
}