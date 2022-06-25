import 'package:json_annotation/json_annotation.dart';
part 'language.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Language {
  Language({
    required this.vendorId,
    required this.name,
    required this.languageLevel,
  });
  final String? vendorId;
  final String? name;
  final String? languageLevel;

    factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}
