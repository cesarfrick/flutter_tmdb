import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import 'package:tmdb_app/components/cards_list.dart';
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
        SliverAppBar(
          title: SvgPicture.asset(
            'assets/images/tmdb_logo_square.svg',
            width: 50,
            color: Colors.white,
          ),
          floating: true,
          expandedHeight: 70.0,
          flexibleSpace: FlexibleSpaceBar(
            background: SizedBox(
              child: Image.asset(
                'assets/images/bar_bg.jpeg',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          actions: [
            IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                }),
          ],
        ),
        SliverList(
          delegate:
              SliverChildListDelegate(
                [for (var i = 0; i < 3; i++) const CardsList()])
        ),
      ]),
    );
  }
}
