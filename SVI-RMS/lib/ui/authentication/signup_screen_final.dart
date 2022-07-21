// ignore_for_file: import_of_legacy_library_into_null_safe, non_constant_identifier_names

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
// import 'package:geocoder/geocoder.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:sv_rms_mobile/services/register.dart';
import 'package:sv_rms_mobile/ui/authentication/login_screen.dart';
import 'package:sv_rms_mobile/ui/home/home_screen.dart';

String get apiKey => 'AIzaSyDxG0RL36UO7jWJ2vXQGHUk8O4qakRafzE';
GoogleMapsPlaces places = GoogleMapsPlaces(apiKey: apiKey);

class SingupScreenFinal extends StatefulWidget {
  final TextEditingController fisrtnamecontroller;
  final TextEditingController lastnamecontroller;
  final TextEditingController comapnycontroller;
  final List<String> fields;

  const SingupScreenFinal({
    Key? key,
    required this.fisrtnamecontroller,
    required this.lastnamecontroller,
    required this.comapnycontroller,
    required this.fields,
  }) : super(key: key);

  @override
  _SingupScreenFinalState createState() => _SingupScreenFinalState();
}

class _SingupScreenFinalState extends State<SingupScreenFinal> {
  TextEditingController conatactcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();
  final _controller = TextEditingController();

  CountryCode? countryCode;
  bool enduser = false;
  String? currentLocation;
  String? countryValue;
  String? stateValue;
  String? cityValue;

  final homeScaffoldKey = GlobalKey<ScaffoldMessengerState>();
  final searchScaffoldKey = GlobalKey<ScaffoldMessengerState>();
  void _onCountryChange(countryCode) {
    if (kDebugMode) {
      print("New Country selected: " + countryCode.toString());
    }
  }

  String get apiKey => 'AIzaSyDxG0RL36UO7jWJ2vXQGHUk8O4qakRafzE';
  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  // var uuid = new Uuid();
  // String? _sessionToken;
  // List<dynamic> _placeList = [];

  // _onChanged() {
  //   if (_sessionToken == null) {
  //     setState(() {
  //       _sessionToken = uuid.v4();
  //     });
  //   }
  //   getSuggestion(_controller.text);
  // }

  // void getSuggestion(String input) async {
  //   String type = '(regions)';
  //   String baseURL =
  //       'https://maps.googleapis.com/maps/api/place/autocomplete/json';
  //   String request =
  //       '$baseURL?input=$input&key=$apiKey&sessiontoken=$_sessionToken';
  //   var response = await http.get(Uri.parse(request));
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       _placeList = json.decode(response.body)['predictions'];
  //     });
  //   } else {
  //     throw Exception('Failed to load predictions');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 247, 254, 1),
      bottomSheet: Container(
        color: const Color.fromRGBO(244, 247, 254, 1),
        height: 120,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: CupertinoButton.filled(
                    padding: const EdgeInsets.all(16),
                    child: const Text(
                      "Complete",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      registerRequest(
                              companyname: widget.comapnycontroller.text,
                              firstname: widget.fisrtnamecontroller.text,
                              lastname: widget.lastnamecontroller.text,
                              email: emailcontroller.text,
                              countrycode: countryCode?.dialCode.toString(),
                              country: _controller.text,
                              contactnumber: conatactcontroller.text)
                          .then((value) {
                        Navigator.pushReplacementNamed(
                          context,
                          HomeScreen.route,
                        );
                      }).catchError((err) {
                        // print(err);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new)),
                ),
                const Expanded(
                    flex: 9,
                    child: Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: Text(
                        "Complete Your Information",
                        style: TextStyle(fontSize: 18),
                      ),
                    )),
              ],
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                height: 70,
                child: Material(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: TextFormField(
                      controller: emailcontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Provide Your Email Adress";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Enter EmailAddress",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                height: 2,
              ),
            ),
            //contact number
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 0,
                          child: CountryCodePicker(
                            onChanged: _onCountryChange,
                            initialSelection: 'PK',
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: conatactcontroller,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Provide Your Conatact Number";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "Contact Number",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                height: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                height: 70,
                child: Material(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: TextField(
                      readOnly: true,
                      onTap: () async {
                        _handlePressButton();
                        // ShowPopup();
                      },
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: "Enter City/Country",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CheckboxListTile(
              title: const Text(
                "DO YOU WANT TO RECEIVE SMS ALERTS/NOTIFICATION OF NEW PROJECTS POSTED BASED ON YOUR SKILLS/SPECIALITY?",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              value: enduser,
              onChanged: (bool? newValue) {
                setState(() {
                  enduser = newValue!;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),

            const SizedBox(height: 30),
            Column(
              children: [
                const Text("Already Have An Account?"),
                CupertinoButton(
                  child: const Text("SIGN-IN"),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.route);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onError(PlacesAutocompleteResponse response) {
    homeScaffoldKey.currentState!.showSnackBar(
      SnackBar(content: Text(response.errorMessage.toString())),
    );
  }

  Future<void> _handlePressButton() async {
    Prediction? p = await PlacesAutocomplete.show(
      context: context,
      apiKey: apiKey,
      onError: onError,
      mode: Mode.overlay,
      language: "fr",
      decoration: InputDecoration(
        hintText: 'Search',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
    displayPrediction(p, homeScaffoldKey.currentState);
  }

  Future<void> displayPrediction(
      Prediction? p, ScaffoldMessengerState? currentState) async {
    if (p != null) {
      PlacesDetailsResponse detail =
          await places.getDetailsByPlaceId(p.placeId ?? '');

      // var placeId = p.placeId;
      double lat = detail.result.geometry!.location.lat;
      double lng = detail.result.geometry!.location.lng;

      // var address = await Geocoder.local.findAddressesFromQuery(p.description);

      if (kDebugMode) {
        print(lat);
        print(lng);
      }
    }
  }

  /*ShowPopup(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          contentPadding: const EdgeInsets.all(12.0),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close_outlined),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: Material(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: TextField(
                        readOnly: false,
                        onTap: () {
                          _controller.addListener(() {
                            _onChanged();
                          });
                        },
                        controller: _controller,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.search_rounded),
                          hintText: "Search Here",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 300.0,
                  width: MediaQuery.of(context)
                      .size
                      .width, // Change as per your requirement

                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: _placeList.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_placeList[index]["description"]),
                        onTap: () {
                          _controller.text = _placeList[index]["description"];
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }*/
}
