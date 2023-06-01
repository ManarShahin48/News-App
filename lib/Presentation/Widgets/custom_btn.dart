import 'package:flutter/material.dart';
import 'package:news_app/Core/Resources/styles_manager.dart';

Widget customBtn(
  BuildContext context, {
  required String title,
  Function()? onPressed,
  IconData? icon,
  Color? color,
  Color? iconColor,
  Color? textColor,
  double? width,
  double? height,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color ?? Theme.of(context).primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: iconColor ?? Colors.white,
              size: height != null
                  ? height * 0.2
                  : (MediaQuery.of(context).size.height * 0.06) * 0.4,
            ),
          Text(
            title,
            style: getBoldStyle(color: textColor ?? Colors.white, fontSize: 16)
          ),
        ],
      ),
    ),
  );
}