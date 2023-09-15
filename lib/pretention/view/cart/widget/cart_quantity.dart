// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';

// import 'package:food_app/data/model/food_model.dart';

// import '../../../../core/Shared/increment_decrement.dart';

// class CartQuantity extends StatefulWidget {
//   final FoodModel foodItem;
//   const CartQuantity({
//     Key? key,
//     required this.foodItem,
//   }) : super(key: key);

//   @override
//   State<CartQuantity> createState() => _CartQuantityState();
// }

// class _CartQuantityState extends State<CartQuantity> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 14),
//       child: Row(
//         children: [
//           IncrementAndDecrement(
//             icon: Icons.remove,
//             onTap: () {
//               if (widget.foodItem.quantity == 1) {
//                 return;
//               } else {
//                 setState(() {
//                   widget.foodItem.quantity = widget.foodItem.quantity! - 1;
//                 });
//               }
//             },
//           ),
//           const SizedBox(width: 10),
//           Text(
//             widget.foodItem.quantity.toString(),
//             style: TextStyle(fontSize: 20),
//           ),
//           const SizedBox(width: 10),
//           IncrementAndDecrement(
//               icon: Icons.add,
//               onTap: () {
//                 setState(() {
//                   widget.foodItem.quantity = widget.foodItem.quantity! + 1;
//                 });
//               }),
//           const Spacer(),
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 foodCart.remove(widget.foodItem);
//               });
//               print(foodCart.length);
//             },
//             child: Icon(
//               Icons.close,
//               color: Colors.grey.withOpacity(0.9),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
