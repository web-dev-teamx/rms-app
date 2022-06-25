import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sv_rms_mobile/model/get_vendor_detail/bank_detail/bank_detail.dart';

class MyPaymentsScreen extends StatefulWidget {
  final List<BankDetail?> bankDetail;
  const MyPaymentsScreen({
    Key? key,
    required this.bankDetail,
  }) : super(key: key);
  static const String route = "paymentsScreen";
  @override
  _MyPaymentsScreenState createState() => _MyPaymentsScreenState();
}

class _MyPaymentsScreenState extends State<MyPaymentsScreen> {
  late final TextEditingController _bankCountry;
  late final TextEditingController _accountCurrency;
  // late final TextEditingController _streetnumber;
  late final TextEditingController _moreAddress;
  late final TextEditingController _city;
  late final TextEditingController _postalCode;
  late final TextEditingController _country;
  late final TextEditingController _bankName;
  late final TextEditingController _bankSwift;
  late final TextEditingController _iban;
  late final TextEditingController _cityAddress;
  late final TextEditingController _accTitle;
  late final TextEditingController _accType;
  late final TextEditingController _streetNumber;
  late final TextEditingController _accHolderName;
  late final TextEditingController _accNumber;
  late final TextEditingController _routingNumber;
  late final TextEditingController _wireTransferNumber;
  late final TextEditingController _sortCode;
  late final TextEditingController _bankcode;
  late final TextEditingController _branchCode;
  late final TextEditingController _ifscCode;
  late final TextEditingController _acceptEUR;
  late final TextEditingController _latest;

  @override
  void initState() {
    _bankCountry =
        TextEditingController(text: widget.bankDetail[0]!.bankCountry);
    _accountCurrency =
        TextEditingController(text: widget.bankDetail[0]!.accountCurrency);
    // _streetnumber =
    //     TextEditingController(text: widget.bankDetail[0]!.streetNumber);
    _moreAddress =
        TextEditingController(text: widget.bankDetail[0]!.moreAddressDetail);
    _city = TextEditingController(text: widget.bankDetail[0]!.cityTown);
    _postalCode =
        TextEditingController(text: widget.bankDetail[0]!.postalZipCode);
    _country = TextEditingController(text: widget.bankDetail[0]!.country);

    _bankName = TextEditingController(text: widget.bankDetail[0]!.bankName);
    _bankSwift = TextEditingController(text: widget.bankDetail[0]!.bankSwift);
    _iban = TextEditingController(text: widget.bankDetail[0]!.iban);
    _cityAddress =
        TextEditingController(text: widget.bankDetail[0]!.cityAddress);
    _accTitle = TextEditingController(text: widget.bankDetail[0]!.accountTitle);
    _accType = TextEditingController(text: widget.bankDetail[0]!.accountType);
    _streetNumber =
        TextEditingController(text: widget.bankDetail[0]!.streetNumber);
    _accHolderName =
        TextEditingController(text: widget.bankDetail[0]!.accountHolderName);
    _accNumber =
        TextEditingController(text: widget.bankDetail[0]!.accountNumber);
    _routingNumber =
        TextEditingController(text: widget.bankDetail[0]!.routingNumber);
    _wireTransferNumber =
        TextEditingController(text: widget.bankDetail[0]!.wireTransferNumber);
    _sortCode = TextEditingController(text: widget.bankDetail[0]!.sortCode);
    _bankcode = TextEditingController(text: widget.bankDetail[0]!.bankCode);
    _branchCode = TextEditingController(text: widget.bankDetail[0]!.branchCode);
    _ifscCode = TextEditingController(text: widget.bankDetail[0]!.ifscCode);
    _acceptEUR = TextEditingController(text: widget.bankDetail[0]!.acceptEur);
    _latest = TextEditingController(text: widget.bankDetail[0]!.st);
    super.initState();
  }

