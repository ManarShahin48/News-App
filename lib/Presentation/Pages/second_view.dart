import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Presentation/BloC/news_state.dart';
import 'package:news_app/Presentation/Widgets/custom_btn.dart';
import 'package:textfield_search/textfield_search.dart';
import '../../Core/Resources/enums.dart';
import '../../Core/Resources/uilites.dart';
import '../BloC/news_cubit.dart';
import '../Widgets/news_list.dart';

class SecondView extends StatelessWidget {
  const SecondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
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
                    InkWell(
                      onTap: () async {},
                      child: Text(
                        StringManager.secondViewTitle,
                        style: getBoldStyle(
                            color: ColorManager.black, fontSize: 30),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.74,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: TextFieldSearch(
                            initialList: cubit.newsList,
                            label: '',
                            controller: TextEditingController(),
                          ),
                        ),
                        customBtn(
                          context,
                          title: '',
                          color: ColorManager.primary,
                          icon: IconManager.filter,
                          width: 50,
                          onPressed: () {},
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                        itemCount: languages.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return customBtn(
                            context,
                            title: languages[index],
                            width: 100,
                            color: cubit.lang == languagesCode[index]
                                ? ColorManager.clicked
                                : ColorManager.search,
                            textColor: cubit.lang == languagesCode[index]
                                ? ColorManager.white
                                : ColorManager.secondary,
                            onPressed: () {
                              cubit.setLang(languagesCode[index]);
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 20,
                          );
                        },
                      ),
                    ),
                    const NewsList(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
