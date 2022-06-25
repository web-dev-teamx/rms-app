import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sv_rms_mobile/blocs/services_bloc.dart';
import 'package:sv_rms_mobile/model/get_vendor_detail/education/education.dart';
import 'package:sv_rms_mobile/model/get_vendor_detail/vendor_attachment/vendor_attachment.dart';
import 'package:sv_rms_mobile/model/get_vendor_detail/vendor_certificate/vendor_certificate.dart';

class MyAttachmentsScreen extends StatefulWidget {
  final List<VendorCertificate?> certificates;
  final List<Education?> education;
  final List<VendorAttachment?> vendorAttachments;
  const MyAttachmentsScreen({
    Key? key,
    required this.certificates,
    required this.education,
    required this.vendorAttachments,
  }) : super(key: key);
  static const String route = "attachmentsScreen";
  @override
  _MyAttachmentsScreenState createState() => _MyAttachmentsScreenState();
}

class _MyAttachmentsScreenState extends State<MyAttachmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ServicesBloc>(
        builder: (context, value, _) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const SliverAppBar(
                pinned: true,
                centerTitle: true,
                title: Text(
                  "My Attachments",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Educational Attachments",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return AttachmentTile(
                        // label: "Enginering Degree",
                        label: widget.education[index]!.name,
                        location: widget.education[index]!.location,
                        fileName: widget.education[index]!.educationFile,
                        // location: "Karachi, Pakistan",
                        // fileName: "degree_university.pdf",
                      );
                    },
                    childCount: widget.education.length,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Certificate Attachments",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return AttachmentTile(
                        label: widget.certificates[index]!.name,
                        fileName: widget.certificates[index]!.certificateFile,
                        // label: "PMP Certification",
                        // fileName: "pmp_certificate.pdf",
                      );
                    },
                    childCount: widget.certificates.length,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Vendor Attachments",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return AttachmentTile(
                          label: widget.vendorAttachments[index]!.name,
                          fileName:
                              widget.vendorAttachments[index]!.attachmentFile

                          // label: "NDA File",
                          // fileName: "nda_mutal.pdf",
                          );
                    },
                    childCount: widget.vendorAttachments.length,
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 80)),
            ],
          );
        },
      ),
    );
  }
}

class AttachmentTile extends StatelessWidget {
  const AttachmentTile({
    Key? key,
    required this.label,
    this.location,
    required this.fileName,
  }) : super(key: key);
  final String? label, location, fileName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(
                    Icons.attachment_rounded,
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 120,
                    child: Text(
                      "Name:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    label ?? "",
                    style: const TextStyle(),
                  ),
                ],
              ),
              location == null
                  ? Container()
                  : Row(
                      children: [
                        const SizedBox(
                          width: 120,
                          child: Text(
                            "Location:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          location ?? "",
                          style: const TextStyle(),
                        ),
                      ],
                    ),
              Row(
                children: [
                  const SizedBox(
                    width: 120,
                    child: Text(
                      "File Name:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      fileName ?? "",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
