import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import 'package:tmdb_app/components/movie/movies_list.dart';
import 'package:tmdb_app/components/top_bar.dart';
import 'package:tmdb_app/models/movies/movie.dart';
import 'package:tmdb_app/models/movies/movies.dart';
import 'package:tmdb_app/service/movies_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Movies> movies;

  @override
  void initState() {
    movies = Service.getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerHeader(
          child: SvgPicture.asset(
            'assets/images/tmdb_logo.svg',
            width: 5.0,
            height: 5,
            fit: BoxFit.scaleDown,
          ),
          curve: Curves.easeInOutExpo,
        ),
      ),
      body: FutureBuilder(
        future: movies,
        builder: (BuildContext context, AsyncSnapshot<Movies> snapshot) {
          if (snapshot.hasData) {
            List<Movie> moviesData = snapshot.data!.data;

            return CustomScrollView(slivers: <Widget>[
              const TopBar(),
              SliverList(
                delegate:
                    SliverChildListDelegate([CardsList(movies: moviesData)]),
              ),
            ]);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
