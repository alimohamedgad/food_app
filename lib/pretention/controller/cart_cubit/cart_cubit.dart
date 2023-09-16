import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/food_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<FoodModel> cart = [];

  void increment(FoodModel food) {
    food.quantity = food.quantity! + 1;
    emit(Increment());
  }

  void addToCart(FoodModel cartModel) {
    cart.add(cartModel);
    emit(AddToCart());
  }

  void removeFromCart(FoodModel cartModel) {
    cart.remove(cartModel);
    emit(RemoveFromCart());
  }

  void decrement(FoodModel food) {
    if (food.quantity == 1) {
      return;
    } else {
      food.quantity = food.quantity! - 1;
    }
    emit(Decrement());
  }

  totalPrice(List<FoodModel> cartList) {
    num total = 0;
    for (var item in cart) {
      total += item.quantity! * item.price;
    }
    return total;
  }
}
