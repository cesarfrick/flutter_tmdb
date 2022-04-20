import 'package:flutter/material.dart';

import 'package:tmdb_app/components/cast/cast_list.dart';
import 'package:tmdb_app/components/top_bar.dart';
import 'package:tmdb_app/models/actor.dart';
import 'package:tmdb_app/models/movies/movie_details.dart';
import 'package:tmdb_app/services/movie_service.dart';

class Details extends StatefulWidget {
  const Details({
    Key? key,
    required this.title,
    required this.posterSrc,
    required this.id,
    required this.releaseDate,
    required this.rating,
  }) : super(key: key);

  final String title;
  final String posterSrc;
  final Object id;
  final DateTime releaseDate;
  final int rating;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late Future<MovieDetails> movie;
  String genres = '';

  final Actor actor = const Actor(
    imgSrc: 'assets/images/gemma_chan.jpeg',
    name: 'Gemma Chan',
    character: 'Sersi',
  );

  String _formattedDate(DateTime date) =>
      '${date.month}/${date.day}/${date.year}';

  @override
  void initState() {
    movie = MovieService.getMovie(widget.id as int);

    movie.then((MovieDetails data) => setState(() {
          genres = data.genres.map((e) => e.name).join(', ');
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const TopBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                children: [
                  Hero(
                    tag: widget.id,
                    child: SizedBox(
                      child: Image.asset(widget.posterSrc),
                      height: 300,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 170,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              '${widget.title} (${widget.releaseDate.year})',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Released on: ${_formattedDate(widget.releaseDate)}',
                            ),
                          ),
                          if (genres != '')
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text('Genre(s): $genres'),
                            ),
                          Text('Rate: ${widget.rating * 10}%'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FutureBuilder(
              future: movie,
              builder:
                  (BuildContext context, AsyncSnapshot<MovieDetails> snapshot) {
                if (snapshot.hasData) {
                  final MovieDetails details = snapshot.data as MovieDetails;

                  return Column(
                    children: [
                      const Divider(
                        height: 16,
                        thickness: 2,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16.0,
                          top: 8.0,
                        ),
                        child: Text(
                          details.tagline,
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      const Text(
                        'Overview',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16.0,
                          bottom: 8.0,
                          left: 16.0,
                          right: 16.0,
                        ),
                        child: Text(details.overview),
                      ),
                      const Divider(
                        height: 16,
                        thickness: 2,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          height: 200,
                          child: CastList(
                              actors: [for (int i = 0; i < 6; i++) actor]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          height: 200,
                          child: CastList(
                              actors: [for (int i = 0; i < 6; i++) actor]),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }

                return const Center(
                  child: CircularProgressIndicator(),
                  heightFactor: 10,
                  widthFactor: 10,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
