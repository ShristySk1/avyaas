import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:avyaas/features/theme/AvyaasAppTheme.dart';

class WidgetTag extends StatelessWidget {
  String tagName;
  Color color;
  WidgetTag({
    Key? key,
    required this.tagName,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: AvyaasApptheme.getBoxDecoration(color, 10),
      child: Text(
        tagName,
        style: TextStyle(color: AvyaasApptheme.white, fontSize: 12),
      ),
    );
  }
}
