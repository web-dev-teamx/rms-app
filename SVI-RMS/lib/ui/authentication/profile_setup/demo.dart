import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder<Widget>(
              future: getTools(),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : snapshot.hasData
                        ? SizedBox(child: snapshot.data)
                        : const Center(
                            child: Text(
                              'No Record Found',
                            ),
                          );
              },
            ),
            FutureBuilder<Widget>(
              future: getSubtools(),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
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
    );
  }

  Future<Widget> getTools() async {
    List<DropdownMenuItem>? dropdownMenuItem = [];
    try {
      await http
          .get(
        Uri.parse(
          "${baseURL}get_profile_other.php?auth_token=$authToken&id=${prefs?.getInt('user_id')}",
        ),
      )
          .then((response) {
        if (jsonDecode(response.body)['code'] == 200) {
          var tools = jsonDecode(response.body)['data']['tools'];
          for (var item in tools) {
            dropdownMenuItem.add(
              DropdownMenuItem(
                child: Text(item['name']),
                value: item['id'],
              ),
            );
          }
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return DropdownButtonFormField<dynamic>(
      items: dropdownMenuItem,
      onChanged: (value) {
        setState(() {
          toolId = value;
        });
      },
    );
  }

  Future<Widget> getSubtools() async {
    List<Widget>? checkList = [];
    bool isChecked = false;
    try {
      await http
          .get(
        Uri.parse(
          "${baseURL}get_subtoolkits.php?auth_token=$authToken&id=${prefs?.getInt('user_id')}&parent_id=$toolId",
        ),
      )
          .then((response) {
        if (jsonDecode(response.body)['code'] == 200) {
          var tools = jsonDecode(response.body)['data'];
          for (var item in tools) {
            checkList.add(
              CheckboxListTile(
                value: isChecked,
                dense: true,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (value) {
                 
                },
                title: Text(
                  item['name'],
                ),
              ),
            );
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
      itemCount: checkList.length,
      itemBuilder: ((context, index) {
        return checkList[index];
      }),
    );
  }
}
