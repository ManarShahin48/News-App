import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Presentation/BloC/news_cubit.dart';
import 'package:news_app/Presentation/BloC/news_state.dart';
import 'Resources/uilites.dart';
import 'Routes/pages_route_name.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NewsCubit()..getNewsData()
        )
      ],
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: PagesRoutesName.firstViewRoute,
            theme: getApplicationTheme(),
          );
        },
      ),
    );
  }
}