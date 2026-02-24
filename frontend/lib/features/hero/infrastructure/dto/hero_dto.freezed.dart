// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hero_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HeroDto {

 String get createdAt; String get name; int get picks; int get wins; String get tier; double get winRate;
/// Create a copy of HeroDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HeroDtoCopyWith<HeroDto> get copyWith => _$HeroDtoCopyWithImpl<HeroDto>(this as HeroDto, _$identity);

  /// Serializes this HeroDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HeroDto&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.picks, picks) || other.picks == picks)&&(identical(other.wins, wins) || other.wins == wins)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.winRate, winRate) || other.winRate == winRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdAt,name,picks,wins,tier,winRate);

@override
String toString() {
  return 'HeroDto(createdAt: $createdAt, name: $name, picks: $picks, wins: $wins, tier: $tier, winRate: $winRate)';
}


}

/// @nodoc
abstract mixin class $HeroDtoCopyWith<$Res>  {
  factory $HeroDtoCopyWith(HeroDto value, $Res Function(HeroDto) _then) = _$HeroDtoCopyWithImpl;
@useResult
$Res call({
 String createdAt, String name, int picks, int wins, String tier, double winRate
});




}
/// @nodoc
class _$HeroDtoCopyWithImpl<$Res>
    implements $HeroDtoCopyWith<$Res> {
  _$HeroDtoCopyWithImpl(this._self, this._then);

  final HeroDto _self;
  final $Res Function(HeroDto) _then;

/// Create a copy of HeroDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = null,Object? name = null,Object? picks = null,Object? wins = null,Object? tier = null,Object? winRate = null,}) {
  return _then(_self.copyWith(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picks: null == picks ? _self.picks : picks // ignore: cast_nullable_to_non_nullable
as int,wins: null == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,winRate: null == winRate ? _self.winRate : winRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [HeroDto].
extension HeroDtoPatterns on HeroDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HeroDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HeroDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HeroDto value)  $default,){
final _that = this;
switch (_that) {
case _HeroDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HeroDto value)?  $default,){
final _that = this;
switch (_that) {
case _HeroDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String createdAt,  String name,  int picks,  int wins,  String tier,  double winRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HeroDto() when $default != null:
return $default(_that.createdAt,_that.name,_that.picks,_that.wins,_that.tier,_that.winRate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String createdAt,  String name,  int picks,  int wins,  String tier,  double winRate)  $default,) {final _that = this;
switch (_that) {
case _HeroDto():
return $default(_that.createdAt,_that.name,_that.picks,_that.wins,_that.tier,_that.winRate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String createdAt,  String name,  int picks,  int wins,  String tier,  double winRate)?  $default,) {final _that = this;
switch (_that) {
case _HeroDto() when $default != null:
return $default(_that.createdAt,_that.name,_that.picks,_that.wins,_that.tier,_that.winRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HeroDto extends HeroDto {
   _HeroDto({required this.createdAt, required this.name, required this.picks, required this.wins, required this.tier, required this.winRate}): super._();
  factory _HeroDto.fromJson(Map<String, dynamic> json) => _$HeroDtoFromJson(json);

@override final  String createdAt;
@override final  String name;
@override final  int picks;
@override final  int wins;
@override final  String tier;
@override final  double winRate;

/// Create a copy of HeroDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HeroDtoCopyWith<_HeroDto> get copyWith => __$HeroDtoCopyWithImpl<_HeroDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HeroDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HeroDto&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.picks, picks) || other.picks == picks)&&(identical(other.wins, wins) || other.wins == wins)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.winRate, winRate) || other.winRate == winRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdAt,name,picks,wins,tier,winRate);

@override
String toString() {
  return 'HeroDto(createdAt: $createdAt, name: $name, picks: $picks, wins: $wins, tier: $tier, winRate: $winRate)';
}


}

/// @nodoc
abstract mixin class _$HeroDtoCopyWith<$Res> implements $HeroDtoCopyWith<$Res> {
  factory _$HeroDtoCopyWith(_HeroDto value, $Res Function(_HeroDto) _then) = __$HeroDtoCopyWithImpl;
@override @useResult
$Res call({
 String createdAt, String name, int picks, int wins, String tier, double winRate
});




}
/// @nodoc
class __$HeroDtoCopyWithImpl<$Res>
    implements _$HeroDtoCopyWith<$Res> {
  __$HeroDtoCopyWithImpl(this._self, this._then);

  final _HeroDto _self;
  final $Res Function(_HeroDto) _then;

/// Create a copy of HeroDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = null,Object? name = null,Object? picks = null,Object? wins = null,Object? tier = null,Object? winRate = null,}) {
  return _then(_HeroDto(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picks: null == picks ? _self.picks : picks // ignore: cast_nullable_to_non_nullable
as int,wins: null == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,winRate: null == winRate ? _self.winRate : winRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