  String icValue = "Personal";
  List<String> icList = [
    "Personal",
    "Business",
  ];
  bool testValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverAppBar(
            pinned: true,
            centerTitle: true,
            title: Text(
              "Payment",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Consumer<PaymentBloc>(builder: (context, value, _) {
                        return Checkbox(
                          value: value.checkBoxVal,
                          onChanged: (_changed) {
                            if (value.checkBoxVal = false) {
                              setState(
                                () {
                                  value.checkBoxVal = true;
                                  value.update();
                                },
                              );
                            } else {
                              value.checkBoxVal = false;
                              value.update();
                            }
                          },
                        );
                      }),
                      SizedBox(
                        height: 50,
                        width: 120,
                        child: Image.asset("assets/images/payoneer.png"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (_changed) {},
                      ),
                      const SizedBox(
                        height: 50,
                        child: Center(
                            child: Text(
                          "Bank Transfer",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (_changed) {},
                      ),
                      SizedBox(
                        height: 50,
                        width: 120,
                        child: Image.asset("assets/images/transferwise.png"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Banking Detail",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  DropdownButton<String>(
                    itemHeight: 72,
                    alignment: Alignment.centerLeft,
                    elevation: 1,
                    isExpanded: false,
                    borderRadius: BorderRadius.circular(4),
                    onChanged: (cValue) {
                      setState(() {
                        icValue = cValue!;
                      });
                    },
                    underline: Container(
                      height: 64,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.6),
                          ),
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    value: icValue,
                    hint: const Text("Payment Type"),
                    items: icList.map(
                      (String item) {
                        return DropdownMenuItem<String>(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 56,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(item),
                            ),
                          ),
                          value: item,
                        );
                      },
                    ).toList(),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _bankCountry,
                    decoration: const InputDecoration(
                      label: Text("Bank Country"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _accountCurrency,
                    decoration: const InputDecoration(
                      label: Text("Account Currency"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Recepient Address",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  TextField(
                    controller: _streetNumber,
                    decoration: const InputDecoration(
                      label: Text("Street Number"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _moreAddress,
                    decoration: const InputDecoration(
                      label: Text("More Address Detail (Optional)"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _city,
                    decoration: const InputDecoration(
                      label: Text("City / Town"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _postalCode,
                    decoration: const InputDecoration(
                      label: Text("Postal / Zip Code"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _country,
                    decoration: const InputDecoration(
                      label: Text("Country"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Account Details",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  TextField(
                    controller: _bankName,
                    decoration: const InputDecoration(
                      label: Text("Bank Name"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _bankSwift,
                    decoration: const InputDecoration(
                      label: Text("Bank Swift"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _iban,
                    decoration: const InputDecoration(
                      label: Text("IBAN"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _cityAddress,
                    decoration: const InputDecoration(
                      label: Text("City Address"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _accTitle,
                    decoration: const InputDecoration(
                      label: Text("Account Title"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _accType,
                    decoration: const InputDecoration(
                      label: Text("Account Type"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _bankCountry,
                    decoration: const InputDecoration(
                      label: Text("Bank Country"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _accountCurrency,
                    decoration: const InputDecoration(
                      label: Text("Account Currency"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _streetNumber,
                    decoration: const InputDecoration(
                      label: Text("Street Number"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _moreAddress,
                    decoration: const InputDecoration(
                      label: Text("More Address Detail)"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _city,
                    decoration: const InputDecoration(
                      label: Text("City Town"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _postalCode,
                    decoration: const InputDecoration(
                      label: Text("Postal / Zip Code"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _country,
                    decoration: const InputDecoration(
                      label: Text("Country"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _accHolderName,
                    decoration: const InputDecoration(
                      label: Text("Account Holder Name"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _accNumber,
                    decoration: const InputDecoration(
                      label: Text("Account Number"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _routingNumber,
                    decoration: const InputDecoration(
                      label: Text("Routing Number"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _wireTransferNumber,
                    decoration: const InputDecoration(
                      label: Text("Wire Transfer Number"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _sortCode,
                    decoration: const InputDecoration(
                      label: Text("Sort Code"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _bankcode,
                    decoration: const InputDecoration(
                      label: Text("Bank Code"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _branchCode,
                    decoration: const InputDecoration(
                      label: Text("Branch Code"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _ifscCode,
                    decoration: const InputDecoration(
                      label: Text("IFSC Code"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _acceptEUR,
                    decoration: const InputDecoration(
                      label: Text("Accept Eur Transactions?"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _latest,
                    decoration: const InputDecoration(
                      label: Text("Latest"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentBloc extends ChangeNotifier {
  bool checkBoxVal = false;

  void update() {
    notifyListeners();
  }
}
