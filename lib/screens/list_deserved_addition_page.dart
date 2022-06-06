import 'dart:convert';

import 'package:diowan_zkat/models/post_model.dart';
import 'package:diowan_zkat/screens/add_deserved_addition_page.dart';
import 'package:diowan_zkat/tools/app_color.dart';
import 'package:diowan_zkat/tools/push.dart';
import 'package:diowan_zkat/widgets/btn.dart';
import 'package:diowan_zkat/widgets/input.dart';
import 'package:flutter/material.dart';
import '../widgets/txt.dart';
import 'package:http/http.dart' as http;

///
class ListDeservedAdditionPage extends StatefulWidget {
  const ListDeservedAdditionPage({Key? key}) : super(key: key);

  @override
  State<ListDeservedAdditionPage> createState() =>
      _ListDeservedAdditionPageState();
}

class _ListDeservedAdditionPageState extends State<ListDeservedAdditionPage> {
  List<PostModel> _post = [];
  List<PostModel> _searchPost = [];
  bool _isLoading = true;

  ///
  Future _addDeserved() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final _body = {};
    var _response = await http.post(url, body: json.encode(_body));
    if (_response.statusCode == 201) {}
  }

  ///
  Future _deleteDeserved() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final _body = {};
    var _response = await http.delete(url, body: json.encode(_body));
    if (_response.statusCode == 201) {}
  }

  Future _getDeserved() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var _response = await http.get(url);
    if (_response.statusCode == 200) {
      final _json = jsonDecode(_response.body) as List;
      final _data = _json.map((e) {
        return PostModel.fromJson(e);
      }).toList();
      _searchPost = _post = _data;
      _isLoading = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    _getDeserved();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Txt(
          data: 'شاشة قائمة المستحقين',
          color: Colors.white,
          // fontSize: 20.0,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Push.toPage(context, const AddDeservedAdditionPage());
            },
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              ),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Input(
                    hint: 'ابحث عن مستحق',
                    suffixIcon: Icon(
                      Icons.search_rounded,
                      color: AppColor.primaryColor,
                    ),
                    onChange: (value) {
                      //
                      _searchPost = value.isEmpty
                          ? _post
                          : _post.where((element) {
                              if (element.title.contains(value)) {
                                return true;
                              }
                              return false;
                            }).toList();
                      //
                      setState(() {});
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _searchPost.length,
                    itemBuilder: (context, index) {
                      ///
                      return Card(
                        elevation: 5.0,
                        margin: const EdgeInsets.all(10.0),
                        child: ExpansionTile(
                          expandedAlignment: Alignment.centerLeft,
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          childrenPadding: const EdgeInsets.all(10.0),
                          leading: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit),
                          ),
                          title: Txt(
                            data: _searchPost[index].title,
                            fontSize: 18.9,
                          ),
                          children: [
                            Txt(
                              data: _searchPost[index].body,
                              fontSize: 14.9,
                              color: Colors.grey,
                            ),
                            Btn(
                              margin: const EdgeInsets.all(10.0),
                              title: 'حذف',
                              onPressed: () {},
                            ),
                          ],
                        ),
                      );
                      // return Card(
                      //   elevation: 10.0,
                      //   child: ListTile(
                      //     leading: IconButton(
                      //       icon: const Icon(
                      //         Icons.delete_outline_rounded,
                      //         color: Colors.red,
                      //       ),
                      //       onPressed: () {
                      //         CustomDialog.dialog(
                      //             context,
                      //             const Txt(data: 'are you sure to delete ??'),
                      //             Row(
                      //               children: [
                      //                 Expanded(
                      //                   child: Btn(
                      //                     title: 'no',
                      //                     onPressed: () {},
                      //                   ),
                      //                 ),
                      //                 const SizedBox(width: 10.0),
                      //                 Expanded(
                      //                   child: Btn(
                      //                     title: 'no',
                      //                     onPressed: () {},
                      //                   ),
                      //                 ),
                      //               ],
                      //             ));
                      //       },
                      //     ),
                      //     title: Txt(
                      //       data: _post[index].title,
                      //       fontSize: 18.9,
                      //     ),
                      //     subtitle: Txt(
                      //       data: _post[index].body,
                      //       fontSize: 14.9,
                      //     ),
                      //     trailing: IconButton(
                      //       onPressed: () {},
                      //       icon: const Icon(Icons.edit),
                      //     ),
                      //   ),
                      // );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
