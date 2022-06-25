import 'package:json_annotation/json_annotation.dart';
part 'bank_detail.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BankDetail {
  BankDetail({
    required this.vendorId,
    required this.bankName,
    required this.bankSwift,
    required this.iban,
    required this.cityAddress,
    required this.accountTitle,
    required this.st,
    required this.accountType,
    required this.bankCountry,
    required this.accountCurrency,
    required this.recepientAddress,
    required this.streetNumber,
    required this.moreAddressDetail,
    required this.cityTown,
    required this.postalZipCode,
    required this.country,
    required this.accountHolderName,
    required this.accountNumber,
    required this.routingNumber,
    required this.wireTransferNumber,
    required this.sortCode,
    required this.bankCode,
    required this.branchCode,
    required this.ifscCode,
    required this.acceptEur,
  });
  final String? vendorId;
  final String? bankName;
  final String? bankSwift;
  final String? iban;
  final String? cityAddress;
  final String? accountTitle;
  final String? st;
  final String? accountType;
  final String? bankCountry;
  final String? accountCurrency;
  final String? recepientAddress;
  final String? streetNumber;
  final String? moreAddressDetail;
  final String? cityTown;
  final String? postalZipCode;
  final String? country;
  final String? accountHolderName;
  final String? accountNumber;
  final String? routingNumber;
  final String? wireTransferNumber;
  final String? sortCode;
  final String? bankCode;
  final String? branchCode;
  final String? ifscCode;
  final String? acceptEur;


  factory BankDetail.fromJson(Map<String, dynamic> json) =>
      _$BankDetailFromJson(json);

  Map<String, dynamic> toJson() => _$BankDetailToJson(this);
}
