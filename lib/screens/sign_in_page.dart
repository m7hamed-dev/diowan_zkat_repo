import 'package:flutter/material.dart';
import '../tools/app_color.dart';
import '../tools/push.dart';
import '../widgets/btn.dart';
import '../widgets/input.dart';
import '../widgets/txt.dart';
import 'sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo_zkat.jpeg',
              width: double.infinity,
              height: 150.0,
            ),
            const SizedBox(height: 20.0),
            Txt(
              data: 'قم بتسجيل الدخول برقم الجوال',
              fontSize: 14.0,
              color: AppColor.primaryColor,
            ),
            const SizedBox(height: 10.0),
            Input(
              hint: 'رقم الجوال',
              isNumber: true,
              onChange: (value) {},
              prefixIcon: const Padding(
                padding: EdgeInsets.only(top: 13.0, left: 10.0),
                child: Txt(
                  data: '+966',
                  // color: Colors.black,
                ),
              ),
              suffixIcon: const Icon(Icons.phone),
            ),
            Input(
              hint: 'كلمة المرور',
              onChange: (value) {},
              suffixIcon: const Icon(Icons.lock),
            ),
            const SizedBox(height: 5.0),
            Btn(
              title: 'تسجيل دخول',
              onPressed: () async {},
            ),
            const SizedBox(height: 5.9),
            InkWell(
              onTap: () {
                Push.toPage(context, const SignUpPage());
              },
              child: const Txt(
                data: 'ليس لديك حساب ؟',
                fontSize: 14.0,
              ),
            ),
          ].map((e) {
            return Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
              child: e,
              // alignment: Alignment.center,
            );
          }).toList(),
        ),
      ),
    );
  }
}
