import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<String> fruits = [
    'apple',
    'banana',
    'strawberry',
    'pear',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];

    for (String fruit in fruits) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          final result = matchQuery[index];

          return ListTile(title: Text(result));
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
