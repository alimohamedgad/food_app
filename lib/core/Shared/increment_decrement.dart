// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class IncrementAndDecrement extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;
  const IncrementAndDecrement({
    Key? key,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.withOpacity(0.9)),
        ),
        child: Icon(
          icon,
          size: 20,
        ),
      ),
    );
  }
}
