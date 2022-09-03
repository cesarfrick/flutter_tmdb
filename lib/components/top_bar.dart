import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmdb_app/controllers/custom_search_delegate.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: SvgPicture.asset(
        'assets/images/tmdb_logo_square.svg',
        width: 50,
        color: Colors.white,
      ),
      floating: true,
      expandedHeight: 70.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'assets/images/bar_bg.jpeg',
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
      actions: [
        IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            }),
      ],
    );
  }
}
