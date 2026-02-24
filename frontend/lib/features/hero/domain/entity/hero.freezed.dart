// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hero.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Hero {

 String get createdAt; String get name; int get picks; int get wins; Tier get tier; double get winRate;
/// Create a copy of Hero
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HeroCopyWith<Hero> get copyWith => _$HeroCopyWithImpl<Hero>(this as Hero, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Hero&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.picks, picks) || other.picks == picks)&&(identical(other.wins, wins) || other.wins == wins)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.winRate, winRate) || other.winRate == winRate));
}


@override
int get hashCode => Object.hash(runtimeType,createdAt,name,picks,wins,tier,winRate);

@override
String toString() {
  return 'Hero(createdAt: $createdAt, name: $name, picks: $picks, wins: $wins, tier: $tier, winRate: $winRate)';
}


}

/// @nodoc
abstract mixin class $HeroCopyWith<$Res>  {
  factory $HeroCopyWith(Hero value, $Res Function(Hero) _then) = _$HeroCopyWithImpl;
@useResult
$Res call({
 String createdAt, String name, int picks, int wins, Tier tier, double winRate
});




}
/// @nodoc
class _$HeroCopyWithImpl<$Res>
    implements $HeroCopyWith<$Res> {
  _$HeroCopyWithImpl(this._self, this._then);

  final Hero _self;
  final $Res Function(Hero) _then;

/// Create a copy of Hero
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = null,Object? name = null,Object? picks = null,Object? wins = null,Object? tier = null,Object? winRate = null,}) {
  return _then(_self.copyWith(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picks: null == picks ? _self.picks : picks // ignore: cast_nullable_to_non_nullable
as int,wins: null == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as Tier,winRate: null == winRate ? _self.winRate : winRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Hero].
extension HeroPatterns on Hero {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Hero value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Hero() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Hero value)  $default,){
final _that = this;
switch (_that) {
case _Hero():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Hero value)?  $default,){
final _that = this;
switch (_that) {
case _Hero() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String createdAt,  String name,  int picks,  int wins,  Tier tier,  double winRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Hero() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String createdAt,  String name,  int picks,  int wins,  Tier tier,  double winRate)  $default,) {final _that = this;
switch (_that) {
case _Hero():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String createdAt,  String name,  int picks,  int wins,  Tier tier,  double winRate)?  $default,) {final _that = this;
switch (_that) {
case _Hero() when $default != null:
return $default(_that.createdAt,_that.name,_that.picks,_that.wins,_that.tier,_that.winRate);case _:
  return null;

}
}

}

/// @nodoc


class _Hero implements Hero {
   _Hero({required this.createdAt, required this.name, required this.picks, required this.wins, required this.tier, required this.winRate});
  

@override final  String createdAt;
@override final  String name;
@override final  int picks;
@override final  int wins;
@override final  Tier tier;
@override final  double winRate;

/// Create a copy of Hero
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HeroCopyWith<_Hero> get copyWith => __$HeroCopyWithImpl<_Hero>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Hero&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.picks, picks) || other.picks == picks)&&(identical(other.wins, wins) || other.wins == wins)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.winRate, winRate) || other.winRate == winRate));
}


@override
int get hashCode => Object.hash(runtimeType,createdAt,name,picks,wins,tier,winRate);

@override
String toString() {
  return 'Hero(createdAt: $createdAt, name: $name, picks: $picks, wins: $wins, tier: $tier, winRate: $winRate)';
}


}

/// @nodoc
abstract mixin class _$HeroCopyWith<$Res> implements $HeroCopyWith<$Res> {
  factory _$HeroCopyWith(_Hero value, $Res Function(_Hero) _then) = __$HeroCopyWithImpl;
@override @useResult
$Res call({
 String createdAt, String name, int picks, int wins, Tier tier, double winRate
});




}
/// @nodoc
class __$HeroCopyWithImpl<$Res>
    implements _$HeroCopyWith<$Res> {
  __$HeroCopyWithImpl(this._self, this._then);

  final _Hero _self;
  final $Res Function(_Hero) _then;

/// Create a copy of Hero
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = null,Object? name = null,Object? picks = null,Object? wins = null,Object? tier = null,Object? winRate = null,}) {
  return _then(_Hero(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picks: null == picks ? _self.picks : picks // ignore: cast_nullable_to_non_nullable
as int,wins: null == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as Tier,winRate: null == winRate ? _self.winRate : winRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
