import 'package:flutter/material.dart';

import '../../../../../data/model/category.dart';

class SmallCategory extends StatelessWidget {
  const SmallCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 0.0,
      children: [
        ...List.generate(
          categoryData.length,
          (index) => Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: 80,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                // border: Border.all(
                //   color: Colors.grey.withOpacity(0.5),
                // ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 1,
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Image.asset(
                    categoryData[index].image,
                    height: 40,
                  ),
                  Text(
                    categoryData[index].name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
