import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: const Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          decoration: InputDecoration(
              label: Text("Search"),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              hintText: "Enter Your City"),
        ),
      )),
    );
  }
}
