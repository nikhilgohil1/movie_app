import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/api/constants.dart';
import 'package:movie_app/models/movie_model.dart';

class Api {
  final upcomingApiUrl = upcomingApiUrlWithKey;
  final popularApiUrl = popularApiUrlWithKey;
  final topRatedApiUrl = topRatedApiUrlWithKey;

  Future<List<Movie>> getUpcomingMovies() async{
    final response = await http.get(Uri.parse(upcomingApiUrl));
    if(response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("Failed to load upcoming movies");
    }
  }
  
  Future<List<Movie>> getPopularMovies() async{
    final response = await http.get(Uri.parse(popularApiUrl));
    if(response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("Failed to load popular movies");
    }
  }

  Future<List<Movie>> getTopRatedMovies() async{
    final response = await http.get(Uri.parse(topRatedApiUrl));
    if(response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("Failed to load top rated movies");
    }
  }
}