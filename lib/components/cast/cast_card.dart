import 'package:flutter/material.dart';

class CastCard extends StatelessWidget {
  const CastCard({
    Key? key,
    required this.imgSrc,
    required this.name,
    required this.character,
  }) : super(key: key);

  final String imgSrc;
  final String name;
  final String character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4.0,
        ),
        child: SizedBox(
          height: 200,
          width: 150,
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: ClipRRect(
                  child: GestureDetector(
                    child: Hero(
                      tag: name,
                      child: Image.asset(imgSrc),
                    ),
                    onTap: () {},
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Text(name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              Text(character),
            ],
          ),
        ),
      ),
    );
  }
}
