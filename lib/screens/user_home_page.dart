import 'package:diowan_zkat/screens/add_deserved_addition_page.dart';
import 'package:diowan_zkat/screens/list_deserved_addition_page.dart';
import 'package:diowan_zkat/screens/update_deserved_addition_page.dart';
import 'package:diowan_zkat/tools/app_color.dart';
import 'package:diowan_zkat/tools/push.dart';
import 'package:diowan_zkat/widgets/txt.dart';
import 'package:flutter/material.dart';

import 'report_page.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  final _items = <String>[
    'اضافة مستحق',
    ' جميع المستحقين',
    'تعديل مستحق',
    'التقارير',
  ];
  final _icons = <IconData>[
    Icons.add,
    Icons.list_sharp,
    Icons.edit,
    Icons.print,
  ];

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Txt(
          data: 'الشاشة الرئيسية للمستخدم',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: GridView.builder(
        itemCount: _items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              switch (index) {
                case 0:
                  Push.toPage(context, const AddDeservedAdditionPage());
                  break;
                case 1:
                  Push.toPage(context, const ListDeservedAdditionPage());
                  break;
                case 2:
                  Push.toPage(context, const UpdateDeservedAdditionPage());
                  break;
                case 3:
                  Push.toPage(context, const ReportPage());
                  break;
                default:
              }
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35.0,
                    backgroundColor: Colors.grey.shade100,
                    child: Icon(
                      _icons[index],
                      size: 36.0,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Txt(
                    data: _items[index],
                    fontSize: 20.0,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
