import 'package:flutter/material.dart';

import 'test.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  Food? food;
// List<Food> foodList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Card(
              child: newMethod(
                onTap: () async {
                  final food = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FoodPage(),
                    ),
                  );
                  if (food == null) return;
                  print(food?.name);
                  setState(() {
                    this.food = food;
                  });
                },
                title: food?.name ?? 'No Food',
              ),
            )
          ],
        ),
      ),
    );
  }

  ListTile newMethod({
    required String title,
    required Function()? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      trailing: Icon(Icons.arrow_drop_down),
    );
  }
}
