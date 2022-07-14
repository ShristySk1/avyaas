import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:avyaas/features/presentation/widgets/progress_horizontal.dart';

import '../../theme/AvyaasAppTheme.dart';

class WidgetOption extends StatelessWidget {
  String optionNo;
  String option;
  double totalPercentage;
  Color color;
  bool isChoosen;
  
  WidgetOption({
    Key? key,
    this.isChoosen = false,
    required this.optionNo,
    required this.option,
    required this.totalPercentage,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6),
      decoration: AvyaasApptheme.getBoxDecoration(
          AvyaasApptheme.backgroundgraylight, 5),
      child: Material(
        animationDuration: Duration(seconds: 2),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          // onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Stack(children: [
                      !isChoosen
                          ? Container(
                              alignment: Alignment.center,
                              width: 24,
                              height: 24,
                              decoration: AvyaasApptheme.getBoxDecoration(
                                  AvyaasApptheme.backgroundgraydark, 4),
                              child: Text(
                                optionNo,
                                textAlign: TextAlign.center,
                              ),
                            )
                          : Container(
                              width: 24,
                              height: 24,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 4),
                              decoration: AvyaasApptheme.getBoxDecoration(
                                  AvyaasApptheme.green, 4),
                              child: SvgPicture.asset("assets/svg/ic_tick.svg"),
                            ),
                    ]),
                    SizedBox(
                      width: 8,
                    ),
                    Text(option),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                ProgressBar(
                  max: 100,
                  current: totalPercentage,
                  color: color,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "${totalPercentage} %",
                  style: AvyaasApptheme.numbersmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
