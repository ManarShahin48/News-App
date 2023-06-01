import 'package:flutter/material.dart';
import 'package:news_app/Presentation/Widgets/custom_btn.dart';
import 'package:textfield_search/textfield_search.dart';

import '../Core/Resources/uilites.dart';
import 'Widgets/customNewBuilder.dart';

class SecondView extends StatefulWidget {
  SecondView({Key? key}) : super(key: key);

  @override
  State<SecondView> createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
  TextEditingController myController = TextEditingController();
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringManager.welcome,
                    style: getLightStyle(
                        color: ColorManager.secondaryLight, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  Image.asset(ImageManager.man, height: 40),
                ],
              ),
              Text(
                StringManager.secondViewTitle,
                style: getBoldStyle(color: ColorManager.black, fontSize: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.74,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: TextFieldSearch(
                      initialList: [],
                      label: '',
                      controller: myController,
                    ),
                  ),
                  customBtn(context,
                      title: '',
                      color: ColorManager.primary,
                      icon: IconManager.filter,
                      width: 50,
                      onPressed: () {})
                ],
              ),
              SizedBox(
                height: 40,
                child: ListView.separated(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return customBtn(context,
                        title: 'Language',
                        width: 100,
                        color: clicked
                            ? ColorManager.clicked
                            : ColorManager.search,
                        textColor: clicked
                            ? ColorManager.white
                            : ColorManager.secondary, onPressed: () {
                      setState(() {
                        clicked = !clicked;
                      });
                    });
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 450,
                child: ListView.separated(
                  itemCount: 9,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, i) {
                    return customNewsBuilder(context);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      width: double.infinity,
                      height: 1,
                      color: ColorManager.secondaryLight,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
