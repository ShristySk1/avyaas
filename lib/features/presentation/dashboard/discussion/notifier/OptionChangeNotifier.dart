import 'package:flutter/material.dart';

import '../../../../theme/AvyaasAppTheme.dart';
import '../../../widgets/widget_discussion.dart';
import '../../../widgets/widget_option.dart';

class OptionChangeNotifier with ChangeNotifier {
  var listDiscussion = [
    WidgetDiscussion(
      tagColor: AvyaasApptheme.option1color,
      subjectTag: "Physics",
      username: "Test User",
      date: "April 2 2022",
      question: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      widgetOptionList: [
        WidgetOption(
          color: AvyaasApptheme.option1color,
          option: 'Answer 1',
          totalPercentage: 60,
          optionNo: 'A',
        ),
        WidgetOption(
          color: AvyaasApptheme.option2color,
          option: 'Answer 2',
          totalPercentage: 20,
          optionNo: 'B',
        ),
        WidgetOption(
          color: AvyaasApptheme.option3color,
          option: 'Answer 3',
          totalPercentage: 80,
          optionNo: 'B',
        ),
        WidgetOption(
          color: AvyaasApptheme.option4color,
          option: 'Answer 4',
          totalPercentage: 10,
          isChoosen: true,
          optionNo: 'B',
        ),
      ],
      userImage: 'https://via.placeholder.com/350x150',
    ),
    WidgetDiscussion(
      tagColor: AvyaasApptheme.option2color,
      subjectTag: "Chemistry",
      username: "Shristy Shakya",
      date: "April 1 2022",
      question: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      widgetOptionList: [
        WidgetOption(
          color: AvyaasApptheme.option1color,
          option: 'Answer 1',
          totalPercentage: 60,
          isChoosen: true,
          optionNo: 'A',
        ),
        WidgetOption(
          color: AvyaasApptheme.option2color,
          option: 'Answer 2',
          totalPercentage: 20,
          optionNo: 'B',
        ),
        WidgetOption(
          color: AvyaasApptheme.option3color,
          option: 'Answer 3',
          totalPercentage: 80,
          optionNo: 'B',
        ),
        WidgetOption(
          color: AvyaasApptheme.option4color,
          option: 'Answer 4',
          totalPercentage: 10,
          optionNo: 'B',
        ),
      ],
      userImage: 'https://via.placeholder.com/350x150',
    ),
  ];

  toggleSelection(int index) {
    print(index);
    var test = listDiscussion[index];

    test.question = "test";
    test.date = "hghghgh";

    listDiscussion[index] = test;
    notifyListeners();
  }
  //  int index = listDiscussion
  //       .indexWhere((element) => element.question == item.question);
  //   listDiscussion[index].question = "Fff";
  //   notifyListeners();
}
