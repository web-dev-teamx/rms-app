// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

import 'dart:io';

import 'package:sv_rms_mobile/model/get_complaints/file_complaint_model.dart';

class FileComplaintScreen extends StatefulWidget {
  const FileComplaintScreen({Key? key}) : super(key: key);
  static const String route = "fileComplaint";
  @override
  _FileComplaintScreenState createState() => _FileComplaintScreenState();
}

class _FileComplaintScreenState extends State<FileComplaintScreen> {
  Dio dio = Dio();
  File? _image;
  final ImagePicker _picker = ImagePicker();
  TextEditingController tilecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const SliverAppBar(
                pinned: true,
                title: Text(
                  "File Complaint",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                actions: [],
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const Text(
                        "File A New Complaint",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: tilecontroller,
                        decoration: const InputDecoration(
                          label: Text("Title"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        maxLines: null,
                        minLines: null,
                        controller: descriptioncontroller,
                        decoration: const InputDecoration(
                          label: Text("Description"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Column(
                          children: [
                            const Text(
                              "You can attach photo with your complaints to get quick response and resolution.",
                              style: TextStyle(),
                            ),
                            ElevatedButton.icon(
                                onPressed: () async {
                                  getImage();
                                },
                                icon: const Icon(
                                  Icons.add_a_photo_outlined,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  "Add Photo",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )),
                            Container(
                                child:
                                    _image != null ? Image.file(_image!) : null)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 80,
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoButton.filled(
                      pressedOpacity: 0.9,
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        _upload(_image!);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future getImage() async {
    final picker = ImagePicker();

    var _pickedFile = await picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50, // <- Reduce Image quality
        maxHeight: 500, // <- reduce the image size
        maxWidth: 500);
    setState(() {
      _image = File(_pickedFile!.path);
    });

    print(_image);
  }

  void _upload(File file) async {
    String fileName = file.path.split('/').last;

    FormData data = FormData.fromMap({
      "id": "2128",
      "auth_token": "0cfc4e21af1504b2c48894b57cbc36b8",
      "title": tilecontroller.text,
      "description": descriptioncontroller.text,
      "picture": await MultipartFile.fromFile(
        file.path,
      ),
    });
    try {
      Dio dio = Dio();
      final Response response = await dio
          .post("https://rmsportal.net/api/process_add_issue.php", data: data);
      if (response.statusCode == 200) {}
    } catch (e) {
      print(e);
    }

    // print(data);

    // dio
    //     .post("https://rmsportal.net/api/process_add_issue.php", data: data)
    //     .then((response) => print(response))
    //     .catchError((error) => print(error));
  }
}
