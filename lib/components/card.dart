import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String releaseDate;
  final String imageSrc;
  final double rating;

  const MovieCard({
    Key? key,
    required this.title,
    required this.releaseDate,
    required this.imageSrc,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(imageSrc),
            ),
          ),
          Text('$rating%'),
          Text(title),
          Text(releaseDate),
        ],
      ),
    );
  }
}
