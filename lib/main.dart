import 'package:avyaas/features/presentation/dashboard/discussion/discussion.dart';
import 'package:avyaas/features/presentation/dashboard/discussion/notifier/OptionChangeNotifier.dart';
import 'package:avyaas/features/presentation/onboard/OnboardScreen.dart';
import 'package:avyaas/features/theme/AvyaasAppTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/navigation/locator.dart';
import 'core/navigation/navigation.dart';
import 'features/presentation/dashboard/main_page.dart';
import 'features/presentation/widgets/widget_discussion.dart';

void main() async {
  await LocatorInjector.setupLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<OptionChangeNotifier>(
          create: (_) => OptionChangeNotifier()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // navigatorKey: locator<NavigatorService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AvyaasApptheme.light,
      home: OnboardScreen(),
    );
  }
}
