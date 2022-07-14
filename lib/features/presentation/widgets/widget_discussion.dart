import 'package:avyaas/features/presentation/dashboard/discussion/notifier/OptionChangeNotifier.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:avyaas/features/presentation/widgets/widget_discussion_reusable.dart';
import 'package:avyaas/features/presentation/widgets/widget_option.dart';
import 'package:avyaas/features/presentation/widgets/widget_tag.dart';
import 'package:avyaas/features/theme/AvyaasAppTheme.dart';
import 'package:provider/provider.dart';

class WidgetDiscussion extends StatefulWidget {
  WidgetDiscussion({
    Key? key,
  }) : super(key: key);

  @override
  State<WidgetDiscussion> createState() => _WidgetDiscussionState();
}

class _WidgetDiscussionState extends State<WidgetDiscussion> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ocn = Provider.of<OptionChangeNotifier>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(bottom: 8),
          padding: EdgeInsets.all(16),
          decoration: AvyaasApptheme.getBoxDecoration(AvyaasApptheme.white, 5),
          child: ListView.builder(
              itemCount: ocn.quesData.length,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    WidgetDiscussionTop(
                      date: ocn.quesData[i].date,
                      tagColor: ocn.quesData[i].tagColor,
                      tagName: ocn.quesData[i].subjectTag,
                      userImage: ocn.quesData[i].userImage,
                      userName: ocn.quesData[i].username,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      ocn.quesData[i].question,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ListView.builder(
                      itemCount: ocn.quesData[i].answerList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, j) {
                        return InkWell(
                          onTap: () {
                            ocn.toggleSelection(i, j);
                          },
                          child: WidgetOption(
                            option: ocn.quesData[i].answerList[j].option,
                            optionNo: ocn.quesData[i].answerList[j].optionNo,
                            totalPercentage:
                                ocn.quesData[i].answerList[j].totalPercentage,
                            color: ocn.quesData[i].answerList[j].color,
                            isChoosen: ocn.quesData[i].answerList[j].optionNo ==
                                ocn.quesData[i].correctAns,
                          ),
                        );
                      },
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
