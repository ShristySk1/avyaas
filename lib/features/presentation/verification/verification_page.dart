import 'package:avyaas/features/presentation/dashboard/home/home.dart';
import 'package:avyaas/features/presentation/widgets/AppButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../theme/AvyaasAppTheme.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 350,
                        margin: const EdgeInsets.only(top: 25),
                        child: SvgPicture.asset("assets/svg/ic_otp.svg"),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      //Tite Text
                      Text("Verification Code", style: AvyaasApptheme.title),
                      const SizedBox(
                        height: 20,
                      ),
                      //discription
                      Text(
                          "We have sent the code verification to your mobile number",
                          textAlign: TextAlign.center,
                          style: AvyaasApptheme.subtitle),
                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 60),
                            child: PinCodeTextField(
                              appContext: context,
                              // pastedTextStyle: TextStyle(
                              //   color: Colors.green.shade600,
                              //   fontWeight: FontWeight.bold,
                              // ),
                              length: 4,
                              obscureText: false,
                              // obscuringCharacter: '*',
                              // obscuringWidget: const FlutterLogo(
                              //   size: 24,
                              // ),
                              // blinkWhenObscuring: true,
                              animationType: AnimationType.fade,
                              validator: (v) {
                                if (v!.length < 3) {
                                  return null;
                                } else {
                                  return null;
                                }
                              },

                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(8),
                                fieldHeight: 40,
                                fieldWidth: 40,
                                selectedFillColor: AvyaasApptheme.white,
                                selectedColor: AvyaasApptheme.white,
                                activeColor: AvyaasApptheme.white,
                                inactiveColor: AvyaasApptheme.disabledcolor,
                                inactiveFillColor: AvyaasApptheme.disabledcolor,
                                activeFillColor: AvyaasApptheme.white,
                              ),
                              cursorColor: Colors.black,
                              cursorHeight: 20,
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              enableActiveFill: true,
                              // errorAnimationController: errorController,
                              // controller: textEditingController,
                              keyboardType: TextInputType.number,
                              boxShadows: const [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ],
                              onCompleted: (v) {
                                debugPrint("Completed");
                              },
                              // onTap: () {
                              //   print("Pressed");
                              // },
                              onChanged: (value) {
                                debugPrint(value);
                                setState(() {
                                  // currentText = value;
                                });
                              },
                              beforeTextPaste: (text) {
                                debugPrint("Allowing to paste $text");
                                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                return true;
                              },
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppButton(
                          text: "Submit",
                          onLoginClick: () {
                            _goToDasboard();
                          })
                    ],
                  ),
                  Image.asset(
                    "assets/images/companylogo.png",
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _goToDasboard() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}
