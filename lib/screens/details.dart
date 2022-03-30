import 'package:flutter/material.dart';

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
      appBar: AppBar(title: Text(title)),
      body: Hero(
        tag: id,
        child: Image.asset(posterSrc),
        transitionOnUserGestures: true,
      ),
    );
  }
}
