import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import 'package:tmdb_app/components/movie/movies_list.dart';
import 'package:tmdb_app/components/top_bar.dart';
import 'package:tmdb_app/controllers/custom_search_delegate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerHeader(
          child: SvgPicture.asset(
            'assets/images/tmdb_logo.svg',
            width: 5.0,
            height: 5,
            fit: BoxFit.scaleDown,
          ),
          curve: Curves.easeInOutExpo,
        ),
      ),
      body: CustomScrollView(slivers: <Widget>[
        const TopBar(),
        SliverList(
            delegate: SliverChildListDelegate(
                [for (var i = 0; i < 3; i++) const CardsList()])),
      ]),
    );
  }
}
