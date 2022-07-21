import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sv_rms_mobile/main.dart';
import 'package:sv_rms_mobile/ui/authentication/signup_screen_final.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  static const String route = "signup";
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formkey = GlobalKey<FormState>();
  List<String> reasonlist = [
    'Individual Consultant',
    'Recuiter Consultant',
    'Company'
  ];
  String? dropdownValue;
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController comapnycontroller = TextEditingController();

  String index = 'Individual Consultant';
  bool breakfix = false;
  bool rollout = false;
  bool cisco = false;
  bool remoteit = false;
  bool itstock = false;
  bool enduser = false;
  bool outsource = false;
  List<String> fileds = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 247, 254, 1),
      resizeToAvoidBottomInset: true,
      key: _formkey,
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
                      "Next",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingupScreenFinal(
                            fields: fileds,
                            fisrtnamecontroller: firstnamecontroller,
                            lastnamecontroller: lastnamecontroller,
                            comapnycontroller: comapnycontroller,
                          ),
                        ),
                      );
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
            //title
            const SizedBox(
              height: 50,
            ),
            const Text(
              "New Account",
              style: TextStyle(fontSize: 18),
            ),
            const Text("Join Our Engineer Network",
                style: TextStyle(fontSize: 16)),
            const SizedBox(height: 30),
            //drop down
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 5),
              child: SizedBox(
                height: 60,
                child: Material(
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: DropdownButton<String>(
                        underline: Container(),
                        hint: const Text('Please Select from the following'),
                        value: dropdownValue,
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        onChanged: (String? newValue) {
                          setState(() {
                            prefs!
                                .setString('vendor_type', newValue.toString());
                            dropdownValue = newValue!;
                            index = newValue;
                          });
                        },
                        items: reasonlist
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (index == 'Company')
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Material(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Material(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: TextFormField(
                              controller: comapnycontroller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Provide Company Name";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: "Enter Company Name",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            //form list
            //firstname
            if (index == 'Individual Consultant' ||
                index == 'Recuiter Consultant')
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: SizedBox(
                      height: 70,
                      child: Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Material(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: TextFormField(
                              controller: firstnamecontroller,
                              onChanged: (value) {
                                setState(() {
                                  prefs!.setString('first_name', value);
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Provide Your Firstname";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: "Your Firstname",
                                border: InputBorder.none,
                              ),
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
                          child: TextFormField(
                            controller: lastnamecontroller,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please provide your lastname";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                prefs!.setString('last_name', value);
                              });
                            },
                            decoration: const InputDecoration(
                              hintText: "Your Lastname",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "PLEASE SELECT THE FIELD WHERE YOU WANT TO APPLY",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
            const SizedBox(height: 20),
            //todo breakfix & rollouts
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: CheckboxListTile(
                    title: const Text(
                      "BREAK FIX",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    value: breakfix,
                    onChanged: (bool? newValue) {
                      setState(() {
                        breakfix = newValue!;
                      });
                      if (newValue!) {
                        fileds.add('BREAK FIX');
                      } else {
                        fileds.remove('BREAK FIX');
                      }
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CheckboxListTile(
                    title: const Text(
                      "ROLLOUTS",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    value: rollout,
                    onChanged: (bool? newValue) {
                      setState(() {
                        rollout = newValue!;
                      });
                      if (newValue!) {
                        fileds.add('ROLLOUTS');
                      } else {
                        fileds.remove('ROLLOUTS');
                      }
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                ),
              ],
            ),
            //todo cise support & remote it support
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: CheckboxListTile(
                    title: const Text(
                      "CISCO SUPPORT",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    value: cisco,
                    onChanged: (bool? newValue) {
                      setState(() {
                        cisco = newValue!;
                      });
                      if (newValue!) {
                        fileds.add('CISCO SUPPORT');
                      } else {
                        fileds.remove('CISCO SUPPORT');
                      }
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CheckboxListTile(
                    title: const Text(
                      "REMOTE IT SUPPORT",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    value: remoteit,
                    onChanged: (bool? newValue) {
                      setState(() {
                        remoteit = newValue!;
                      });
                      if (newValue!) {
                        fileds.add('REMOTE IT SUPPORT');
                      } else {
                        fileds.remove('REMOTE IT SUPPORT');
                      }
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                ),
              ],
            ),
            //todo it stocks & end user computing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: CheckboxListTile(
                    title: const Text(
                      "IT STOCK STORAGE",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    value: itstock,
                    onChanged: (bool? newValue) {
                      setState(() {
                        itstock = newValue!;
                      });
                      if (newValue!) {
                        fileds.add('IT STOCK SUPPORT');
                      } else {
                        fileds.remove('IT STOCK SUPPORT');
                      }
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CheckboxListTile(
                    title: const Text(
                      "END USER COMPUTING",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    value: enduser,
                    onChanged: (bool? newValue) {
                      setState(() {
                        enduser = newValue!;
                      });
                      if (newValue!) {
                        fileds.add('END USER COMPUTING');
                      } else {
                        fileds.remove('END USER COMPUTING');
                      }
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                ),
              ],
            ),
            //todo outsource resource data
            CheckboxListTile(
              title: const Text(
                "OUTSOURCED IT RESOURCE DATA CENTER SUPPORT",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              value: outsource,
              onChanged: (bool? newValue) {
                setState(() {
                  outsource = newValue!;
                });
                if (newValue!) {
                  fileds.add('OUTSOURCED IT RESOURCE DATA CENTER SUPPORT');
                } else {
                  fileds.remove('OUTSOURCED IT RESOURCE DATA CENTER SUPPORT');
                }
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
          ],
        ),
      ),
    );
  }
}
