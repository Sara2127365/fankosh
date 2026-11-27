// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialStateAuth value)?  initial,TResult Function( LoadingStateAuth value)?  loading,TResult Function( AuthenticatedStateAuth value)?  authenticated,TResult Function( SuccessStateAuth value)?  success,TResult Function( FailedStateAuth value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialStateAuth() when initial != null:
return initial(_that);case LoadingStateAuth() when loading != null:
return loading(_that);case AuthenticatedStateAuth() when authenticated != null:
return authenticated(_that);case SuccessStateAuth() when success != null:
return success(_that);case FailedStateAuth() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialStateAuth value)  initial,required TResult Function( LoadingStateAuth value)  loading,required TResult Function( AuthenticatedStateAuth value)  authenticated,required TResult Function( SuccessStateAuth value)  success,required TResult Function( FailedStateAuth value)  failure,}){
final _that = this;
switch (_that) {
case InitialStateAuth():
return initial(_that);case LoadingStateAuth():
return loading(_that);case AuthenticatedStateAuth():
return authenticated(_that);case SuccessStateAuth():
return success(_that);case FailedStateAuth():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialStateAuth value)?  initial,TResult? Function( LoadingStateAuth value)?  loading,TResult? Function( AuthenticatedStateAuth value)?  authenticated,TResult? Function( SuccessStateAuth value)?  success,TResult? Function( FailedStateAuth value)?  failure,}){
final _that = this;
switch (_that) {
case InitialStateAuth() when initial != null:
return initial(_that);case LoadingStateAuth() when loading != null:
return loading(_that);case AuthenticatedStateAuth() when authenticated != null:
return authenticated(_that);case SuccessStateAuth() when success != null:
return success(_that);case FailedStateAuth() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String name,  String email)?  authenticated,TResult Function( String message)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialStateAuth() when initial != null:
return initial();case LoadingStateAuth() when loading != null:
return loading();case AuthenticatedStateAuth() when authenticated != null:
return authenticated(_that.name,_that.email);case SuccessStateAuth() when success != null:
return success(_that.message);case FailedStateAuth() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String name,  String email)  authenticated,required TResult Function( String message)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case InitialStateAuth():
return initial();case LoadingStateAuth():
return loading();case AuthenticatedStateAuth():
return authenticated(_that.name,_that.email);case SuccessStateAuth():
return success(_that.message);case FailedStateAuth():
return failure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String name,  String email)?  authenticated,TResult? Function( String message)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case InitialStateAuth() when initial != null:
return initial();case LoadingStateAuth() when loading != null:
return loading();case AuthenticatedStateAuth() when authenticated != null:
return authenticated(_that.name,_that.email);case SuccessStateAuth() when success != null:
return success(_that.message);case FailedStateAuth() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class InitialStateAuth implements AuthState {
  const InitialStateAuth();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialStateAuth);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class LoadingStateAuth implements AuthState {
  const LoadingStateAuth();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingStateAuth);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




/// @nodoc


class AuthenticatedStateAuth implements AuthState {
  const AuthenticatedStateAuth({required this.name, required this.email});
  

 final  String name;
 final  String email;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticatedStateAuthCopyWith<AuthenticatedStateAuth> get copyWith => _$AuthenticatedStateAuthCopyWithImpl<AuthenticatedStateAuth>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticatedStateAuth&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,name,email);

@override
String toString() {
  return 'AuthState.authenticated(name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class $AuthenticatedStateAuthCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthenticatedStateAuthCopyWith(AuthenticatedStateAuth value, $Res Function(AuthenticatedStateAuth) _then) = _$AuthenticatedStateAuthCopyWithImpl;
@useResult
$Res call({
 String name, String email
});




}
/// @nodoc
class _$AuthenticatedStateAuthCopyWithImpl<$Res>
    implements $AuthenticatedStateAuthCopyWith<$Res> {
  _$AuthenticatedStateAuthCopyWithImpl(this._self, this._then);

  final AuthenticatedStateAuth _self;
  final $Res Function(AuthenticatedStateAuth) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,}) {
  return _then(AuthenticatedStateAuth(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SuccessStateAuth implements AuthState {
  const SuccessStateAuth({required this.message});
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessStateAuthCopyWith<SuccessStateAuth> get copyWith => _$SuccessStateAuthCopyWithImpl<SuccessStateAuth>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessStateAuth&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.success(message: $message)';
}


}

/// @nodoc
abstract mixin class $SuccessStateAuthCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $SuccessStateAuthCopyWith(SuccessStateAuth value, $Res Function(SuccessStateAuth) _then) = _$SuccessStateAuthCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SuccessStateAuthCopyWithImpl<$Res>
    implements $SuccessStateAuthCopyWith<$Res> {
  _$SuccessStateAuthCopyWithImpl(this._self, this._then);

  final SuccessStateAuth _self;
  final $Res Function(SuccessStateAuth) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SuccessStateAuth(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FailedStateAuth implements AuthState {
  const FailedStateAuth({required this.message});
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailedStateAuthCopyWith<FailedStateAuth> get copyWith => _$FailedStateAuthCopyWithImpl<FailedStateAuth>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailedStateAuth&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $FailedStateAuthCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $FailedStateAuthCopyWith(FailedStateAuth value, $Res Function(FailedStateAuth) _then) = _$FailedStateAuthCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FailedStateAuthCopyWithImpl<$Res>
    implements $FailedStateAuthCopyWith<$Res> {
  _$FailedStateAuthCopyWithImpl(this._self, this._then);

  final FailedStateAuth _self;
  final $Res Function(FailedStateAuth) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(FailedStateAuth(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
