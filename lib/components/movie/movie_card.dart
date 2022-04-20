import 'package:flutter/material.dart';

List<String> months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sept',
  'Oct',
  'Nov',
  'Dec',
];

class MovieCard extends StatelessWidget {
  final String title;
  final DateTime releaseDate;
  final String imageSrc;
  final int rating;
  final int id;
  final Function? onTap;

  final double _containerWidth = 150;

  const MovieCard({
    Key? key,
    required this.title,
    required this.releaseDate,
    required this.imageSrc,
    required this.rating,
    required this.id,
    this.onTap,
  }) : super(key: key);

  double _calculateWidth(int percentage) {
    return _containerWidth * percentage / 100;
  }

  String _formatDate(DateTime date) {
    String dataString = '${months[date.month - 1]} ${date.day}, ${date.year}';
    return dataString;
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
                child: Hero(
                  tag: id,
                  child: GestureDetector(
                    child: Image.asset(imageSrc, fit: BoxFit.cover),
                    onTap: () => onTap == null ? () {} : onTap!(),
                  ),
                ),
              ),
            ),
            Container(
              width: _calculateWidth(rating),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
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
            Text(_formatDate(releaseDate)),
          ],
        ),
      ),
    );
  }
}
