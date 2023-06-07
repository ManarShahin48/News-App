import 'package:flutter/material.dart';
import 'package:news_app/Presentation/Widgets/custom_entity.dart';

import '../../Core/Resources/uilites.dart';
import '../BloC/news_cubit.dart';
import 'custom_btn.dart';

void showFilterDialog({
  required BuildContext context,
}) {
  showDialog(
    context: context,
    builder: (context) {
      var cubit = NewsCubit.get(context);
      return AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        insetPadding: const EdgeInsets.all(16),
        content: Container(
          width: 500,
          height: 400,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
              )
            ],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomEntity(
                text: StringManager.location,
                icon: Icons.location_on_outlined,
                controller: cubit.locationController,
              ),
              CustomEntity(
                text: StringManager.person,
                icon: Icons.person,
                controller: cubit.personController,
              ),
              CustomEntity(
                text: StringManager.organization,
                icon: Icons.account_balance_outlined,
                controller: cubit.organizationController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customBtn(
                    context,
                    width: 150,
                    title: StringManager.cancel,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  customBtn(
                    context,
                    width: 150,
                    title: StringManager.apply,
                    onPressed: () {
                      cubit.getNewsData();
                      print(cubit.locationController.text);
                      print(cubit.personController.text);
                      print(cubit.organizationController.text);
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
