// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:cool_stepper_reloaded/cool_stepper_reloaded.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sv_rms_mobile/main.dart';
import 'package:sv_rms_mobile/utils/app_theme.dart';
import 'package:text_chip_field/text_chip_field.dart';
import 'package:geolocator/geolocator.dart';

const kGoogleApiKey = "AIzaSyDxG0RL36UO7jWJ2vXQGHUk8O4qakRafzE";

class MultiStepForm extends StatefulWidget {
  const MultiStepForm({Key? key}) : super(key: key);
  static const String route = "profileSetup";

  @override
  State<MultiStepForm> createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  final _formKey = GlobalKey<FormState>();
  CountryCode? countryCode;
  static List<Map<String, dynamic>> languageList = [{}];
  static List<String> uploadList = [''];

  TextEditingController? _firstNameController;
  TextEditingController? _middleNameController;
  TextEditingController? _lastNameController;
  TextEditingController? _locationController;
  TextEditingController? _cityCountryController;
  TextEditingController? _cityController;
  TextEditingController? _counrtyController;
  TextEditingController? _currentLocationController;
  TextEditingController? _registrationDateController;
  TextEditingController? _vendorTypeController;
  TextEditingController? _nationalIDController;
  TextEditingController? _houseStreetController;
  TextEditingController? _provincePostalCodeController;
  TextEditingController? _contactNumberPrimaryController;
  TextEditingController? _contactNumberSecondaryController;
  TextEditingController? _phoneNumberLandlineController;
  TextEditingController? _whatsappContactNumberController;
  TextEditingController? _emailAddressController;
  TextEditingController? _skypeIdController;
  final homeScaffoldKey = GlobalKey<ScaffoldMessengerState>();
  var imagePath;
  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 730)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        _registrationDateController = TextEditingController(
            text: DateFormat('dd-MM-yyyy').format(picked).toString());
        selectedDate = picked;
        prefs!.setString('registration_date',
            DateFormat('dd-MM-yyyy').format(picked).toString());
      });
    }
  }

  @override
  void initState() {
    super.initState();
    imagePath = prefs!.getString('profile_image');
    _locationController =
        TextEditingController(text: prefs!.getString('location') ?? '');
    _cityCountryController =
        TextEditingController(text: prefs!.getString('city_country') ?? '');
    _cityController =
        TextEditingController(text: prefs!.getString('city') ?? '');
    _counrtyController =
        TextEditingController(text: prefs!.getString('country') ?? '');
    _currentLocationController = TextEditingController(
        text: prefs!.getString('current_location_country') ?? '');
    _registrationDateController = TextEditingController(
        text: prefs!.getString('registration_date') ?? '');
    _nationalIDController =
        TextEditingController(text: prefs!.getString('national_id') ?? '');
    _houseStreetController =
        TextEditingController(text: prefs!.getString('house_number') ?? '');
    _provincePostalCodeController =
        TextEditingController(text: prefs!.getString('postal_code') ?? '');
    _contactNumberPrimaryController = TextEditingController(
        text: prefs!.getString('contact_number_primary') ?? '');
    _contactNumberSecondaryController = TextEditingController(
        text: prefs!.getString('contact_number_secondary') ?? '');
    _phoneNumberLandlineController = TextEditingController(
        text: prefs!.getString('phone_number_landline') ?? '');
    _whatsappContactNumberController = TextEditingController(
        text: prefs!.getString('whatsapp_contact_number') ?? '');
    _emailAddressController =
        TextEditingController(text: prefs!.getString('email_address') ?? '');
    _skypeIdController =
        TextEditingController(text: prefs!.getString('skypeid') ?? '');
    _firstNameController =
        TextEditingController(text: prefs!.getString('first_name') ?? '');
    _middleNameController =
        TextEditingController(text: prefs!.getString('middle_name') ?? '');
    _lastNameController =
        TextEditingController(text: prefs!.getString('last_name') ?? '');
    _vendorTypeController = TextEditingController(
        text: prefs!.getString('vendor_type') == '1'
            ? 'Individual Consultant'
            : prefs!.getString('vendor_type') == '2'
                ? 'Recuiter Consultant'
                : 'Company');
  }

  @override
  Widget build(BuildContext context) {
    final steps = [
      CoolStep(
        title: 'Personal Information',
        subtitle:
            'Your profile is not submited yet, please fill all the required filed in this form in order to submit',
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50,
                backgroundImage: imagePath != null
                    ? Image.file(
                        File(imagePath!),
                        fit: BoxFit.fill,
                      ).image
                    : Image.asset(
                        'assets/images/profile.png',
                        fit: BoxFit.fill,
                      ).image,
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
                  await ImagePicker()
                      .pickImage(source: ImageSource.gallery)
                      .then((value) {
                    if (value != null) {
                      setState(() {
                        imagePath = value.path;
                        prefs!.setString('profile_image', value.path);
                      });
                    }
                  });
                },
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
              Material(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: TextFormField(
                    controller: _firstNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your first name';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      prefs!.setString('first_name', value);
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
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
              const Divider(
                height: 2,
              ),
              Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: TextFormField(
                    controller: _middleNameController,
                    onChanged: (value) {
                      prefs!.setString('middle_name', value);
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
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
              const Divider(
                height: 2,
              ),
              Material(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: TextFormField(
                    controller: _lastNameController,
                    onChanged: (value) {
                      prefs!.setString('last_name', value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your last name';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
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
              const SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: TextFormField(
                    controller: _vendorTypeController,
                    readOnly: true,
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'please select vendor type';
                    //   } else {
                    //     return null;
                    //   }
                    // },
                    onChanged: (value) {
                      prefs!.setString('vendor_type', value);
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
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
              const Divider(
                height: 2,
              ),
              Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _registrationDateController,
                    readOnly: true,
                    onTap: () => selectDate(context),
                    onChanged: (value) {
                      prefs!.setString('registration_date', value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '\t\t\t\tplease select registration date';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      isDense: true,
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
              const Divider(
                height: 2,
              ),
              Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _nationalIDController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '\t\t\t\tplease enter registration or tax No.';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      prefs!.setString('national_id', value);
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      isDense: true,
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
              const Divider(
                height: 2,
              ),
              Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    readOnly: true,
                    controller: _locationController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    onTap: () async {
                      var place = await PlacesAutocomplete.show(
                          context: context,
                          apiKey: kGoogleApiKey,
                          mode: Mode.overlay,
                          types: ['administrative_area_level_3'],
                          strictbounds: false,
                          components: [
                            Component(Component.country, 'pk'),
                            Component(Component.country, 'in'),
                          ],
                          onError: (err) {});

                      if (place != null) {
                        setState(() {
                          _locationController = TextEditingController(
                              text: place.description.toString());

                          prefs!.setString(
                              'location', place.description.toString());
                        });
                        final plist = GoogleMapsPlaces(
                          apiKey: kGoogleApiKey,
                          apiHeaders:
                              await const GoogleApiHeaders().getHeaders(),
                        );
                        String placeid = place.placeId ?? "0";
                        final detail = await plist.getDetailsByPlaceId(placeid);

                        final geometry = detail.result.geometry!.location;
                        final cityCountry = detail.result.formattedAddress
                            .toString()
                            .split(',');
                        setState(() {
                          prefs!.setString(
                              'city_country_lat', geometry.lat.toString());
                          prefs!.setString(
                              'city_country_lng', geometry.lng.toString());
                          prefs!.setString(
                              'city_country',
                              cityCountry.first.toString() +
                                  ', ' +
                                  cityCountry.last.toString());
                          prefs!
                              .setString('city', cityCountry.first.toString());
                          prefs!.setString(
                              'country', cityCountry.last.toString());
                          _cityController = TextEditingController(
                              text: cityCountry.first.toString());
                          _counrtyController = TextEditingController(
                              text: cityCountry.last.toString());
                          _cityCountryController = TextEditingController(
                              text: cityCountry.first.toString() +
                                  ', ' +
                                  cityCountry.last.toString());
                        });
                      }
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      prefixIconConstraints:
                          const BoxConstraints(minHeight: 50, minWidth: 50),
                      contentPadding: const EdgeInsets.only(right: 20.0),
                      prefixIcon: const Icon(
                        FontAwesome5.home,
                        size: 20,
                      ),
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
              const Divider(
                height: 2,
              ),
              Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '\t\t\t\tplease enter city, country name';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      prefs!.setString('city_country', value);
                    },
                    controller: _cityCountryController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
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
              const Divider(
                height: 2,
              ),
              Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _houseStreetController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      prefs!.setString('house_number', value);
                    },
                    decoration: InputDecoration(
                      isDense: true,
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
              const Divider(
                height: 2,
              ),
              Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '\t\t\t\tplease enter city name';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      prefs!.setString('city', value);
                    },
                    controller: _cityController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
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
              const Divider(
                height: 2,
              ),
              Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _provincePostalCodeController,
                    onChanged: (value) {
                      prefs!.setString('postal_code', value);
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
                      prefixIconConstraints:
                          const BoxConstraints(minHeight: 50, minWidth: 50),
                      prefixIcon: const Icon(
                        FontAwesome5.map_marked_alt,
                        size: 20,
                      ),
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
              const Divider(
                height: 2,
              ),
              Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '\t\t\t\tplease enter country name';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      prefs!.setString('country', value);
                    },
                    controller: _counrtyController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
                      prefixIconConstraints:
                          const BoxConstraints(minHeight: 50, minWidth: 50),
                      prefixIcon: const Icon(MfgLabs.globe),
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
              const Divider(
                height: 2,
              ),
              Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 0,
                        child: CountryCodePicker(
                          onChanged: (value) {
                            prefs!.setString(
                                'primary_country_code', value.toString());
                          },
                          initialSelection: 'PK',
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: _contactNumberPrimaryController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please provide your conatact number";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            prefs!.setString('contact_number_primary', value);
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            isDense: true,
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
              const Divider(
                height: 2,
              ),
              Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 0,
                        child: CountryCodePicker(
                          onChanged: (value) {
                            prefs!.setString(
                                'secondary_country_code', value.toString());
                          },
                          initialSelection: 'PK',
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: _contactNumberSecondaryController,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please provide your conatact number";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            prefs!.setString('contact_number_secondary', value);
                          },
                          decoration: InputDecoration(
                            isDense: true,
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
              const Divider(
                height: 2,
              ),
              Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _phoneNumberLandlineController,
                    onChanged: (value) {
                      prefs!.setString('phone_number_landline', value);
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      isDense: true,
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
              const Divider(
                height: 2,
              ),
              Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 0,
                        child: CountryCodePicker(
                          onChanged: (value) {
                            prefs!.setString(
                                'whatsapp_country_code', value.toString());
                          },
                          initialSelection: 'PK',
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: _whatsappContactNumberController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please provide your whatsapp conatact number";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            prefs!.setString('whatsapp_contact_number', value);
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            isDense: true,
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
              const Divider(
                height: 2,
              ),
              Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _emailAddressController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '\t\t\t\tplease enter your email address';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      prefs!.setString('email_address', value);
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
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
              const Divider(
                height: 2,
              ),
              Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _skypeIdController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '\t\t\t\tplease enter stype id';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      prefs!.setString('skypeid', value);
                    },
                    decoration: InputDecoration(
                      isDense: true,
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
              const Divider(
                height: 2,
              ),
              ...getLanguages(),
              const Divider(
                height: 2,
              ),
              Material(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _currentLocationController,
                    readOnly: true,
                    onChanged: (value) {
                      prefs!.setString('current_location_country', value);
                    },
                    onTap: () async {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return const AlertDialog(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            content: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                      );
                      await Geolocator.getCurrentPosition(
                              desiredAccuracy: LocationAccuracy.high)
                          .then((value) async {
                        await Geocoder2.getDataFromCoordinates(
                          googleMapApiKey: kGoogleApiKey,
                          latitude: value.latitude,
                          longitude: value.longitude,
                        ).then((address) {
                          setState(() {
                            _currentLocationController =
                                TextEditingController(text: address.address);
                            prefs!.setString(
                                'current_location_country', address.address);
                          });
                        }).whenComplete(() {
                          Navigator.of(context).pop();
                        });
                      });
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIconConstraints:
                          const BoxConstraints(minHeight: 50, minWidth: 50),
                      contentPadding: const EdgeInsets.only(right: 20.0),
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
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
        validation: () {
          if (_formKey.currentState!.validate()) {}
          return null;
        },
      ),
      CoolStep(
        title: 'Professional Information',
        subtitle:
            'Your professional infromation is not submited yet, please fill all the required filed in this form in order to submit',
        content: Column(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Material(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'Mobility If Yes',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Material(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextChipField(
                  seprator: ",",
                  spacing: 5,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text(
                      'Mention Region / Location',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  onChanged: (val) {},
                ),
              ),
            ),
            const Divider(
              height: 2,
            ),
            Material(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: DropdownButtonFormField(
                  iconSize: 0.0,
                  items: const [
                    DropdownMenuItem(
                      child: Text('Freelancer'),
                      value: 'Freelancer',
                    ),
                    DropdownMenuItem(
                      child: Text('Un-Employed'),
                      value: 'Un-Employed',
                    ),
                    DropdownMenuItem(
                      child: Text('Available Full Time'),
                      value: 'Available Full Time',
                    ),
                    DropdownMenuItem(
                      child: Text('Employed But Available Part Time'),
                      value: 'Employed But Available Part Time',
                    ),
                  ],
                  onChanged: (v) {},
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Employment Status',
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
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return '';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Other Information',
        subtitle:
            'Your other essential infromation is not submited yet, please fill all the required filed in this form in order to submit',
        content: Column(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Material(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Tools',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
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
            Material(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: DropdownButtonFormField(
                  iconSize: 0.0,
                  items: const [
                    DropdownMenuItem(
                      child: Text('End User Computing'),
                      value: 'End User Computing',
                    ),
                    DropdownMenuItem(
                      child: Text('Networking'),
                      value: 'Networking',
                    ),
                    DropdownMenuItem(
                      child: Text('DDN Toolkit'),
                      value: 'DDN Toolkit',
                    ),
                  ],
                  onChanged: (v) {},
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text(
                      'Select Toolkit',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return '';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Material(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Attachments',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
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
            ...getUploadButton(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 16,
              child: const Material(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              ),
            ),
          ],
        ),
        validation: () {
          return null;
        },
      ),
    ];

    final stepper = CoolStepper(
      hasRoundedCorner: false,
      showErrorSnackbar: true,
      onCompleted: () {
        print(languageList);
      },
      contentPadding: const EdgeInsets.all(15),
      steps: steps,
      config: CoolStepperConfig(
        nextButton: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: AppTheme.primaryColor,
            child: const SizedBox(
              width: 75,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
        backButton: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: AppTheme.primaryColor,
            child: const SizedBox(
              width: 75,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Back',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
        finishButton: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: AppTheme.primaryColor,
            child: const SizedBox(
              width: 75,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Finish',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
        headerColor: AppTheme.primaryColor,
        stepColor: Colors.white,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        subtitleTextStyle: TextStyle(
          color: Colors.white.withOpacity(0.75),
          fontSize: 14,
        ),
      ),
    );

    return Scaffold(
      key: homeScaffoldKey,
      body: SafeArea(
        child: stepper,
      ),
    );
  }

  List<Widget> getLanguages() {
    List<Widget> languageTextFields = [];
    for (int i = 0; i < languageList.length; i++) {
      languageTextFields.add(
        Material(
          child: Row(
            children: [
              Flexible(
                child: LanguagesFields(index: i),
              ),
              const SizedBox(
                width: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _addRemoveButton(i == languageList.length - 1, i),
              ),
            ],
          ),
        ),
      );
    }
    return languageTextFields;
  }

  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          languageList.insert(0, {});
        } else {
          languageList.removeAt(index);
        }
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? AppTheme.primaryColor : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }

  List<Widget> getUploadButton() {
    List<Widget> friendsTextFields = [];
    for (int i = 0; i < uploadList.length; i++) {
      friendsTextFields.add(
        Material(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Flexible(
                  child: UploadForms(index: i),
                ),
                const SizedBox(
                  width: 10,
                ),
                _addRemoveButtonUploadField(i == uploadList.length - 1, i),
              ],
            ),
          ),
        ),
      );
    }
    return friendsTextFields;
  }

  Widget _addRemoveButtonUploadField(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          uploadList.insert(0, '');
        } else {
          uploadList.removeAt(index);
        }
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? AppTheme.primaryColor : Colors.red,
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
  String? languageController, levelController;

  @override
  void initState() {
    super.initState();
    languageController = '';
    levelController = '';
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      languageController =
          _MultiStepFormState.languageList[widget.index]['language'];
      levelController = _MultiStepFormState.languageList[widget.index]['level'];
    });

    return Row(
      children: [
        Flexible(
          flex: 2,
          child: DropdownButtonFormField(
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'select language';
              } else {
                return null;
              }
            },
            iconSize: 0.0,
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
            onChanged: (v) {
              _MultiStepFormState.languageList[widget.index]['language'] =
                  v.toString();
              prefs?.setString('languages',
                  jsonEncode(_MultiStepFormState.languageList[widget.index]));
            },
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
          ),
        ),
        Flexible(
          child: DropdownButtonFormField(
            iconSize: 0.0,
            items: const [
              DropdownMenuItem(
                child: Text('Level 1'),
                value: 'Level 1',
              ),
              DropdownMenuItem(
                child: Text('Level 2'),
                value: 'Level 2',
              ),
              DropdownMenuItem(
                child: Text('Level 3'),
                value: 'Level 3',
              ),
              DropdownMenuItem(
                child: Text('Level 4'),
                value: 'Level 4',
              ),
              DropdownMenuItem(
                child: Text('Level 5'),
                value: 'Level 5',
              ),
            ],
            onChanged: (v) {
              _MultiStepFormState.languageList[widget.index]['level'] =
                  v.toString();
              prefs?.setString('languages',
                  jsonEncode(_MultiStepFormState.languageList[widget.index]));
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              label: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Level',
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
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'select level';
              } else {
                return null;
              }
            },
          ),
        ),
      ],
    );
  }
}

class UploadForms extends StatefulWidget {
  final int index;

  const UploadForms({Key? key, required this.index}) : super(key: key);

  @override
  State<UploadForms> createState() => _UploadFormsState();
}

class _UploadFormsState extends State<UploadForms> {
  String? uploadTitle;
  File? fileSource;

  @override
  void initState() {
    super.initState();
    uploadTitle = '';
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      uploadTitle = _MultiStepFormState.uploadList[widget.index];
    });

    return Row(
      children: [
        Flexible(
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return '';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              label: Text(
                'Title',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.upload,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
