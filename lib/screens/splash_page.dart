import 'package:diowan_zkat/screens/sign_in_page.dart';
import 'package:diowan_zkat/tools/app_color.dart';
import 'package:diowan_zkat/widgets/txt.dart';
import 'package:flutter/material.dart';

import '../tools/push.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  ///
  Future<void> _nextPage() async {
    await Future.delayed(const Duration(seconds: 5), () {
      Push.toPage(context, const SignInPage());
    });
  }

  @override
  void initState() {
    _nextPage();
    super.initState();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ///
          Image.asset(
            'assets/logo_zkat.jpeg',
            width: double.infinity,
            height: 300.0,
          ),

          ///
          const Txt(
            data: 'المصارف الثمانية',
            fontSize: 20.0,
          ),
          const SizedBox(height: 40.0),
          Center(
            child: CircularProgressIndicator(
              color: AppColor.primaryColor,
              strokeWidth: 10.0,
            ),
          ),
          const Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Txt(
                data: 'جميع الحقوق محفوظة لمصارف الثمانية',
              ),
              Icon(Icons.copyright),
            ],
          ),
          const SizedBox(height: 10.0),

          ///
        ],
      ),
    );
  }
}
