import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/AvyaasAppTheme.dart';

class WidgetCourse extends StatelessWidget {
  String imageurl;
  String coursename;
  WidgetCourse({
    Key? key,
    required this.imageurl,
    required this.coursename,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      margin: EdgeInsets.only(right: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 70,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: AvyaasApptheme.white, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SvgPicture.asset(imageurl),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            coursename,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
