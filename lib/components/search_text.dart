// Import statement for material.dart package
import 'package:flutter/material.dart';

// SearchText widget definition
class SearchText extends StatelessWidget {
  const SearchText({
    super.key,
  });

// Build method to create the widget
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
        hintText: "Search",
        suffixIcon: IconButton(
            onPressed: () {
              print('search clicked!');
            },
            icon: const Icon(Icons.search)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(),
        ),
      ),
    );
  }
}
