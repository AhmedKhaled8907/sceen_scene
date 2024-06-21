class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "61854a9ecbed259f4938884b530d31a9";

  // Movies Api Constants
  static const String nowPlayingMoviesBaseUrl =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviesBaseUrl =
      "$baseUrl/trending/movie/week?api_key=$apiKey";
  static const String topRatedMoviesBaseUrl =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  static String movieDetailsBaseUrl(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";

  static String similarMoviesBaseUrl(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  // Tvs Api Constants
  static const String onTheAirTvsBaseUrl =
      "$baseUrl/tv/on_the_air?api_key=$apiKey";
  static const String popularTvBaseUrl =
      "$baseUrl/trending/tv/week?api_key=$apiKey";
  static const String topRatedTvBaseUrl =
      "$baseUrl/tv/top_rated?api_key=$apiKey";
  static String tvDetailsBaseUrl(int tvId) =>
      "$baseUrl/tv/$tvId?api_key=$apiKey";
  static String similarTvsBaseUrl(int movieId) =>
      "$baseUrl/tv/$movieId/recommendations?api_key=$apiKey";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => "$baseImageUrl$path";

  static const String listName = "results";
}
