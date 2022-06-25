import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sv_rms_mobile/blocs/services_bloc.dart';
import 'package:sv_rms_mobile/model/get_vendor_detail/basic_info/basic_info.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({
    Key? key,
    this.basicInfo,
  }) : super(key: key);

  final BasicInfo? basicInfo;

  static const String route = "aboutMeScreen";
  @override
  _AboutMeScreenState createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  late TextEditingController _dobController;
  late TextEditingController _contactNoController;
  late TextEditingController _phoneNoController;
  late TextEditingController _whatsappNoController;
  late TextEditingController _emailController;
  late TextEditingController _skypeNameController;
  late TextEditingController _regTaxNoController;
  late TextEditingController _houseNoController;
  late TextEditingController _streetNameController;
  late TextEditingController _cityController;
  late TextEditingController _countryController;
  late TextEditingController _provinceController;
  late TextEditingController _postalcodeController;

  @override
  void initState() {
    _dobController = TextEditingController(text: widget.basicInfo?.dob);
    _contactNoController =
        TextEditingController(text: widget.basicInfo?.contactNumberSecondary);
    _phoneNoController =
        TextEditingController(text: widget.basicInfo?.phoneNumberLandline);
    _whatsappNoController =
        TextEditingController(text: widget.basicInfo?.whatsappContactNumber);
    _emailController =
        TextEditingController(text: widget.basicInfo?.emailAddress);
    _skypeNameController =
        TextEditingController(text: widget.basicInfo?.skypeid);
    _regTaxNoController =
        TextEditingController(text: widget.basicInfo?.nationalId);
    _houseNoController =
        TextEditingController(text: widget.basicInfo?.houseNumber);
    _streetNameController =
        TextEditingController(text: widget.basicInfo?.streetNumber);
    _cityController = TextEditingController(text: widget.basicInfo?.city);
    _countryController = TextEditingController(text: widget.basicInfo?.country);
    _provinceController = TextEditingController(text: widget.basicInfo?.province);
    _postalcodeController = TextEditingController(text: widget.basicInfo?.postalCode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ServicesBloc>(builder: (context, value, _) {
        return FutureBuilder(
            future: value.getVendorDetails(id: "2128"),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    const SliverAppBar(
                      pinned: true,
                      centerTitle: true,
                      title: Text(
                        "About",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Personal Information",
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
                        delegate: SliverChildListDelegate(
                          [
                            TextField(
                              controller: _dobController,
                              decoration: const InputDecoration(
                                label: Text("Date of birth"),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              controller: _contactNoController,
                              decoration: const InputDecoration(
                                label: Text("Contact Number(Secondary)"),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              controller: _phoneNoController,
                              decoration: const InputDecoration(
                                label: Text("Phone Number (Landline):"),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              controller: _whatsappNoController,
                              decoration: const InputDecoration(
                                label: Text("Whatsapp Contact Number"),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                suffixIcon: Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                                label: Text("Email Address"),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              controller: _skypeNameController,
                              decoration: const InputDecoration(
                                label: Text("Skype ID"),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              controller: _regTaxNoController,
                              decoration: const InputDecoration(
                                label: Text(
                                    "Registration Or Tax Number National ID"),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              controller: _houseNoController,
                              decoration: const InputDecoration(
                                label: Text("House Number"),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              controller: _streetNameController,
                              decoration: const InputDecoration(
                                label: Text("Street"),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              controller: _cityController,
                              decoration: const InputDecoration(
                                label: Text("City"),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              controller: _countryController,
                              decoration: const InputDecoration(
                                label: Text("Country"),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              controller: _provinceController,
                              decoration: const InputDecoration(
                                label: Text("Province"),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              controller: _postalcodeController,
                              decoration: const InputDecoration(
                                label: Text("Postal Code"),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 80,
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            });
      }),
    );
  }
}
