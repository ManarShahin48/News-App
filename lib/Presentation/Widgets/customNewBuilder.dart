import 'package:flutter/material.dart';

import '../../Core/Resources/uilites.dart';

Widget customNewsBuilder(context) => InkWell(
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // image: const DecorationImage(
            //     image: NetworkImage(
            //         'https://images.app.goo.gl/puMhYVHxVjqbPMpq5'),
            //     fit: BoxFit.cover),
          ),
          child: Image.asset(ImageManager.mainImg),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: SizedBox(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    StringManager.title,
                    style: getBoldStyle(
                      color: ColorManager.black,
                      fontSize: 20,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  StringManager.subTitle,
                  style: getRegularStyle(
                      color: ColorManager.grey),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  ),
  onTap: () {
    Navigator.pushNamed(context, Routes.thirdViewRoute);
  },
);