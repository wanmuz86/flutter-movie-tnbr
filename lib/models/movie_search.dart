class MovieSearch {
  final String title;
  final String year;
  final String imdbId;
  final String type;
  final String poster;
// Initializer // Constructor
  MovieSearch({required this.title, required this.year,
    required this.imdbId, required this.type,
  required this.poster});

  // Transform json to Class
  // another initializer... but using different format,
  // hence the keyword factory is added
  factory MovieSearch.fromJson(Map<String, dynamic> json){
    return MovieSearch(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: json["Type"],
        poster: json["Poster"]);
  }
  // Transform json to Array
  static List<MovieSearch> moviesFromJson(dynamic json ){
    var searchResult = json["Search"];
    List<MovieSearch> results = new List.empty(growable: true);
    if (searchResult != null){
      searchResult.forEach((v)=>{
        results.add(MovieSearch.fromJson(v))
      });
      return results;
    }
    return results;
  }
}