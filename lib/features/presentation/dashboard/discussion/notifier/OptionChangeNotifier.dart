import 'package:flutter/material.dart';

import '../../../../theme/AvyaasAppTheme.dart';
import '../../../widgets/widget_discussion.dart';
import '../../../widgets/widget_option.dart';

class OptionChangeNotifier with ChangeNotifier {
  final quesData = List.generate(
      3,
      (index) => QuesData(
              tagColor: AvyaasApptheme.option1color,
              subjectTag: "Physics",
              username: "Test User",
              date: "April 2 2022",
              question:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              userImage: 'https://via.placeholder.com/350x150',
              answerList: [
                AnswerList(
                  color: AvyaasApptheme.option1color,
                  option: 'Answer 1',
                  totalPercentage: 60,
                  optionNo: 'A',
                ),
                AnswerList(
                  color: AvyaasApptheme.option2color,
                  option: 'Answer 2',
                  totalPercentage: 20,
                  optionNo: 'B',
                ),
                AnswerList(
                  color: AvyaasApptheme.option3color,
                  option: 'Answer 3',
                  totalPercentage: 80,
                  optionNo: 'C',
                ),
                AnswerList(
                  color: AvyaasApptheme.option4color,
                  option: 'Answer 4',
                  totalPercentage: 10,
                  optionNo: 'D',
                ),
              ]));

  toggleSelection(int i, int j) {
    quesData[i].correctAns = quesData[i].answerList[j].optionNo;
    quesData[i].showProgress = true;
    notifyListeners();
  }
}

class QuesData {
  final Color tagColor;
  final String subjectTag;
  final String username;
  final String date;
  final String question;
  final String userImage;
  final List<AnswerList> answerList;
  String? correctAns;
  bool? showProgress;

  QuesData(
      {required this.tagColor,
      required this.subjectTag,
      required this.username,
      required this.date,
      required this.question,
      required this.userImage,
      required this.answerList,
      this.correctAns,
      this.showProgress});
}

class AnswerList {
  final Color color;
  final String option;
  final double totalPercentage;
  final String optionNo;

  AnswerList({
    required this.color,
    required this.option,
    required this.totalPercentage,
    required this.optionNo,
  });
}
