import 'package:devsync/Constants/colors.dart';
import 'package:flutter/material.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.backgroundColor2,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
