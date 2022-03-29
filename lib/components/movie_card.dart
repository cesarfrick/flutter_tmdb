import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String releaseDate;
  final String imageSrc;
  final int rating;
  final double _containerWidth = 150;

  const MovieCard({
    Key? key,
    required this.title,
    required this.releaseDate,
    required this.imageSrc,
    required this.rating,
  }) : super(key: key);

  double calculateWidth(int percentage) {
    return _containerWidth * percentage / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16.0,
      ),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: _containerWidth,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(imageSrc),
              ),
            ),
            Container(
              width: calculateWidth(rating),
              // height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle, //BoxShape.circle,
                color: Colors.blue[600],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      top: 4.0,
                      bottom: 4.0,
                    ),
                    child: Text(
                      '$rating%',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(title),
            Text(releaseDate),
          ],
        ),
      ),
    );
  }
}
