import 'package:flutter/material.dart';

import '../../../../core/Shared/increment_decrement.dart';

class CartQuantity extends StatelessWidget {
  const CartQuantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Row(
        children: [
          IncrementAndDecrement(
            icon: Icons.remove,
            onTap: () {},
          ),
          const SizedBox(width: 10),
          const Text(
            '1',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(width: 10),
          IncrementAndDecrement(icon: Icons.add, onTap: () {}),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.close,
              color: Colors.grey.withOpacity(0.9),
            ),
          )
        ],
      ),
    );
  }
}
