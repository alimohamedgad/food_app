import 'package:flutter/material.dart';

class SearchFieldFilter extends StatelessWidget {
  const SearchFieldFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'بحث.....',
          suffixIcon: const Icon(Icons.filter_list),
          prefixIcon: const Icon(Icons.search),
          enabledBorder: outlineBorder(),
          focusedBorder: outlineBorder(),
          border: outlineBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1),
    );
  }
}
