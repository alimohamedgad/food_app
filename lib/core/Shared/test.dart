import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool? like;
  List<Modal> userList = [];

  @override
  void initState() {
    userList.add(Modal(name: 'Dipto', isSelected: false));
    userList.add(Modal(name: 'Dipankar', isSelected: false));
    userList.add(Modal(name: 'Sajib', isSelected: false));
    userList.add(Modal(name: 'Shanto', isSelected: false));
    userList.add(Modal(name: 'Pranto', isSelected: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            height: 50,
            width: MediaQuery.of(context).size.width * 0.8,
            color: Colors.yellowAccent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  userList[index].name,
                ),
                Positioned(
                  child: IconButton(
                    icon: _iconControl(userList[index].isSelected),
                    onPressed: () {
                      setState(() {
                        userList.forEach((element) {
                          element.isSelected = false;
                        });

                        userList[index].isSelected = true;
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ));
  }

  _iconControl(bool like) {
    if (like == false) {
      return const Icon(Icons.favorite_border);
    } else {
      return const Icon(
        Icons.favorite,
        color: Colors.red,
      );
    }
  }
}

class Modal {
  late String name;
  late bool isSelected;

  Modal({required this.name, this.isSelected = false});
}

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ...List.generate(
            foodList.length,
            (index) => foodListTile(
              foodList[index],
              false,
              (v) {
                Navigator.pop(context, v);
              },
            ),
          )
        ],
      ),
    );
  }

  selectedFood(Food v) {}

  Widget foodListTile(
    Food food,
    bool isSelected,
    ValueChanged<Food> onSelectedCountry,
  ) {
    return ListTile(
      onTap: () {
        Navigator.pop(context, food);
      },
      title: Text(food.name),
    );
  }
}

List<Food> foodList = [
  Food(name: 'بيتزا'),
  Food(name: 'كريب'),
  Food(name: 'شاورما'),
  Food(name: 'بيرجر'),
];

class Food {
  final String name;
  Food({
    required this.name,
  });
}
