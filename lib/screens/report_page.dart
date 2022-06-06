import 'package:diowan_zkat/widgets/btn.dart';
import 'package:diowan_zkat/widgets/txt.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Txt(data: 'عرض التقارير'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Btn(
              margin: const EdgeInsets.all(10.0),
              title: 'الكل',
              onPressed: () {},
            ),
            Btn(
              margin: const EdgeInsets.all(10.0),
              title: 'مستحق معين',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
