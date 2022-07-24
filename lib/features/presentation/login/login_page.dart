import 'package:avyaas/features/presentation/widgets/AppButton.dart';
import 'package:avyaas/features/theme/AvyaasAppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../verification/verification_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email, phone;
  final List<String> errors = [];
  void addError({required String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({required String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
  _goToVerifyPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  VerificationPage()),
    );
  }
  Widget userInputPhone(TextEditingController userInput, String hintTitle,
      TextInputType keyboardType) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          // color: Colors.blueGrey.shade100,
          borderRadius: BorderRadius.circular(0)),
      child: Padding(
        padding: const EdgeInsets.only(left: 0.0, right: 0),
        child: Center(
            child: TextFormField(
          // obscure visibility of the password
          obscureText: false,
          controller: userInput,

          onSaved: (newValue) => phone = newValue,
          onChanged: (value) {
            if (value.isNotEmpty && errors.contains('kPassNullError')) {
              removeError(error: 'kPassNullError');
            } else if (value.length >= 8) {
              removeError(error: 'kShortPassError');
            }
            // In case a user removed some characters below the threshold, show alert
            else if (value.length < 8 && value.isNotEmpty) {
              addError(error: 'kShortPassError');
            }
            return null;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              addError(error: 'kPassNullError');
              removeError(error: 'kShortPassError');
              return 'Empty Phone number';
            } else if (value.length < 10 && value.isNotEmpty) {
              addError(error: 'kShortPassError');
              return 'Phone number must contain at least 10 digit';
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,


            hintText: "Enter your phone number",
            // When [FloatingLabelBehavior.always] the label will always float at the top of the field above the content.
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: UnconstrainedBox(
              child: SvgPicture.asset(
                "assets/svg/ic_phone.svg",
                height: 24,
                width: 24,
              ),
            ),
            contentPadding: EdgeInsets.only(
              top: 14.0,
              bottom: 12.0,
              left: 14.0,
              right: 14.0,
            ),
            errorStyle: TextStyle(fontSize: 12, height: 0.2),
            hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.black26,
                fontStyle: FontStyle.normal),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide.none,
            ),

          ),
        )),
      ),
    );
  }

  Widget userInputEmail(TextEditingController userInput, String hintTitle,
      TextInputType keyboardType) {
    return Container(
      height: 50,
      // margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          // color: Colors.blueGrey.shade100,
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.only(left: 0.0, right: 0),
        child: Center(
            child: TextFormField(
          controller: userInput,
          // Requests a keyboard with ready access to the "@" and "." keys.
          keyboardType: TextInputType.emailAddress,
          onSaved: (newValue) => email = newValue,
          onChanged: (value) {
            if (value.isNotEmpty && errors.contains('kEmailNullError')) {
              removeError(error: 'kEmailNullError');
            }
            // else if (emailValidatorRegExp.hasMatch(value)) {
            //   removeError(error: 'kInvalidEmailError');
            // }
            else if (value.isNotEmpty) {
              addError(error: 'kInvalidEmailError');
              return null;
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              addError(error: 'kEmailNullError');
              removeError(error: 'kInvalidEmailError');
              return 'Email Empty';
            } else if (value.isNotEmpty) {
              addError(error: 'kInvalidEmailError');
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.only(
              top: 14.0,
              bottom: 12.0,
              left: 14.0,
              right: 14.0,
            ),
            errorStyle: TextStyle(fontSize: 12, height: 0.2),
            hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.black26,
                fontStyle: FontStyle.normal),
  
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide.none,
            ),
            hintText: "Enter your email",
            // When [FloatingLabelBehavior.always] the label will always float at the top of the field above the content.
            floatingLabelBehavior: FloatingLabelBehavior.never,
            suffixIcon: UnconstrainedBox(
              child: SvgPicture.asset(
                "assets/svg/ic_mail.svg",
                height: 24,
                width: 24,
              ),
            ),
          ),
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/images/applogo.png",
                        height: 80,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Get Started", style: AvyaasApptheme.title),
                          Text("To continue, please enter your use credentials",
                              style: AvyaasApptheme.subtitle),
                          SizedBox(
                            height: 20,
                          ),
                          userInputEmail(emailController, 'Email',
                              TextInputType.emailAddress),
                          userInputPhone(
                              phoneController, 'Phone', TextInputType.phone),
                          SizedBox(
                            height: 40,
                          ),
                          AppButton(text: "Sign Up", onLoginClick: ()=>_goToVerifyPage())
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "assets/images/companylogo.png",
                        height: 24,
                      )
                    ],
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
