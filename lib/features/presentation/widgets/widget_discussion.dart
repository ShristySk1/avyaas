import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:avyaas/features/presentation/widgets/widget_discussion_reusable.dart';
import 'package:avyaas/features/presentation/widgets/widget_option.dart';
import 'package:avyaas/features/presentation/widgets/widget_tag.dart';
import 'package:avyaas/features/theme/AvyaasAppTheme.dart';

class WidgetDiscussion extends StatefulWidget {
  String subjectTag;
  String username;
  String date;
  String question;
  String userImage;
  Color tagColor;
  List<WidgetOption> widgetOptionList;
  List<WidgetOption> newOptions = [];

  // List<WidgetOption?> _widgetOptionList=[];

  WidgetDiscussion({
    Key? key,
    required this.subjectTag,
    required this.username,
    required this.date,
    required this.question,
    required this.userImage,
    required this.tagColor,
    required this.widgetOptionList,
  }) : super(key: key);

  @override
  State<WidgetDiscussion> createState() => _WidgetDiscussionState();
}

class _WidgetDiscussionState extends State<WidgetDiscussion> {
  // _updateList(int position) {
  //   setState(() {
  //     widget._widgetOptionList = widget.widgetOptionList.map<WidgetOption?>((element) {
  //         element.isChoosen = widget.widgetOptionList.indexOf(element) == position ? true : false;
  //     }).toList();
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    widget.newOptions = widget.widgetOptionList;
    super.initState();
  }

  _updateAtposition(int index) {
    var newwidgetList = widget.widgetOptionList;

    for (int i = 0; i < widget.widgetOptionList.length - 1; i++) {
      if (index == i) {
        newwidgetList[index].isChoosen = true;
      } else {
        newwidgetList[index].isChoosen = false;
      }
    }
    setState(() {
      widget.newOptions = newwidgetList;
      print(widget.widgetOptionList.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(16),
      decoration: AvyaasApptheme.getBoxDecoration(AvyaasApptheme.white, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          WidgetDiscussionTop(
            date: widget.date,
            tagColor: widget.tagColor,
            tagName: widget.subjectTag,
            userImage: widget.userImage,
            userName: widget.username,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            widget.question,
          ),
          SizedBox(
            height: 8,
          ),
          ListView.builder(
            itemCount: widget.newOptions.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: widget.newOptions[index],
                // onTap: () {
                //   print("go to chat page" + index.toString());

                //   _updateAtposition(index);
                // },
              );
            },
          )
        ],
      ),
    );
  }
}
