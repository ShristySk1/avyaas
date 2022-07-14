import 'package:avyaas/features/presentation/widgets/widget_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import 'package:avyaas/features/presentation/widgets/AppButton.dart';
import 'package:avyaas/features/presentation/widgets/progress_horizontal.dart';
import 'package:avyaas/features/presentation/widgets/widget_teacher.dart';
import 'package:avyaas/features/theme/AvyaasAppTheme.dart';

import '../../widgets/widget_course.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  var listCourses = [
    WidgetCourse(
      imageurl: "assets/svg/ic_chemistry.svg",
      coursename: "Chemistry",
    ),
    WidgetCourse(
      imageurl: "assets/svg/ic_maths.svg",
      coursename: "Maths",
    ),
    WidgetCourse(
      imageurl: "assets/svg/ic_physics.svg",
      coursename: "Physics",
    ),
  ];
  var listTeachers = [
    WidgetTeacher(
      imageurl: "assets/images/teacher_lady.png",
    ),
    WidgetTeacher(
      imageurl: "assets/images/teacher_man.png",
    ),
    WidgetTeacher(
      imageurl: "assets/images/teacher_lady.png",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appbarType2(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(16, 16, 0, 16),
                    decoration: BoxDecoration(
                        color: AvyaasApptheme.white,
                        border: Border.all(
                          color: AvyaasApptheme.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Take your CEE preperation to next level.",
                                style: AvyaasApptheme.titleUnbold,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              AppButton(
                                  text: "Get subscription", onLoginClick: () {})
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 1,
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: SvgPicture.asset(
                                  "assets/svg/ic_scene1.svg",
                                  height: 80,
                                ))),
                      ],
                    )),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Daily Test",
                  style: AvyaasApptheme.title,
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                    decoration: AvyaasApptheme.getBoxDecoration(
                        AvyaasApptheme.white, 10),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: AvyaasApptheme.getBoxDecoration(
                              AvyaasApptheme.almostwhite, 5),
                          child: Text(
                            "23\nMAR",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Daily Test",
                                  style: AvyaasApptheme.titleUnbold,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "40 Questions | 40 min\nUncompleted",
                                  style: AvyaasApptheme.subtitle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          "assets/svg/ic_play.svg",
                          height: 45,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Courses",
                  style: AvyaasApptheme.title,
                ),
                SizedBox(
                  height: 8,
                ),
                // Expanded(
                //   child: ListView.builder(
                //       shrinkWrap: true,
                //       primary: false,
                //       scrollDirection: Axis.horizontal,
                //       itemCount: listCourses.length,
                //       itemBuilder: (context, index) {
                //         return listCourses[index];
                //       }),
                // ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        List<Widget>.generate(listCourses.length, (index) {
                      return listCourses[index];
                    }),
                  ),
                ),
                SizedBox(
                  height: 26,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Notices",
                      style: AvyaasApptheme.title,
                    ),
                    Text(
                      "View All",
                      style: AvyaasApptheme.subtitle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                    decoration: AvyaasApptheme.getBoxDecoration(
                        AvyaasApptheme.white, 10),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/emblem_of_nepal.png",
                          height: 40,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "MEC Notice",
                                  style: AvyaasApptheme.titleUnbold,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Schedule of Common Entrance Examination of DM/MCH Program ",
                                  style: AvyaasApptheme.subtitle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Our Teachers",
                      style: AvyaasApptheme.title,
                    ),
                    Text(
                      "View All",
                      style: AvyaasApptheme.subtitle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                // Expanded(
                //   child: ListView.builder(
                //       shrinkWrap: true,
                //       primary: false,
                //       scrollDirection: Axis.horizontal,
                //       itemCount: listTeachers.length,
                //       itemBuilder: (context, index) {
                //         return listTeachers[index];
                //       }),
                // ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        List<Widget>.generate(listTeachers.length, (index) {
                      return listTeachers[index];
                    }),
                  ),
                ),
               
              ],
            ),
          ),
        ));
  }

  _appbarType2() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 60,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        margin: EdgeInsets.only(top: 60),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          //name
          RichText(
            text: TextSpan(
                text: 'Hellos',
                style: AvyaasApptheme.title,
                children: <TextSpan>[
                  TextSpan(
                    text: ', User,',
                    style: AvyaasApptheme.title,
                  )
                ]),
          ),
          SvgPicture.asset(
            "assets/svg/ic_notification.svg",
            height: 20,
          )
        ]),
      ),
    );
  }
}

