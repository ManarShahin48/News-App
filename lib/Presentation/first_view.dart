import 'package:flutter/material.dart';
import 'package:news_app/Presentation/Widgets/custom_btn.dart';

import '../Core/Resources/uilites.dart';

class FirstView extends StatelessWidget {
  const FirstView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            ImageManager.mainImg,
            height: 450,
            width: 400,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Text(
                  StringManager.title,
                  style:
                      getBoldStyle(color: ColorManager.secondary, fontSize: 35),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 35),
                Text(
                  StringManager.subTitle,
                  style: getLightStyle(
                      color: ColorManager.secondaryLight, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 45),
                customBtn(
                  context,
                  title: StringManager.btnText,
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.secondViewRoute);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
