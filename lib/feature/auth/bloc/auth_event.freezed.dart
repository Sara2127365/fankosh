// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {

 String get email;
/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthEventCopyWith<AuthEvent> get copyWith => _$AuthEventCopyWithImpl<AuthEvent>(this as AuthEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AuthEvent(email: $email)';
}


}

/// @nodoc
abstract mixin class $AuthEventCopyWith<$Res>  {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) _then) = _$AuthEventCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$AuthEventCopyWithImpl<$Res>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._self, this._then);

  final AuthEvent _self;
  final $Res Function(AuthEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoginRequested value)?  loginRequested,TResult Function( RegisterRequested value)?  registerRequested,TResult Function( PasswordResetRequested value)?  passwordResetRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoginRequested() when loginRequested != null:
return loginRequested(_that);case RegisterRequested() when registerRequested != null:
return registerRequested(_that);case PasswordResetRequested() when passwordResetRequested != null:
return passwordResetRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoginRequested value)  loginRequested,required TResult Function( RegisterRequested value)  registerRequested,required TResult Function( PasswordResetRequested value)  passwordResetRequested,}){
final _that = this;
switch (_that) {
case LoginRequested():
return loginRequested(_that);case RegisterRequested():
return registerRequested(_that);case PasswordResetRequested():
return passwordResetRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoginRequested value)?  loginRequested,TResult? Function( RegisterRequested value)?  registerRequested,TResult? Function( PasswordResetRequested value)?  passwordResetRequested,}){
final _that = this;
switch (_that) {
case LoginRequested() when loginRequested != null:
return loginRequested(_that);case RegisterRequested() when registerRequested != null:
return registerRequested(_that);case PasswordResetRequested() when passwordResetRequested != null:
return passwordResetRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email,  String password)?  loginRequested,TResult Function( String name,  String email,  String password,  String confirmPassword)?  registerRequested,TResult Function( String email)?  passwordResetRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoginRequested() when loginRequested != null:
return loginRequested(_that.email,_that.password);case RegisterRequested() when registerRequested != null:
return registerRequested(_that.name,_that.email,_that.password,_that.confirmPassword);case PasswordResetRequested() when passwordResetRequested != null:
return passwordResetRequested(_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email,  String password)  loginRequested,required TResult Function( String name,  String email,  String password,  String confirmPassword)  registerRequested,required TResult Function( String email)  passwordResetRequested,}) {final _that = this;
switch (_that) {
case LoginRequested():
return loginRequested(_that.email,_that.password);case RegisterRequested():
return registerRequested(_that.name,_that.email,_that.password,_that.confirmPassword);case PasswordResetRequested():
return passwordResetRequested(_that.email);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email,  String password)?  loginRequested,TResult? Function( String name,  String email,  String password,  String confirmPassword)?  registerRequested,TResult? Function( String email)?  passwordResetRequested,}) {final _that = this;
switch (_that) {
case LoginRequested() when loginRequested != null:
return loginRequested(_that.email,_that.password);case RegisterRequested() when registerRequested != null:
return registerRequested(_that.name,_that.email,_that.password,_that.confirmPassword);case PasswordResetRequested() when passwordResetRequested != null:
return passwordResetRequested(_that.email);case _:
  return null;

}
}

}

/// @nodoc


class LoginRequested implements AuthEvent {
  const LoginRequested({required this.email, required this.password});
  

@override final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginRequestedCopyWith<LoginRequested> get copyWith => _$LoginRequestedCopyWithImpl<LoginRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginRequested&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.loginRequested(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $LoginRequestedCopyWith(LoginRequested value, $Res Function(LoginRequested) _then) = _$LoginRequestedCopyWithImpl;
@override @useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$LoginRequestedCopyWithImpl<$Res>
    implements $LoginRequestedCopyWith<$Res> {
  _$LoginRequestedCopyWithImpl(this._self, this._then);

  final LoginRequested _self;
  final $Res Function(LoginRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(LoginRequested(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RegisterRequested implements AuthEvent {
  const RegisterRequested({required this.name, required this.email, required this.password, required this.confirmPassword});
  

 final  String name;
@override final  String email;
 final  String password;
 final  String confirmPassword;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterRequestedCopyWith<RegisterRequested> get copyWith => _$RegisterRequestedCopyWithImpl<RegisterRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterRequested&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword));
}


@override
int get hashCode => Object.hash(runtimeType,name,email,password,confirmPassword);

@override
String toString() {
  return 'AuthEvent.registerRequested(name: $name, email: $email, password: $password, confirmPassword: $confirmPassword)';
}


}

/// @nodoc
abstract mixin class $RegisterRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $RegisterRequestedCopyWith(RegisterRequested value, $Res Function(RegisterRequested) _then) = _$RegisterRequestedCopyWithImpl;
@override @useResult
$Res call({
 String name, String email, String password, String confirmPassword
});




}
/// @nodoc
class _$RegisterRequestedCopyWithImpl<$Res>
    implements $RegisterRequestedCopyWith<$Res> {
  _$RegisterRequestedCopyWithImpl(this._self, this._then);

  final RegisterRequested _self;
  final $Res Function(RegisterRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? password = null,Object? confirmPassword = null,}) {
  return _then(RegisterRequested(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PasswordResetRequested implements AuthEvent {
  const PasswordResetRequested({required this.email});
  

@override final  String email;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordResetRequestedCopyWith<PasswordResetRequested> get copyWith => _$PasswordResetRequestedCopyWithImpl<PasswordResetRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordResetRequested&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AuthEvent.passwordResetRequested(email: $email)';
}


}

/// @nodoc
abstract mixin class $PasswordResetRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $PasswordResetRequestedCopyWith(PasswordResetRequested value, $Res Function(PasswordResetRequested) _then) = _$PasswordResetRequestedCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class _$PasswordResetRequestedCopyWithImpl<$Res>
    implements $PasswordResetRequestedCopyWith<$Res> {
  _$PasswordResetRequestedCopyWithImpl(this._self, this._then);

  final PasswordResetRequested _self;
  final $Res Function(PasswordResetRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(PasswordResetRequested(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
