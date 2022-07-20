import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';

class PlacePicker extends StatefulWidget {
  const PlacePicker({Key? key}) : super(key: key);

  @override
  State<PlacePicker> createState() => _PlacePickerState();
}

class _PlacePickerState extends State<PlacePicker> {
  Mode mode = Mode.overlay;
  final homeScaffoldKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffoldKey,
      appBar: AppBar(
        title: const Text("My App"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: _handlePressButton,
            child: const Text("Search places"),
          ),
          ElevatedButton(
            child: const Text("Custom"),
            onPressed: () {
              Navigator.of(context).pushNamed("/search");
            },
          ),
        ],
      )),
    );
  }

  void onError(PlacesAutocompleteResponse? response) {
    homeScaffoldKey.currentState!.showSnackBar(
      SnackBar(content: Text(response!.errorMessage.toString())),
    );
  }

  Future<void> _handlePressButton() async {
    // show input autocomplete with selected mode
    // then get the Prediction selected
    Prediction? p = await PlacesAutocomplete.show(
      context: context,
      apiKey: 'AIzaSyDxG0RL36UO7jWJ2vXQGHUk8O4qakRafzE',
      onError: onError,
      mode: mode,
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
      components: [Component(Component.country, "fr")],
    );

    displayPrediction(p!, homeScaffoldKey.currentState);
  }
}

Future<void> displayPrediction(
    Prediction p, ScaffoldMessengerState? scaffold) async {
  GoogleMapsPlaces _places = GoogleMapsPlaces(
    apiKey: 'AIzaSyDxG0RL36UO7jWJ2vXQGHUk8O4qakRafzE',
    apiHeaders: await const GoogleApiHeaders().getHeaders(),
  );
  PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId!);
  final lat = detail.result.geometry!.location.lat;
  final lng = detail.result.geometry!.location.lng;

  scaffold!.showSnackBar(
    SnackBar(content: Text("${p.description} - $lat/$lng")),
  );
}

// custom scaffold that handle search
// basically your widget need to extends [GooglePlacesAutocompleteWidget]
// and your state [GooglePlacesAutocompleteState]
class CustomSearchScaffold extends PlacesAutocompleteWidget {
  CustomSearchScaffold({Key? key})
      : super(
          key: key,
          apiKey: 'AIzaSyDxG0RL36UO7jWJ2vXQGHUk8O4qakRafzE',
          sessionToken: Uuid().generateV4(),
          language: "en",
          components: [Component(Component.country, "uk")],
        );

  @override
  _CustomSearchScaffoldState createState() => _CustomSearchScaffoldState();
}

class _CustomSearchScaffoldState extends PlacesAutocompleteState {
  final searchScaffoldKey = GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: AppBarPlacesAutoCompleteTextField());
    final body = PlacesAutocompleteResult(
      onTap: (p) {
        displayPrediction(p, searchScaffoldKey.currentState);
      },
      logo: Row(
        children: const [FlutterLogo()],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
    return Scaffold(key: searchScaffoldKey, appBar: appBar, body: body);
  }

  @override
  void onResponseError(PlacesAutocompleteResponse response) {
    super.onResponseError(response);
    searchScaffoldKey.currentState!.showSnackBar(
      SnackBar(content: Text(response.errorMessage!)),
    );
  }
}

class Uuid {
  final Random _random = Random();

  String generateV4() {
    // Generate xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx / 8-4-4-4-12.
    final int special = 8 + _random.nextInt(4);

    return '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}-'
        '${_bitsDigits(16, 4)}-'
        '4${_bitsDigits(12, 3)}-'
        '${_printDigits(special, 1)}${_bitsDigits(12, 3)}-'
        '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}';
  }

  String _bitsDigits(int bitCount, int digitCount) =>
      _printDigits(_generateBits(bitCount), digitCount);

  int _generateBits(int bitCount) => _random.nextInt(1 << bitCount);

  String _printDigits(int value, int count) =>
      value.toRadixString(16).padLeft(count, '0');
}
