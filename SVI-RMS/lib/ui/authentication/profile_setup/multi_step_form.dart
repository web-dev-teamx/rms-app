import 'dart:io';
import 'dart:ui';
import 'package:cool_stepper/cool_stepper.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';
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
  static List<String> languageList = [''];
  static List<String> levelList = [''];
  static List<String> uploadList = [''];

  TextEditingController? _nameController;
  TextEditingController? _locationController;
  TextEditingController? _cityCountryController;
  TextEditingController? _cityController;
  TextEditingController? _counrtyController;
  TextEditingController? _currentLocationController;
  final homeScaffoldKey = GlobalKey<ScaffoldMessengerState>();

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
              Material(
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
              const Divider(
                height: 2,
              ),
              Material(
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
              const Divider(
                height: 2,
              ),
              Material(
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
              const Divider(
                height: 2,
              ),
              Material(
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
                          types: [],
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
                        });
                        final plist = GoogleMapsPlaces(
                          apiKey: kGoogleApiKey,
                          apiHeaders:
                              await const GoogleApiHeaders().getHeaders(),
                        );
                        String placeid = place.placeId ?? "0";
                        final detail =
                            await plist.getDetailsByPlaceId(placeid);
                        final geometry = detail.result.geometry!;
                        await Geocoder2.getDataFromCoordinates(
                          googleMapApiKey: kGoogleApiKey,
                          latitude: geometry.location.lat,
                          longitude: geometry.location.lng,
                        ).then((value) {
                          setState(() {
                            _cityController =
                                TextEditingController(text: value.city);
                            _counrtyController =
                                TextEditingController(text: value.country);
                            _cityCountryController = 
                                TextEditingController(
                                    text: value.city + ', ' + value.country);
                          });
                        });
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIconConstraints:
                          const BoxConstraints(minHeight: 50, minWidth: 50),
                      contentPadding: const EdgeInsets.only(right: 20.0),
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
              const Divider(
                height: 2,
              ),
              Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _cityCountryController,
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
              const Divider(
                height: 2,
              ),
              Material(
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
              const Divider(
                height: 2,
              ),
              Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _cityController,
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
              const Divider(
                height: 2,
              ),
              Material(
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
              const Divider(
                height: 2,
              ),
              Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: TextFormField(
                    controller: _counrtyController,
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
              const Divider(
                height: 2,
              ),
              Material(
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
              const Divider(
                height: 2,
              ),
              Material(
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
              const Divider(
                height: 2,
              ),
              Material(
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
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8.0),
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
                  validator: (String? v) {
                    if (v!.isEmpty) {
                      return 'please select employment status';
                    }
                    return null;
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
                  validator: (String? v) {
                    if (v!.isEmpty) {
                      return 'please select atleast one toolkit';
                    }
                    return null;
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
      showErrorSnackbar: true,
      onCompleted: () {},
      steps: steps,
      config: CoolStepperConfig(
        backText: 'Back',
        headerColor: AppTheme.primaryColor,
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
    List<Widget> friendsTextFields = [];
    for (int i = 0; i < languageList.length; i++) {
      friendsTextFields.add(Material(
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: LanguagesFields(index: i),
            ),
            Flexible(
              child: LevelFields(index: i),
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
      ));
    }
    return friendsTextFields;
  }

  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
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
  String? languageController;

  @override
  void initState() {
    super.initState();
    languageController = '';
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      languageController = _MultiStepFormState.languageList[widget.index];
    });

    return DropdownButtonFormField(
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
          return 'please select language';
        }
        return null;
      },
    );
  }
}

class LevelFields extends StatefulWidget {
  final int index;

  const LevelFields({Key? key, required this.index}) : super(key: key);
  @override
  _LevelFieldsState createState() => _LevelFieldsState();
}

class _LevelFieldsState extends State<LevelFields> {
  String? levelController;

  @override
  void initState() {
    super.initState();
    levelController = '';
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      levelController = _MultiStepFormState.levelList[widget.index];
    });

    return DropdownButtonFormField(
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
      onChanged: (v) =>
          _MultiStepFormState.levelList[widget.index] = v.toString(),
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
      validator: (String? v) {
        if (v!.isEmpty) {
          return 'please select level';
        }
        return null;
      },
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
