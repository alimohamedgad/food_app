// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:hospital_new/view/widgets/custom_text.dart';

// import 'core/utils/dumy_data.dart';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

class SingleSelection extends StatefulWidget {
  const SingleSelection({super.key});

  @override
  State<SingleSelection> createState() => _SingleSelectionState();
}

class _SingleSelectionState extends State<SingleSelection> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...List.generate(
          foodList.length,
          (index) => foodListTile(
            foodList[index],
            false,
            selectedFood,
          ),
        )
      ],
    );
  }

  selectedFood(Food v) {
    Navigator.pop(context, v);
  }

  Widget foodListTile(
    Food food,
    bool isSelected,
    ValueChanged<Food> onSelectedCountry,
  ) {
    return ListTile(
      onTap: () => selectedFood(food),
      title: Text(food.name),
      trailing: isSelected ? const Icon(Icons.check) : null,
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

// class Test extends StatefulWidget {
//   const Test({super.key});

//   @override
//   State<Test> createState() => _TestState();
// }

// var typ = CatgTyp.teeth;

// class _TestState extends State<Test> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       // if (typ == CatgTyp.teeth) {
//                       //   return;
//                       // }
//                       setState(() {
//                         typ = CatgTyp.teeth;
//                       });
//                     },
//                     child: AnimatedContainer(
//                       curve: Curves.easeIn,
//                       duration: const Duration(milliseconds: 700),
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 3),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         color: typ == CatgTyp.teeth
//                             ? const Color(0xffFFAF64)
//                             : Colors.white,
//                       ),
//                       child: Row(
//                         children: [
//                           CustomText(
//                             text: 'أسنان',
//                             fontSize: typ == CatgTyp.teeth ? 22 : 18,
//                             color: typ == CatgTyp.teeth
//                                 ? Colors.black
//                                 : Colors.black.withOpacity(0.4),
//                           ),
//                           const SizedBox(width: 10),
//                           const Icon(FontAwesomeIcons.teeth),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 20),
//                   GestureDetector(
//                     onTap: () {
//                       // if (typ == CatgTyp.bone) {
//                       //   return;
//                       // }
//                       setState(() {
//                         typ = CatgTyp.bone;
//                       });
//                     },
//                     child: AnimatedContainer(
//                       duration: Duration(milliseconds: 800),
//                       curve: Curves.easeIn,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 3),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         color: typ == CatgTyp.bone
//                             ? const Color(0xffFFAF64)
//                             : Colors.white,
//                       ),
//                       child: Row(
//                         children: [
//                           CustomText(
//                             fontSize: typ == CatgTyp.bone ? 22 : 18,
//                             text: 'عظام',
//                           ),
//                           const SizedBox(width: 10),
//                           const Icon(FontAwesomeIcons.teeth),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               typ == CatgTyp.bone
//                   ? Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Center(
//                           child: ListView.builder(
//                             itemCount: categoryDummy.length,
//                             itemBuilder: (context, index) {
//                               var catg = categoryDummy[index];
//                               return Text('${catg.nameCategory}');
//                             },
//                           ),
//                         ),
//                       ),
//                     )
//                   : Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Center(
//                           child: ListView.builder(
//                             itemCount: doctorSpecialtyList.length,
//                             itemBuilder: (context, index) {
//                               var doc = doctorSpecialtyList[index];
//                               return Text(doc);
//                             },
//                           ),
//                         ),
//                       ),
//                     )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// enum CatgTyp {
//   teeth,
//   bone,
// }
