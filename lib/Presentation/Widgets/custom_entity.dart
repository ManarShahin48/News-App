import 'package:flutter/material.dart';
import 'package:news_app/Presentation/Widgets/custom_btn.dart';
import '../../Core/Resources/uilites.dart';

class CustomEntity extends StatelessWidget {
  const CustomEntity({
    Key? key,
    required this.text,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.54,
          height: MediaQuery.of(context).size.height * 0.06,
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  icon,
                  color: ColorManager.primary,
                ),
                border: const OutlineInputBorder()),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Search must not be empty';
              }
              return null;
            },
          ),
        ),
        customBtn(
          context,
          title: text,
          width: 110,
          color: ColorManager.search,
          textColor: ColorManager.secondary,
          onPressed: () {},
        ),
      ],
    );
  }
}
