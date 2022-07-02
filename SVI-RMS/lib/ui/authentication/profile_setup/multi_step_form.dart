import 'dart:ui';

import 'package:cool_stepper/cool_stepper.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';

class MultiStepForm extends StatefulWidget {
  const MultiStepForm({Key? key}) : super(key: key);
  static const String route = "profileSetup";

  @override
  State<MultiStepForm> createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  final _formKey = GlobalKey<FormState>();
  CountryCode? countryCode;
  static List<String> languageList = [''];

  TextEditingController? _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final steps = [
      CoolStep(
        isHeaderEnabled: false,
        title: '',
        subtitle: '',
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50,
                child: Icon(
                  Icons.person,
                  size: 36,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.edit,
                      size: 16,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Choose Profile",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 70,
                child: Material(
                  //color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        label: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'First Name',
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 16,
                                ),
                              ),
                              const TextSpan(
                                text: ' *',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontFeatures: [
                                    FontFeature.enable('sups'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 2,
              ),
              SizedBox(
                height: 70,
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        label: Text(
                          'Middle Name',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 2,
              ),
              SizedBox(
                height: 70,
                child: Material(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        label: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Last Name',
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 16,
                                ),
                              ),
                              const TextSpan(
                                text: ' *',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontFeatures: [
                                    FontFeature.enable('sups'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 70,
                child: Material(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        label: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Vendor Type',
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 16,
                                ),
                              ),
                              const TextSpan(
                                text: ' *',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontFeatures: [
                                    FontFeature.enable('sups'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 2,
              ),
              SizedBox(
                height: 70,
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        label: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Registration Date',
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 16,
                                ),
                              ),
                              const TextSpan(
                                text: ' *',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontFeatures: [
                                    FontFeature.enable('sups'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        prefixIconConstraints:
                            const BoxConstraints(minHeight: 50, minWidth: 50),
                        prefixIcon: const Icon(FontAwesome5.calendar_alt),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 2,
              ),
              SizedBox(
                height: 70,
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIconConstraints:
                            const BoxConstraints(minHeight: 50, minWidth: 50),
                        prefixIcon: const Icon(FontAwesome5.slack_hash),
                        label: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Registration Or Tax Number',
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 16,
                                ),
                              ),
                              const TextSpan(
                                text: ' *',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontFeatures: [
                                    FontFeature.enable('sups'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 2,
              ),
              SizedBox(
                height: 70,
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIconConstraints:
                            const BoxConstraints(minHeight: 50, minWidth: 50),
                        prefixIcon: const Icon(FontAwesome5.home),
                        label: Text(
                          'Full Registered Address',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 2,
              ),
              SizedBox(
                height: 70,
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIconConstraints:
                            const BoxConstraints(minHeight: 50, minWidth: 50),
                        prefixIcon: const Icon(MfgLabs.globe_inv),
                        label: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'City, Country',
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 16,
                                ),
                              ),
                              const TextSpan(
                                text: ' *',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontFeatures: [
                                    FontFeature.enable('sups'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 2,
              ),
              SizedBox(
                height: 70,
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIconConstraints:
                            const BoxConstraints(minHeight: 50, minWidth: 50),
                        prefixIcon: const Icon(FontAwesome5.slack_hash),
                        label: Text(
                          'House Number & Street',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 2,
              ),
              SizedBox(
                height: 70,
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIconConstraints:
                            const BoxConstraints(minHeight: 50, minWidth: 50),
                        prefixIcon: const Icon(Icons.location_city),
                        label: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'City',
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 16,
                                ),
                              ),
                              const TextSpan(
                                text: ' *',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontFeatures: [
                                    FontFeature.enable('sups'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 2,
              ),
              SizedBox(
                height: 70,
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        label: Text(
                          'Province & Postal Code',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 2,
              ),
              SizedBox(
                height: 70,
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        label: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Country',
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 16,
                                ),
                              ),
                              const TextSpan(
                                text: ' *',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontFeatures: [
                                    FontFeature.enable('sups'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 2,
              ),
              SizedBox(
                height: 70,
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 0,
                          child: CountryCodePicker(
                            initialSelection: 'PK',
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Provide Your Conatact Number";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              label: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Contact Number(Primary)',
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontFeatures: [
                                          FontFeature.enable('sups'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 2,
              ),
              SizedBox(
                height: 70,
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 0,
                          child: CountryCodePicker(
                            initialSelection: 'PK',
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Provide Your Conatact Number";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Contact Number(Seconday)',
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontFeatures: [
                                          FontFeature.enable('sups'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 2,
              ),
              SizedBox(
                height: 70,
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIconConstraints:
                            const BoxConstraints(minHeight: 50, minWidth: 50),
                        prefixIcon: const Icon(Icons.phone),
                        label: Text(
                          'Phone Number (Landline)',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 2,
              ),
              SizedBox(
                height: 70,
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 0,
                          child: CountryCodePicker(
                            initialSelection: 'PK',
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Provide Your Conatact Number";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              label: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Whatsapp Contact Number',
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontFeatures: [
                                          FontFeature.enable('sups'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 2,
              ),
              SizedBox(
                height: 70,
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIconConstraints:
                            const BoxConstraints(minHeight: 50, minWidth: 50),
                        prefixIcon: const Icon(Icons.email),
                        label: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Email Address',
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 16,
                                ),
                              ),
                              const TextSpan(
                                text: ' *',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontFeatures: [
                                    FontFeature.enable('sups'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 2,
              ),
              SizedBox(
                height: 70,
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIconConstraints:
                            const BoxConstraints(minHeight: 50, minWidth: 50),
                        prefixIcon: const Icon(FontAwesome5.skype),
                        label: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Skype ID',
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 16,
                                ),
                              ),
                              const TextSpan(
                                text: ' *',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontFeatures: [
                                    FontFeature.enable('sups'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 2,
              ),
              ...getLanguages(),
              const Divider(
                height: 2,
              ),
              SizedBox(
                height: 70,
                child: Material(
                  // color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIconConstraints:
                            const BoxConstraints(minHeight: 50, minWidth: 50),
                        prefixIcon: const Icon(Icons.my_location),
                        label: Text(
                          'Current Based Country & Location',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        isHeaderEnabled: false,
        title: '',
        subtitle: '',
        content: Row(
          children: const <Widget>[],
        ),
        validation: () {
          return null;
        },
      ),
    ];

    final stepper = CoolStepper(
      showErrorSnackbar: false,
      onCompleted: () {},
      steps: steps,
      config: const CoolStepperConfig(
        backText: 'Back',
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: stepper,
      ),
    );
  }

  List<Widget> getLanguages() {
    List<Widget> friendsTextFields = [];
    for (int i = 0; i < languageList.length; i++) {
      friendsTextFields.add(Material(
        child: Row(
          children: [
            Expanded(
              child: LanguagesFields(index: i),
            ),
            const SizedBox(
              width: 16,
            ),
            // we need add button at last friends row
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _addRemoveButton(i == languageList.length - 1, i),
            ),
          ],
        ),
      ));
    }
    return friendsTextFields;
  }

  /// add / remove button
  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          // add new text-fields at the top of all friends textfields
          languageList.insert(0, '');
        } else {
          languageList.removeAt(index);
        }
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}

class LanguagesFields extends StatefulWidget {
  final int index;

  const LanguagesFields({Key? key, required this.index}) : super(key: key);
  @override
  _LanguagesFieldsState createState() => _LanguagesFieldsState();
}

class _LanguagesFieldsState extends State<LanguagesFields> {
  String? nameController;

  @override
  void initState() {
    super.initState();
    nameController = '';
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      nameController = _MultiStepFormState.languageList[widget.index];
    });

    return DropdownButtonFormField(
      items: const [
        DropdownMenuItem(
          child: Text('English'),
          value: 'English',
        ),
        DropdownMenuItem(
          child: Text('Spanish'),
          value: 'Spanish',
        ),
        DropdownMenuItem(
          child: Text('French'),
          value: 'French',
        ),
        DropdownMenuItem(
          child: Text('Italian'),
          value: 'Italian',
        ),
        DropdownMenuItem(
          child: Text('Russian'),
          value: 'Russian',
        ),
      ],
      onChanged: (v) =>
          _MultiStepFormState.languageList[widget.index] = v.toString(),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIconConstraints:
            const BoxConstraints(minHeight: 50, minWidth: 50),
        prefixIcon: const Icon(Entypo.language),
        label: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Language',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 16,
                ),
              ),
              const TextSpan(
                text: ' *',
                style: TextStyle(
                  color: Colors.red,
                  fontFeatures: [
                    FontFeature.enable('sups'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      validator: (String? v) {
        if (v!.isEmpty) {
          return 'Please enter something';
        }
        return null;
      },
    );
  }
}
