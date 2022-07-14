import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/AvyaasAppTheme.dart';

class WidgetTeacher extends StatelessWidget {
  const WidgetTeacher({
    Key? key,
    required this.imageurl,
  }) : super(key: key);

  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(right: 8),
      clipBehavior: Clip.hardEdge,
      decoration:
          BoxDecoration(color: AvyaasApptheme.white, shape: BoxShape.circle),
      child: UnconstrainedBox(
        child: Image.asset(
          imageurl,
          height: 80,
        ),
      ),
    );
  }
}
