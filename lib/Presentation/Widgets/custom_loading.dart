import 'package:flutter/material.dart';

import '../../Core/Resources/uilites.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 450,
      child: Center(
        child: CircularProgressIndicator(
          color: ColorManager.primary,
        ),
      ),
    );
  }
}
