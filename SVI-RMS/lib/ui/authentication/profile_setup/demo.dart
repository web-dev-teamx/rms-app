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

  final tableData = <DataRow>[].obs;
  final isChecked = <bool>[].obs;
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
    List<Widget>? checkList = [];
    List<Widget>? tiles = [];
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
          for (var tool in tools) {
            isChecked.value =
                List<bool>.filled(tool['sub_tools'].length, false);
            for (var i = 0; i < tool['sub_tools'].length; i++) {
              checkList.add(
                Obx(
                   () {
                    return CheckboxListTile(
                      title: Text(tool['sub_tools'][i]['name']),
                      value: isChecked[i],
                      onChanged: (val) {
                        isChecked[i] = val!;
                        print(i.toString()+isChecked[i].toString());
                      },
                    );
                  }
                ),
              );
            }
            tiles.add(
              ExpansionTile(
                title: Text(tool['name']),
                children: List.generate(
                  checkList.length,
                  (index) {
                    return checkList[index];
                  },
                ),
              ),
            );
            checkList.clear();
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
      itemCount: tiles.length,
      itemBuilder: (context, index) {
        return tiles[index];
      },
    );
  }
}
