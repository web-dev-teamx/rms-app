import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:sv_rms_mobile/main.dart';
import 'package:sv_rms_mobile/services/base_services.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);
  static const String route = "demo";

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  String? toolId;
  final _expanded = false.obs;

  List<Map<String, dynamic>>? checkList = [];
  final tableData = <DataRow>[].obs;
  final isChecked = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              FutureBuilder<Widget>(
                future: getTools(),
                builder: (context, snapshot) {
                  return snapshot.connectionState == ConnectionState.waiting
                      ? const Center()
                      : snapshot.hasData
                          ? SizedBox(child: snapshot.data)
                          : const Center(
                              child: Text(
                                'No Record Found',
                              ),
                            );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Widget> getTools() async {
    List<Widget>? dropdownMenuItem = [];
    List<ExpansionPanel>? checkList = [];
    try {
      await http
          .get(
        Uri.parse(
          "${baseURL}get_profile_other.php?auth_token=$authToken&id=${prefs?.getInt('user_id')}",
        ),
      )
          .then((parent) async {
        if (jsonDecode(parent.body)['code'] == 200) {
          var tools = jsonDecode(parent.body)['data']['tools'];
          for (var parentItems in tools) {
            try {
              await http
                  .get(
                Uri.parse(
                  "${baseURL}get_subtoolkits.php?auth_token=$authToken&id=${prefs?.getInt('user_id')}&parent_id=${parentItems['id']}",
                ),
              )
                  .then((child) {
                if (jsonDecode(child.body)['code'] == 200) {
                  var tools = jsonDecode(child.body)['data'];
                  dropdownMenuItem.add(
                    ExpansionPanelList(
                      animationDuration: const Duration(milliseconds: 2000),
                      children: [
                        ExpansionPanel(
                          headerBuilder: (context, isExpanded) {
                            return const ListTile(
                              title: Text(
                                'Click To Expand',
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          },
                          body: const ListTile(
                            title: Text('Description text',
                                style: TextStyle(color: Colors.black)),
                          ),
                          isExpanded: _expanded.value,
                          canTapOnHeader: true,
                        ),
                      ],
                      dividerColor: Colors.grey,
                      expansionCallback: (panelIndex, isExpanded) {
                        _expanded.value = !_expanded.value;
                      },
                    ),
                  );
                }
              });
            } catch (e) {
              if (kDebugMode) {
                print(e);
              }
            }
          }
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: dropdownMenuItem.length,
      itemBuilder: (context, index) {
        return dropdownMenuItem[index];
      },
    );
  }
}
