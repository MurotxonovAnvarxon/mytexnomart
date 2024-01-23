import 'package:freezed_annotation/freezed_annotation.dart';

part 'slider_model.freezed.dart';
part 'slider_model.g.dart';

@freezed
class SliderModel with _$SliderModel {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory SliderModel(
  bool? success,
  String? message,
  int? code,
  SliderData? data,
      ) = _SliderModel;

  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      _$SliderModelFromJson(json);
}

@freezed
class SliderData with _$SliderData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory SliderData(
  List<Datum?>? data,
      ) = _SliderData;


  factory SliderData.fromJson(Map<String, dynamic> json) =>
      _$SliderDataFromJson(json);
}

@freezed
class Datum with _$Datum {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Datum(
  int? id,
  String? link,
  dynamic? title,
  String? imageWeb,
  String? imageMobileWeb,
      ) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}