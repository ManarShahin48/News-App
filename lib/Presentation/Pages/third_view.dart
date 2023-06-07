import 'package:flutter/material.dart';
import 'package:news_app/Core/Resources/uilites.dart';
import 'package:share_plus/share_plus.dart';

import '../BloC/news_cubit.dart';

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
    var cubit = NewsCubit.get(context);
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
              onTap: () {
                Share.shareWithResult('$img\n\n$title\n\n$date\n\n$text',
                    subject: StringManager.detailNew);
              },
              child: const Icon(
                Icons.share,
              ),
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
                child: cubit.lang == 'en'
                    ? Image.asset(
                        ImageManager.mainImg,
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: getBoldStyle(
                        color: ColorManager.secondary,
                        fontSize: 28,
                      ),
                      textAlign:
                          cubit.lang == 'ar' ? TextAlign.right : TextAlign.left,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      date,
                      style: getLightStyle(
                        color: ColorManager.secondaryLight,
                        fontSize: 12,
                      ),
                      textAlign:
                          cubit.lang == 'ar' ? TextAlign.right : TextAlign.left,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      text,
                      style: getLightStyle(
                        color: ColorManager.secondaryLight,
                        fontSize: 15,
                      ),
                      textAlign:
                          cubit.lang == 'ar' ? TextAlign.right : TextAlign.left,
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
