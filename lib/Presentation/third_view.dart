import 'package:flutter/material.dart';
import '../Core/Resources/uilites.dart';

class ThirdView extends StatelessWidget {
  const ThirdView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            child: const Icon(
              Icons.arrow_back,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            StringManager.detailNew,
            style: getSemiBoldStyle(
              color: ColorManager.white,
              fontSize: 20,
            ),
          ),
          actions: [
            InkWell(
              child: const Icon(
                Icons.share,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        body: Column(
          children: [
            Image.asset(
              ImageManager.mainImg,
              height: 300,
              width: 400,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringManager.secondViewTitle,
                    style: getBoldStyle(
                        color: ColorManager.secondary, fontSize: 28),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    StringManager.date,
                    style: getLightStyle(
                        color: ColorManager.secondaryLight, fontSize: 12),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    StringManager.description,
                    style: getLightStyle(
                        color: ColorManager.secondaryLight, fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
