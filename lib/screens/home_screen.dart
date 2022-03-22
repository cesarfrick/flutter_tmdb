import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
          expandedHeight: 50.0,
          flexibleSpace: FlexibleSpaceBar(
            background: SizedBox(
              child: Image.asset(
                'assets/images/bar_bg.jpeg',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ),
        SliverFillViewport(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            );
          }, childCount: 1),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
