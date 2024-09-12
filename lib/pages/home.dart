import 'package:flutter/material.dart';
import 'package:movie_app/api/api.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/pages/movie_details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> topRatedMovies;

  @override
  void initState() {
    upcomingMovies = Api().getUpcomingMovies();
    popularMovies = Api().getPopularMovies();
    topRatedMovies = Api().getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text("Movies Corner", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Upcoming',
                style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 200,
                child: 
                FutureBuilder(
                  future: upcomingMovies,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final movies = snapshot.data!;

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails(movie: movie)));
                          },
                          child: Container(
                            width: 150,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "https://image.tmdb.org/t/p/original/${movie.backdropPath}",
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }
                    );
                  }
                ),
              ),
              const Text(
                'Popular',
                style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 200,
                child: 
                FutureBuilder(
                  future: popularMovies,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final movies = snapshot.data!;

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails(movie: movie)));
                          },
                          child: Container(
                            width: 150,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "https://image.tmdb.org/t/p/original/${movie.backdropPath}",
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }
                    );
                  }
                ),
              ),
              const Text(
                'Top Rated',
                style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 200,
                child: 
                FutureBuilder(
                  future: topRatedMovies,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final movies = snapshot.data!;

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails(movie: movie)));
                          },
                          child: Container(
                            width: 150,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "https://image.tmdb.org/t/p/original/${movie.backdropPath}",
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
