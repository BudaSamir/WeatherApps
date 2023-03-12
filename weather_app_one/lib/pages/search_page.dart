import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  String? city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          onSubmitted: (value) {
            city = value;
          },
          decoration: const InputDecoration(
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
