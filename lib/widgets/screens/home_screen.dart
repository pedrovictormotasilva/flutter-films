import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdbapi/api/api.dart';
import 'package:tmdbapi/models/movie.dart';
import 'package:tmdbapi/widgets/movies_slider.dart';
import 'package:tmdbapi/widgets/trending_slider.dart';

//PART 5 12:34

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> discoveryMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatingMovies();
    upcomingMovies = Api().getUpComingMovies();
    discoveryMovies = Api().getDiscoveryMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/flutflix.png',
          fit: BoxFit.cover,
          height: 40,
          filterQuality: FilterQuality.high, //MANTEM A QUALIDADE ALTA
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Em Alta",
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      return TrendingSlider(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                "Melhores avaliados",
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: topRatedMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      return MoviesSlider(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                "Próximos lançamentos",
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: upcomingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      return MoviesSlider(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                "Descubra...",
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                child: FutureBuilder(
                  future: discoveryMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      return MoviesSlider(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
