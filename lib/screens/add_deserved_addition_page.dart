import 'package:diowan_zkat/tools/custom_dialog.dart';
import 'package:flutter/material.dart';
import '../widgets/btn.dart';
import '../widgets/input.dart';
import '../widgets/txt.dart';

class AddDeservedAdditionPage extends StatefulWidget {
  const AddDeservedAdditionPage({Key? key}) : super(key: key);

  @override
  State<AddDeservedAdditionPage> createState() =>
      _AddDeservedAdditionPageState();
}

class _AddDeservedAdditionPageState extends State<AddDeservedAdditionPage> {
  String _selectedValue = '';
  String _name = '', _amount = '', _cardNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Txt(
          data: 'شاشة اضافة مستحق جديد',
          color: Colors.white,
          // fontSize: 20.0,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.90),
        children: [
          Input(
            hint: 'اسم المستحق',
            isNumber: true,
            onChange: (value) {
              _name = value;
            },
            suffixIcon: const Icon(Icons.person),
          ),
          const SizedBox(height: 10.0),
          const Align(
            alignment: Alignment.centerRight,
            child: Txt(
              data: 'نوع الحالة',
            ),
          ),
          const SizedBox(height: 10.0),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: DropdownButton<String>(
                isDense: true,
                isExpanded: true,
                underline: const SizedBox(),

                hint: Txt(data: _selectedValue),
                items: <String>[
                  'يتيم',
                  'ارمل',
                  'احتياجات خاصة',
                  'تكافل اجتماعي',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Txt(data: value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  _selectedValue = newValue ?? '';
                  setState(() {});
                },
                // value: _selectedValue,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Input(
            hint: 'الاستحقاقات الشهرية',
            isNumber: true,
            onChange: (value) {
              _amount = value;
            },
            suffixIcon: const Icon(Icons.attach_money_rounded),
          ),
          const SizedBox(height: 10.0),
          Input(
            hint: 'رقم الحساب',
            isNumber: true,
            onChange: (value) {
              _cardNumber = value;
            },
            suffixIcon: const Icon(Icons.numbers_rounded),
          ),
          const SizedBox(height: 10.0),
          Btn(
            title: 'اضافة',
            onPressed: () {
              /// validations
              if (_amount.isEmpty || _name.isEmpty || _cardNumber.isEmpty) {
                return CustomDialog.dialog(
                  context,
                  const Txt(
                    data: 'all fields are required !!',
                  ),
                  Btn(
                    title: 'ok',
                    color: Colors.red.shade300,
                    onPressed: () {
                      CustomDialog.closeDialog(context);
                    },
                  ),
                );
              }

              ///
            },
          ),
        ],
      ),
    );
  }
}
