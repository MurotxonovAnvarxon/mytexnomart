// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SliderModel _$SliderModelFromJson(Map<String, dynamic> json) {
  return _SliderModel.fromJson(json);
}

/// @nodoc
mixin _$SliderModel {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  SliderData? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SliderModelCopyWith<SliderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SliderModelCopyWith<$Res> {
  factory $SliderModelCopyWith(
          SliderModel value, $Res Function(SliderModel) then) =
      _$SliderModelCopyWithImpl<$Res, SliderModel>;
  @useResult
  $Res call({bool? success, String? message, int? code, SliderData? data});

  $SliderDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$SliderModelCopyWithImpl<$Res, $Val extends SliderModel>
    implements $SliderModelCopyWith<$Res> {
  _$SliderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SliderData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SliderDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SliderDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SliderModelImplCopyWith<$Res>
    implements $SliderModelCopyWith<$Res> {
  factory _$$SliderModelImplCopyWith(
          _$SliderModelImpl value, $Res Function(_$SliderModelImpl) then) =
      __$$SliderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? message, int? code, SliderData? data});

  @override
  $SliderDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$SliderModelImplCopyWithImpl<$Res>
    extends _$SliderModelCopyWithImpl<$Res, _$SliderModelImpl>
    implements _$$SliderModelImplCopyWith<$Res> {
  __$$SliderModelImplCopyWithImpl(
      _$SliderModelImpl _value, $Res Function(_$SliderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SliderModelImpl(
      freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SliderData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$SliderModelImpl implements _SliderModel {
  const _$SliderModelImpl(this.success, this.message, this.code, this.data);

  factory _$SliderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SliderModelImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final SliderData? data;

  @override
  String toString() {
    return 'SliderModel(success: $success, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SliderModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, code, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SliderModelImplCopyWith<_$SliderModelImpl> get copyWith =>
      __$$SliderModelImplCopyWithImpl<_$SliderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SliderModelImplToJson(
      this,
    );
  }
}

abstract class _SliderModel implements SliderModel {
  const factory _SliderModel(final bool? success, final String? message,
      final int? code, final SliderData? data) = _$SliderModelImpl;

  factory _SliderModel.fromJson(Map<String, dynamic> json) =
      _$SliderModelImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  int? get code;
  @override
  SliderData? get data;
  @override
  @JsonKey(ignore: true)
  _$$SliderModelImplCopyWith<_$SliderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SliderData _$SliderDataFromJson(Map<String, dynamic> json) {
  return _SliderData.fromJson(json);
}

/// @nodoc
mixin _$SliderData {
  List<Datum?>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SliderDataCopyWith<SliderData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SliderDataCopyWith<$Res> {
  factory $SliderDataCopyWith(
          SliderData value, $Res Function(SliderData) then) =
      _$SliderDataCopyWithImpl<$Res, SliderData>;
  @useResult
  $Res call({List<Datum?>? data});
}

/// @nodoc
class _$SliderDataCopyWithImpl<$Res, $Val extends SliderData>
    implements $SliderDataCopyWith<$Res> {
  _$SliderDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SliderDataImplCopyWith<$Res>
    implements $SliderDataCopyWith<$Res> {
  factory _$$SliderDataImplCopyWith(
          _$SliderDataImpl value, $Res Function(_$SliderDataImpl) then) =
      __$$SliderDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Datum?>? data});
}

/// @nodoc
class __$$SliderDataImplCopyWithImpl<$Res>
    extends _$SliderDataCopyWithImpl<$Res, _$SliderDataImpl>
    implements _$$SliderDataImplCopyWith<$Res> {
  __$$SliderDataImplCopyWithImpl(
      _$SliderDataImpl _value, $Res Function(_$SliderDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SliderDataImpl(
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum?>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$SliderDataImpl implements _SliderData {
  const _$SliderDataImpl(final List<Datum?>? data) : _data = data;

  factory _$SliderDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SliderDataImplFromJson(json);

  final List<Datum?>? _data;
  @override
  List<Datum?>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SliderData(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SliderDataImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SliderDataImplCopyWith<_$SliderDataImpl> get copyWith =>
      __$$SliderDataImplCopyWithImpl<_$SliderDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SliderDataImplToJson(
      this,
    );
  }
}

abstract class _SliderData implements SliderData {
  const factory _SliderData(final List<Datum?>? data) = _$SliderDataImpl;

  factory _SliderData.fromJson(Map<String, dynamic> json) =
      _$SliderDataImpl.fromJson;

  @override
  List<Datum?>? get data;
  @override
  @JsonKey(ignore: true)
  _$$SliderDataImplCopyWith<_$SliderDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Datum _$DatumFromJson(Map<String, dynamic> json) {
  return _Datum.fromJson(json);
}

/// @nodoc
mixin _$Datum {
  int? get id => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  dynamic? get title => throw _privateConstructorUsedError;
  String? get imageWeb => throw _privateConstructorUsedError;
  String? get imageMobileWeb => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatumCopyWith<Datum> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatumCopyWith<$Res> {
  factory $DatumCopyWith(Datum value, $Res Function(Datum) then) =
      _$DatumCopyWithImpl<$Res, Datum>;
  @useResult
  $Res call(
      {int? id,
      String? link,
      dynamic? title,
      String? imageWeb,
      String? imageMobileWeb});
}

/// @nodoc
class _$DatumCopyWithImpl<$Res, $Val extends Datum>
    implements $DatumCopyWith<$Res> {
  _$DatumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? link = freezed,
    Object? title = freezed,
    Object? imageWeb = freezed,
    Object? imageMobileWeb = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      imageWeb: freezed == imageWeb
          ? _value.imageWeb
          : imageWeb // ignore: cast_nullable_to_non_nullable
              as String?,
      imageMobileWeb: freezed == imageMobileWeb
          ? _value.imageMobileWeb
          : imageMobileWeb // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DatumImplCopyWith<$Res> implements $DatumCopyWith<$Res> {
  factory _$$DatumImplCopyWith(
          _$DatumImpl value, $Res Function(_$DatumImpl) then) =
      __$$DatumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? link,
      dynamic? title,
      String? imageWeb,
      String? imageMobileWeb});
}

/// @nodoc
class __$$DatumImplCopyWithImpl<$Res>
    extends _$DatumCopyWithImpl<$Res, _$DatumImpl>
    implements _$$DatumImplCopyWith<$Res> {
  __$$DatumImplCopyWithImpl(
      _$DatumImpl _value, $Res Function(_$DatumImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? link = freezed,
    Object? title = freezed,
    Object? imageWeb = freezed,
    Object? imageMobileWeb = freezed,
  }) {
    return _then(_$DatumImpl(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      freezed == imageWeb
          ? _value.imageWeb
          : imageWeb // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == imageMobileWeb
          ? _value.imageMobileWeb
          : imageMobileWeb // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$DatumImpl implements _Datum {
  const _$DatumImpl(
      this.id, this.link, this.title, this.imageWeb, this.imageMobileWeb);

  factory _$DatumImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatumImplFromJson(json);

  @override
  final int? id;
  @override
  final String? link;
  @override
  final dynamic? title;
  @override
  final String? imageWeb;
  @override
  final String? imageMobileWeb;

  @override
  String toString() {
    return 'Datum(id: $id, link: $link, title: $title, imageWeb: $imageWeb, imageMobileWeb: $imageMobileWeb)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatumImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.link, link) || other.link == link) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            (identical(other.imageWeb, imageWeb) ||
                other.imageWeb == imageWeb) &&
            (identical(other.imageMobileWeb, imageMobileWeb) ||
                other.imageMobileWeb == imageMobileWeb));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, link,
      const DeepCollectionEquality().hash(title), imageWeb, imageMobileWeb);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DatumImplCopyWith<_$DatumImpl> get copyWith =>
      __$$DatumImplCopyWithImpl<_$DatumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DatumImplToJson(
      this,
    );
  }
}

abstract class _Datum implements Datum {
  const factory _Datum(final int? id, final String? link, final dynamic? title,
      final String? imageWeb, final String? imageMobileWeb) = _$DatumImpl;

  factory _Datum.fromJson(Map<String, dynamic> json) = _$DatumImpl.fromJson;

  @override
  int? get id;
  @override
  String? get link;
  @override
  dynamic? get title;
  @override
  String? get imageWeb;
  @override
  String? get imageMobileWeb;
  @override
  @JsonKey(ignore: true)
  _$$DatumImplCopyWith<_$DatumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
