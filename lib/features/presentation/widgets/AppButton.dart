import 'package:avyaas/features/theme/AvyaasAppTheme.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  bool? isContainIcon;
  IconData? icon;
  final String text;
  double? iconSize;
  Function onLoginClick;
  AppButton(
      {Key? key,
      required this.text,
      this.isContainIcon = false,
      this.icon,
      this.iconSize,
      required this.onLoginClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 3,
              offset: Offset(0, 2))
        ], borderRadius: BorderRadius.circular(5)),
        width: 200,
        height: 40,
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(5),
          color: AvyaasApptheme.black,
          child: InkWell(
            splashColor: AvyaasApptheme.spashbuttoncolor,
            // highlightColor: Constants.BLACK,
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              onLoginClick();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: isContainIcon == true
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(color: Colors.white),
                  ),
                  isContainIcon == true
                      ? Icon(
                          icon,
                          size: iconSize,
                          color: Colors.white,
                        )
                      : Text("")
                ],
              ),
            ),
          ),
        ));
  }
}
