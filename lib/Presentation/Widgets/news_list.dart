import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Resources/enums.dart';
import 'package:news_app/Presentation/BloC/news_cubit.dart';
import 'package:news_app/Presentation/BloC/news_state.dart';

import '../../Core/Resources/uilites.dart';
import '../Pages/third_view.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        switch (cubit.getNewsState) {
          case RequestState.loading:
            return const SizedBox(
              height: 450,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestState.loaded:
            return SizedBox(
              height: 450,
              child: ListView.separated(
                itemCount: cubit.newsList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image:
                                      NetworkImage(cubit.newsList[index].image),
                                  fit: BoxFit.cover),
                            ),
                            child: cubit.lang == 'en'
                                ? Image.asset(ImageManager.mainImg,
                                    fit: BoxFit.cover)
                                : null,
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
                                      cubit.newsList[index].title,
                                      style: getBoldStyle(
                                        color: ColorManager.black,
                                        fontSize: 20,
                                      ),
                                      maxLines: cubit.lang == 'fr' ? 2 : 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    cubit.newsList[index].text,
                                    style: getRegularStyle(
                                      color: ColorManager.grey,
                                    ),
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ThirdView(
                            img: cubit.newsList[index].image,
                            title: cubit.newsList[index].title,
                            date: cubit.newsList[index].publishDate,
                            text: cubit.newsList[index].text,
                          ),
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    width: double.infinity,
                    height: 1,
                    color: ColorManager.secondaryLight,
                  );
                },
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 170.0,
              child: Center(
                child: Text(cubit.message),
              ),
            );
        }
      },
    );
  }
}
