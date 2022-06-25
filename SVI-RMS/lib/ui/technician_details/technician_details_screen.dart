import 'package:flutter/material.dart';
import 'package:sv_rms_mobile/model/get_technicians/get_technicians_model.dart';

class TechnicianDetailsScreen extends StatefulWidget {
  final int index;
  final GetTechnicianModel? getTechnician;
  const TechnicianDetailsScreen(
      {Key? key, required this.getTechnician, required this.index})
      : super(key: key);
  static const String route = "technicianDetails";
  @override
  _TechnicianDetailsScreenState createState() =>
      _TechnicianDetailsScreenState();
}

class _TechnicianDetailsScreenState extends State<TechnicianDetailsScreen> {
  final TextEditingController fname = TextEditingController();
  final TextEditingController lname = TextEditingController();
  final TextEditingController citycountry = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  void initState() {
    fname.text = widget.getTechnician?.data?[widget.index].firstName ?? '';
    lname.text = widget.getTechnician?.data?[widget.index].lastName ?? '';
    city.text = widget.getTechnician?.data?[widget.index].city ?? '';
    country.text = widget.getTechnician?.data?[widget.index].country ?? '';
    email.text = widget.getTechnician?.data?[widget.index].emailAddress ?? '';
    citycountry.text =
        "${widget.getTechnician?.data?[widget.index].city}, ${widget.getTechnician?.data?[widget.index].country}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            title: const Text(
              "Technician Details",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                ),
              )
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  TextFormField(
                    controller: fname,
                    enabled: false,
                    decoration: const InputDecoration(
                      label: Text(
                        'First Name',
                        style: TextStyle(color: Colors.green),
                      ),
                      border: OutlineInputBorder(),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: lname,
                    enabled: false,
                    decoration: const InputDecoration(
                      label: Text("Last Name",
                          style: TextStyle(color: Colors.green)),
                      border: OutlineInputBorder(),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: citycountry,
                    enabled: false,
                    decoration: const InputDecoration(
                      label: Text("City,Country For Map View",
                          style: TextStyle(color: Colors.green)),
                      border: OutlineInputBorder(),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: city,
                    enabled: false,
                    decoration: const InputDecoration(
                      label:
                          Text("City", style: TextStyle(color: Colors.green)),
                      border: OutlineInputBorder(),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: country,
                    enabled: false,
                    decoration: const InputDecoration(
                      label: Text(
                        "Country",
                        style: TextStyle(color: Colors.green),
                      ),
                      border: OutlineInputBorder(),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: email,
                    enabled: false,
                    decoration: const InputDecoration(
                      label: Text(
                        "Email Address",
                        style: TextStyle(color: Colors.green),
                      ),
                      border: OutlineInputBorder(),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      label: Text("Registration Or Tax Number National ID"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("House Number & Street"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Province & Postal Code"),
                      border: OutlineInputBorder(),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      label: Text("Contact Number(Primary)"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      label: Text("Contact Number(Seconday)"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      label: Text("Phone Number (Landline)"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      label: Text("Whatsapp Contact Number"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      label: Text("Skype ID"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      label: Text("Working Experience"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      label: Text("Languages"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      label: Text("Current Based Country & Location"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      label: Text("Interested In"),
                      border: OutlineInputBorder(),
                    ),
                  ),
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
    );
  }
}
