// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductSection {

 String get id; String get title; SectionKind get kind; List<Product> get products;
/// Create a copy of ProductSection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductSectionCopyWith<ProductSection> get copyWith => _$ProductSectionCopyWithImpl<ProductSection>(this as ProductSection, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProductSection;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductSection&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&const DeepCollectionEquality().equals(other.products, _this.products));
}


@override
int get hashCode {
  final _this = this as ProductSection;
  return Object.hash(runtimeType,_this.id,_this.title,_this.kind,const DeepCollectionEquality().hash(_this.products));
}

@override
String toString() {
  final _this = this as ProductSection;
  return 'ProductSection(id: ${_this.id}, title: ${_this.title}, kind: ${_this.kind}, products: ${_this.products})';
}


}

/// @nodoc
abstract mixin class $ProductSectionCopyWith<$Res>  {
  factory $ProductSectionCopyWith(ProductSection value, $Res Function(ProductSection) _then) = _$ProductSectionCopyWithImpl;
@useResult
$Res call({
 String id, String title, SectionKind kind, List<Product> products
});




}
/// @nodoc
class _$ProductSectionCopyWithImpl<$Res>
    implements $ProductSectionCopyWith<$Res> {
  _$ProductSectionCopyWithImpl(this._self, this._then);

  final ProductSection _self;
  final $Res Function(ProductSection) _then;

/// Create a copy of ProductSection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? kind = null,Object? products = null,}) {
  return _then(ProductSection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as SectionKind,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductSection].
extension ProductSectionPatterns on ProductSection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductSection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductSection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductSection value)  $default,){
final _that = this;
switch (_that) {
case _ProductSection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductSection value)?  $default,){
final _that = this;
switch (_that) {
case _ProductSection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  SectionKind kind,  List<Product> products)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductSection() when $default != null:
return $default(_that.id,_that.title,_that.kind,_that.products);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  SectionKind kind,  List<Product> products)  $default,) {final _that = this;
switch (_that) {
case _ProductSection():
return $default(_that.id,_that.title,_that.kind,_that.products);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  SectionKind kind,  List<Product> products)?  $default,) {final _that = this;
switch (_that) {
case _ProductSection() when $default != null:
return $default(_that.id,_that.title,_that.kind,_that.products);case _:
  return null;

}
}

}

/// @nodoc


class _ProductSection implements ProductSection {
  const _ProductSection({required this.id, required this.title, required this.kind, required  List<Product> products}): _products = products;
  

@override final  String id;
@override final  String title;
@override final  SectionKind kind;
 final  List<Product> _products;
@override List<Product> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of ProductSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductSectionCopyWith<_ProductSection> get copyWith => __$ProductSectionCopyWithImpl<_ProductSection>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductSection&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other.products, _products));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,title,kind,const DeepCollectionEquality().hash(_products));
}

@override
String toString() {
    return 'ProductSection(id: $id, title: $title, kind: $kind, products: $products)';
}


}

/// @nodoc
abstract mixin class _$ProductSectionCopyWith<$Res> implements $ProductSectionCopyWith<$Res> {
  factory _$ProductSectionCopyWith(_ProductSection value, $Res Function(_ProductSection) _then) = __$ProductSectionCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, SectionKind kind, List<Product> products
});




}
/// @nodoc
class __$ProductSectionCopyWithImpl<$Res>
    implements _$ProductSectionCopyWith<$Res> {
  __$ProductSectionCopyWithImpl(this._self, this._then);

  final _ProductSection _self;
  final $Res Function(_ProductSection) _then;

/// Create a copy of ProductSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? kind = null,Object? products = null,}) {
  return _then(_ProductSection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as SectionKind,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,
  ));
}


}

// dart format on
