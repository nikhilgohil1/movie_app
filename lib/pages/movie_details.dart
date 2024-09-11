import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;
  const MovieDetails({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text("Movie Corner", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.network("https://image.tmdb.org/t/p/original/${movie.backdropPath}"),
          SizedBox(height: 20),
          Text(movie.title, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
          Text(movie.overview, style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}