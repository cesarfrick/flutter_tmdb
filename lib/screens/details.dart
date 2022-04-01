import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmdb_app/components/top_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const TopBar(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Stack(
                  children: [
                    Hero(
                      tag: id,
                      child: Image.asset(posterSrc),
                    ),
                    Text(title),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
