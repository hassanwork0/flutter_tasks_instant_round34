import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate {
  List<String> content = [
    "Fruits",
    "Vegetables",
    "Milk",
    "Eggs",
    "Fish",
    "Bread",
    "Meat",
    "Juice",
  ];

  List<String>? filterList;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Center(child: Text("Select an item"));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return ListView.builder(
        itemCount: content.length,
        itemBuilder: (context, i) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(content[i], style: const TextStyle(fontSize: 16)),
            ),
          );
        },
      );
    } else {
      String lowerQuery = query.toLowerCase();

      filterList = content.where((element) {
        return element.toLowerCase().startsWith(lowerQuery);
      }).toList();

      if (filterList!.isEmpty) {
        return const Center(
          child: Text(
            "No results found",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        );
      }

      return ListView.builder(
        itemCount: filterList!.length,
        itemBuilder: (context, i) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(filterList![i], style: const TextStyle(fontSize: 16)),
            ),
          );
        },
      );
    }
  }
}
