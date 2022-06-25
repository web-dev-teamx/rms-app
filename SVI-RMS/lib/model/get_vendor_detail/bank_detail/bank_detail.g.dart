// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankDetail _$BankDetailFromJson(Map<String, dynamic> json) => BankDetail(
      vendorId: json['vendor_id'] as String?,
      bankName: json['bank_name'] as String?,
      bankSwift: json['bank_swift'] as String?,
      iban: json['iban'] as String?,
      cityAddress: json['city_address'] as String?,
      accountTitle: json['account_title'] as String?,
      st: json['st'] as String?,
      accountType: json['account_type'] as String?,
      bankCountry: json['bank_country'] as String?,
      accountCurrency: json['account_currency'] as String?,
      recepientAddress: json['recepient_address'] as String?,
      streetNumber: json['street_number'] as String?,
      moreAddressDetail: json['more_address_detail'] as String?,
      cityTown: json['city_town'] as String?,
      postalZipCode: json['postal_zip_code'] as String?,
      country: json['country'] as String?,
      accountHolderName: json['account_holder_name'] as String?,
      accountNumber: json['account_number'] as String?,
      routingNumber: json['routing_number'] as String?,
      wireTransferNumber: json['wire_transfer_number'] as String?,
      sortCode: json['sort_code'] as String?,
      bankCode: json['bank_code'] as String?,
      branchCode: json['branch_code'] as String?,
      ifscCode: json['ifsc_code'] as String?,
      acceptEur: json['accept_eur'] as String?,
    );

Map<String, dynamic> _$BankDetailToJson(BankDetail instance) =>
    <String, dynamic>{
      'vendor_id': instance.vendorId,
      'bank_name': instance.bankName,
      'bank_swift': instance.bankSwift,
      'iban': instance.iban,
      'city_address': instance.cityAddress,
      'account_title': instance.accountTitle,
      'st': instance.st,
      'account_type': instance.accountType,
      'bank_country': instance.bankCountry,
      'account_currency': instance.accountCurrency,
      'recepient_address': instance.recepientAddress,
      'street_number': instance.streetNumber,
      'more_address_detail': instance.moreAddressDetail,
      'city_town': instance.cityTown,
      'postal_zip_code': instance.postalZipCode,
      'country': instance.country,
      'account_holder_name': instance.accountHolderName,
      'account_number': instance.accountNumber,
      'routing_number': instance.routingNumber,
      'wire_transfer_number': instance.wireTransferNumber,
      'sort_code': instance.sortCode,
      'bank_code': instance.bankCode,
      'branch_code': instance.branchCode,
      'ifsc_code': instance.ifscCode,
      'accept_eur': instance.acceptEur,
    };
