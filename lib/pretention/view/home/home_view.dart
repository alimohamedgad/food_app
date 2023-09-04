import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../data/model/food.dart';
import 'widgets/home_component/app_bar_home.dart';
import 'widgets/home_component/popular_food.dart';
import 'widgets/home_component/search_field_filter.dart';
import 'widgets/home_component/small_category.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeAppBar(),
                  SearchFieldFilter(),
                  SmallCategory(),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Popular Items',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            SliverAnimatedGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2.1,
              ),
              initialItemCount: foodData.length,
              itemBuilder: (context, index, animation) {
                return PopularFood(
                  foodItem: foodData[index],
                  index: index,
                ).animate(delay: (100 * index).ms).fade().slideX(
                      duration: 300.ms,
                      begin: -1,
                      curve: Curves.easeInSine,
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
