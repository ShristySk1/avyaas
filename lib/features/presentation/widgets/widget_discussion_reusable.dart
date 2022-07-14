import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import 'package:avyaas/features/presentation/widgets/widget_tag.dart';
import 'package:avyaas/features/theme/AvyaasAppTheme.dart';

class WidgetDiscussionTop extends StatelessWidget {
  String userImage;
  String userName;
  String date;
  String tagName;
  Color tagColor;
  WidgetDiscussionTop({
    Key? key,
    required this.userImage,
    required this.userName,
    required this.date,
    required this.tagName,
    required this.tagColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CachedNetworkImage(
            height: 40,
            width: 40,
            imageUrl: userImage,
            imageBuilder: (context, imageProvider) => Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: AvyaasApptheme.title,
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    date,
                    style: AvyaasApptheme.caption,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  WidgetTag(tagName: tagName, color: tagColor),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
