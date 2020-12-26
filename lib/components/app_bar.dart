import 'package:covidstatisticsapplication/helper/AppColors.dart'
    show AppColors;
import 'package:covidstatisticsapplication/helper/AppStrings.dart'
    show AppString;
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(110.0),
      child: Container(
        decoration: _boxDecoration(context),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppString.appName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration(BuildContext context) => BoxDecoration(
        color: AppColors.colorLightPrimary,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      );

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(70.0);
}
