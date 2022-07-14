import 'package:avyaas/features/presentation/dashboard/discussion/notifier/OptionChangeNotifier.dart';
import 'package:avyaas/features/presentation/widgets/widget_discussion.dart';
import 'package:avyaas/features/theme/AvyaasAppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../widgets/widget_option.dart';

class DiscussionPage extends StatefulWidget {
  const DiscussionPage({Key? key}) : super(key: key);

  @override
  State<DiscussionPage> createState() => _DiscussionPageState();
}

class _DiscussionPageState extends State<DiscussionPage> {
  // _updateList(int position) {
  //   setState(() {
  //     // for (int i = 0; i < listDiscussion.length - 1; i++) {
  //     // listDiscussion[0].widgetOptionList[0].isChoosen = true;
  //     // }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Consumer<OptionChangeNotifier>(
              builder: ((context, value, _) {
                return ListView.builder(
                    itemCount: value.listDiscussion.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: value.listDiscussion[index],
                        onTap: () {
                          value.toggleSelection(index);
                        },
                      );
                    });
              }),
            )));
  }
}
