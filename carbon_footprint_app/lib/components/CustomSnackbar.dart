import 'package:carbon_footprint_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomSnackbar {
  static void show(
    BuildContext context,
    String text,
    Color color,
    String icon,
    double width,
  ) {
    final snackBar = SnackBar(
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: width * 0.1,
            child: Center(
              child: Image.asset(
                icon,
                color: color,
                height: 30,
                width: 30,
              ),
            ),
          ),
          Gap(width * 0.02),
          SizedBox(
            width: width * 0.6,
            child: Text(
              text,
              overflow: TextOverflow.clip,
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      elevation: 5,
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      closeIconColor: DTprimary().error,
      margin: const EdgeInsets.only(
        bottom: 20,
        left: 10,
        right: 10,
      ),
      duration: const Duration(
        milliseconds: 950,
      ),
      backgroundColor: DTprimary().onBody,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
