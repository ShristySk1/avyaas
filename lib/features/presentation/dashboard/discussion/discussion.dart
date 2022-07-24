import 'package:avyaas/features/presentation/dashboard/discussion/notifier/OptionChangeNotifier.dart';
import 'package:avyaas/features/presentation/widgets/AppInput.dart';
import 'package:avyaas/features/presentation/widgets/widget_discussion.dart';
import 'package:avyaas/features/theme/AvyaasAppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../widgets/widget_option.dart';

class DiscussionPage extends StatefulWidget {
  const DiscussionPage({Key? key}) : super(key: key);

  @override
  State<DiscussionPage> createState() => _DiscussionPageState();
}

class _DiscussionPageState extends State<DiscussionPage> {
  List<String> tabs = ["Physics", "Chemistry", "Maths"];
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
                decoration:
                    AvyaasApptheme.getBoxDecoration(AvyaasApptheme.white, 10),
                padding: const EdgeInsets.only(
                    left: 16, right: 8, top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Create Post"),
                    SvgPicture.asset(
                      "assets/svg/ic_plus.svg",
                      height: 24,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Flexible(
                child: DefaultTabController(
                  length: 3,
                  child: Scaffold(
                    appBar: AppBar(
                      toolbarHeight: 35,
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      // toolbarHeight: 300,
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 16),
                            height: 35,
                            child: TabBar(
                                isScrollable: true,
                                labelPadding:
                                    EdgeInsets.symmetric(horizontal: 28),
                                unselectedLabelColor: Colors.black87,
                                indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        5), // Creates border
                                    color: AvyaasApptheme.black),
                                tabs: tabs
                                    .map((tabname) => Tab(child: Text(tabname)))
                                    .toList()),
                          ),
                        ),
                      ),
                    ),
                    body: TopTab(),
                  ),
                ),
              ),
            ],
          ),
        ),
     
    );
  }

  TopTab() {
    final ocn = Provider.of<OptionChangeNotifier>(context);

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                    isScrollable: true,
                    labelColor: AvyaasApptheme.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor: AvyaasApptheme.textGrayLight,
                    tabs: [
                      Tab(child: Text("Recent Discussion")),
                      Tab(child: Text("Recent Poll")),
                    ]),
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.only(top: 8),
            child: TabBarView(children: [
              ListView.builder(
                  itemCount: ocn.quesData.length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return Container(
                      decoration: AvyaasApptheme.getBoxDecoration(
                          AvyaasApptheme.white, 10),
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.only(
                          left: 16, right: 16, top: 0, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          WidgetDiscussion(
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
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                "assets/svg/ic_clap.svg",
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(child: Text("7 Claps")),
                              SvgPicture.asset("assets/svg/ic_comment.svg"),
                              SizedBox(
                                width: 8,
                              ),
                              Text("1 Reply(s)"),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
              ListView.builder(
                  itemCount: ocn.quesData.length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return Container(
                      decoration: AvyaasApptheme.getBoxDecoration(
                          AvyaasApptheme.white, 10),
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.only(
                          left: 16, right: 16, top: 0, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          WidgetDiscussion(
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
                                  optionNo:
                                      ocn.quesData[i].answerList[j].optionNo,
                                  totalPercentage: ocn.quesData[i].answerList[j]
                                      .totalPercentage,
                                  color: ocn.quesData[i].answerList[j].color,
                                  isChoosen:
                                      ocn.quesData[i].answerList[j].optionNo ==
                                          ocn.quesData[i].correctAns,
                                  isShowProgress:
                                      ocn.quesData[i].showProgress ?? false,
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    );
                  }),
            ]),
          ),
        ));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
