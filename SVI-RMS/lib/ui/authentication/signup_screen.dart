import 'dart:convert';
import 'dart:ui';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:sv_rms_mobile/main.dart';
import 'package:sv_rms_mobile/services/base_services.dart';
import 'package:sv_rms_mobile/ui/authentication/profile_setup/multi_step_form.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  static const String route = "signup";
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formkey = GlobalKey<FormState>();
  List _selectedFields = [];
  bool isNotificationOn = false;
  String? vendorType;
  TextEditingController? _cityCountryController;
  Map<String, dynamic> registrationForm = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 247, 254, 1),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              const SizedBox(height: 25),
              const Center(
                  child: Text(
                "New Account",
                style: TextStyle(fontSize: 18),
              )),
              const Text("Join Our Engineer Network",
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 25),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Material(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: DropdownButtonFormField(
                              icon: const Icon(Icons.arrow_downward),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Please Select from the following',
                              ),
                              items: const [
                                DropdownMenuItem(
                                  child: Text('Individual Consultant'),
                                  value: '1',
                                ),
                                DropdownMenuItem(
                                  child: Text('Recuiter Consultant'),
                                  value: '2',
                                ),
                                DropdownMenuItem(
                                  child: Text('Company'),
                                  value: '3',
                                ),
                              ],
                              onChanged: (String? value) {
                                setState(() {
                                  vendorType = value;
                                  registrationForm['vendor_type_id'] = value;
                                });
                              },
                            ),
                          ),
                        ),
                        const Divider(
                          height: 2,
                        ),
                        vendorType != 'Company'
                            ? Row(
                                children: [
                                  Flexible(
                                    child: Material(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 8.0),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'please enter your first name';
                                            } else {
                                              return null;
                                            }
                                          },
                                          onChanged: (value) {
                                            prefs!
                                                .setString('first_name', value);
                                            registrationForm['first_name'] =
                                                value;
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
                                                      color:
                                                          Colors.grey.shade700,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  const TextSpan(
                                                    text: ' *',
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                      fontFeatures: [
                                                        FontFeature.enable(
                                                            'sups'),
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
                                  const VerticalDivider(
                                    width: 2,
                                  ),
                                  Flexible(
                                    child: Material(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 8.0),
                                        child: TextFormField(
                                          onChanged: (value) {
                                            prefs!
                                                .setString('last_name', value);
                                            registrationForm['last_name'] =
                                                value;
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
                                                      color:
                                                          Colors.grey.shade700,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  const TextSpan(
                                                    text: ' *',
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                      fontFeatures: [
                                                        FontFeature.enable(
                                                            'sups'),
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
                                ],
                              )
                            : Material(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      prefs!.setString('company_name', value);
                                      registrationForm['company_name'] = value;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter your company name';
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
                                              text: 'Company Name',
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
                                      prefs!.setString('primary_country_code',
                                          value.toString());
                                      registrationForm['country_code'] =
                                          value.toString();
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "please provide your conatact number";
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      prefs!.setString(
                                          'contact_number_primary', value);
                                      registrationForm['phone'] =
                                          value.toString();
                                    },
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      label: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Contact Number',
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '\t\t\t\tplease enter your email address';
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                prefs!.setString('email_address', value);
                                registrationForm['email'] = value;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                isDense: true,
                                border: InputBorder.none,
                                prefixIconConstraints: const BoxConstraints(
                                    minHeight: 50, minWidth: 50),
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
                              controller: _cityCountryController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '\t\t\t\tplease enter city, country name';
                                } else {
                                  return null;
                                }
                              },
                              onTap: () async {
                                var place = await PlacesAutocomplete.show(
                                    context: context,
                                    apiKey: kGoogleApiKey,
                                    mode: Mode.overlay,
                                    types: [],
                                    strictbounds: false,
                                    components: [
                                      Component(Component.country,
                                          'pk'.toLowerCase()),
                                      Component(Component.country,
                                          'in'.toLowerCase()),
                                      Component(Component.country,
                                          'de'.toLowerCase()),
                                      Component(Component.country,
                                          'fr'.toLowerCase()),
                                      Component(Component.country,
                                          'as'.toLowerCase()),
                                    ],
                                    onError: (err) {});

                                if (place != null) {
                                  setState(() {
                                    _cityCountryController =
                                        TextEditingController(
                                            text: place.description.toString());
                                    prefs!.setString('location',
                                        place.description.toString());
                                  });
                                  final plist = GoogleMapsPlaces(
                                    apiKey: kGoogleApiKey,
                                    apiHeaders: await const GoogleApiHeaders()
                                        .getHeaders(),
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
                                      registrationForm['city_country_lat'] =
                                          value.latitude.toString();
                                      registrationForm['city_country_lng'] =
                                          value.longitude.toString();
                                      registrationForm['country'] =
                                          value.city.toString() +
                                              ', ' +
                                              value.country.toString();
                                      prefs!.setString('city_country_lat',
                                          geometry.location.lat.toString());
                                      prefs!.setString('city_country_lng',
                                          geometry.location.lng.toString());
                                      prefs!.setString(
                                          'city_country',
                                          value.city.toString() +
                                              ', ' +
                                              value.country.toString());
                                      prefs!.setString(
                                          'city', value.city.toString());
                                      prefs!.setString(
                                          'country', value.country.toString());
                                    });
                                  });
                                }
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                prefixIconConstraints: const BoxConstraints(
                                    minHeight: 50, minWidth: 50),
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
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(16.0),
                            bottomRight: Radius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: MultiSelectBottomSheetField(
                              initialChildSize: 0.7,
                              maxChildSize: 0.95,
                              buttonText: const Text(
                                "Fileds to be Applied",
                                style: TextStyle(fontSize: 16),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0, style: BorderStyle.none),
                              ),
                              items: [
                                MultiSelectItem('Break Fix', 'Break Fix'),
                                MultiSelectItem('Rollouts', 'Rollouts'),
                                MultiSelectItem(
                                    'Cisco Support', 'Cisco Support'),
                                MultiSelectItem(
                                    'Outsourced IT Resource Data Center Support',
                                    'Outsourced IT Resource Data Center Support'),
                                MultiSelectItem(
                                    'Remote IT Support', 'Remote IT Support'),
                                MultiSelectItem(
                                    'IT Stock Storage', 'IT Stock Storage'),
                                MultiSelectItem(
                                    'End User Computing', 'End User Computing'),
                              ],
                              searchable: true,
                              onConfirm: (values) {
                                setState(() {
                                  _selectedFields = values;
                                  registrationForm['checkboxes'] =
                                      _selectedFields.join(',');
                                });
                              },
                              chipDisplay: MultiSelectChipDisplay(
                                onTap: (item) {
                                  setState(() {
                                    _selectedFields.remove(item);
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CheckboxListTile(
                          value: isNotificationOn,
                          onChanged: (value) {
                            setState(() {
                              isNotificationOn = value!;
                            });
                            if (value == true) {
                              registrationForm['sms_notif'] = 'on';
                            } else {
                              registrationForm['sms_notif'] = 'off';
                            }
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          dense: true,
                          title: const Text(
                              'Do you want to receive sms alerts/notification of new projects posted based on your skills/speciality?'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () async {
                if (_formkey.currentState!.validate()) {
                  registrationForm['auth_token'] = authToken;
                  print(jsonEncode(registrationForm));
                  try {
                    await http
                        .post(Uri.parse("${baseURL}process_register.php"),
                            body: registrationForm)
                        .then((response) {
                      print(response.body);
                    }); // Contains a Dio Error object
                  } catch (e) {
                    print(e.toString());
                  }
                }
              },
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(15),
                  ),
                  minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 50),
                  )),
              child: const Text('Proceed to Sign Up'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an Account?"),
              CupertinoButton(
                child: const Text("Sign In"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
