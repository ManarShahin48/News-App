import 'package:flutter/material.dart';
import 'package:news_app/Core/Resources/uilites.dart';

class ThirdView extends StatelessWidget {
  String img;
  String title;
  String date;
  String text;

  ThirdView({
    Key? key,
    required this.img,
    required this.title,
    required this.date,
    required this.text,
  }) : super(key: key);

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
              },
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(img), fit: BoxFit.cover),
                ),
                // child: Image.asset(
                //   ImageManager.mainImg,
                //   height: 300,
                //   width: 400,
                //   fit: BoxFit.fitWidth,
                // ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: getBoldStyle(
                          color: ColorManager.secondary, fontSize: 28),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      date,
                      style: getLightStyle(
                          color: ColorManager.secondaryLight, fontSize: 12),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      text,
                      style: getLightStyle(
                          color: ColorManager.secondaryLight, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
