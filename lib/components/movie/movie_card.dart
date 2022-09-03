import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

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

  final double _containerWidth = 190;

  const MovieCard({
    Key? key,
    required this.title,
    required this.releaseDate,
    required this.imageSrc,
    required this.rating,
    required this.id,
    this.onTap,
  }) : super(key: key);

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
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            width: _containerWidth,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  clipBehavior: Clip.antiAlias,
                  child: Hero(
                    tag: id,
                    child: GestureDetector(
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: imageSrc,
                        fit: BoxFit.cover,
                      ),
                      onTap: () => onTap == null ? () {} : onTap!(),
                    ),
                  ),
                ),
                Positioned(
                  right: 4,
                  top: 4,
                  child: Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          CircularProgressIndicator(
                            value: rating / 100 * 1.0,
                            strokeWidth: 5,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).colorScheme.primary),
                          ),
                          Text(
                            '$rating',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  width: _containerWidth,
                  bottom: 0,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        Text(title),
                        Text(_formatDate(releaseDate)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
