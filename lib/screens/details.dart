import 'package:flutter/material.dart';
import 'package:tmdb_app/components/cast/cast_list.dart';
import 'package:tmdb_app/components/top_bar.dart';
import 'package:tmdb_app/models/actor.dart';

class Details extends StatelessWidget {
  const Details({
    Key? key,
    required this.title,
    required this.posterSrc,
    required this.id,
  }) : super(key: key);

  final String title;
  final String posterSrc;
  final Object id;

  final Actor actor = const Actor(
    imgSrc: 'assets/images/gemma_chan.jpeg',
    name: 'Gemma Chan',
    character: 'Sersi',
  );

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
                    tag: id,
                    child: SizedBox(
                      child: Image.asset(posterSrc),
                      height: 300,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title),
                        const Divider(height: 16),
                        const Text('Release: someday'),
                        const Text('Genre: drama'),
                        const Text('Rate: 84%'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: const [
                Divider(
                  height: 16,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
                Text('tagline'),
                Text('Overview'),
                Text(
                    'Cillum deserunt sunt laboris sunt officia eiusmod tempor enim occaecat officia pariatur ad minim ut. Esse ad esse et aliquip labore laborum mollit pariatur dolore non aute eu. Laborum ea pariatur cillum laboris cupidatat eu amet.'),
                Divider(
                  height: 16,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8),
                //   child: SizedBox(
                //     height: 200,
                //     child:
                //         CastList(actors: [for (int i = 0; i < 6; i++) actor]),
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
