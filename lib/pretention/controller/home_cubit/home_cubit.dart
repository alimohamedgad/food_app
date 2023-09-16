import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/food_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  addToFavorite(FoodModel food) {
    food.isFavorite = !food.isFavorite;
    emit(AddToFavorite());
  }
}
