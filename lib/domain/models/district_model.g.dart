// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DistrictModel extends DistrictModel {
  @override
  final String id;
  @override
  final String type;
  @override
  final String name;
  @override
  final int code;
  @override
  final LinkModel links;

  factory _$DistrictModel([void Function(DistrictModelBuilder) updates]) =>
      (new DistrictModelBuilder()..update(updates)).build();

  _$DistrictModel._({this.id, this.type, this.name, this.code, this.links})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('DistrictModel', 'id');
    }
  }

  @override
  DistrictModel rebuild(void Function(DistrictModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DistrictModelBuilder toBuilder() => new DistrictModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DistrictModel &&
        id == other.id &&
        type == other.type &&
        name == other.name &&
        code == other.code &&
        links == other.links;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), type.hashCode), name.hashCode),
            code.hashCode),
        links.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DistrictModel')
          ..add('id', id)
          ..add('type', type)
          ..add('name', name)
          ..add('code', code)
          ..add('links', links))
        .toString();
  }
}

class DistrictModelBuilder
    implements Builder<DistrictModel, DistrictModelBuilder> {
  _$DistrictModel _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _code;
  int get code => _$this._code;
  set code(int code) => _$this._code = code;

  LinkModelBuilder _links;
  LinkModelBuilder get links => _$this._links ??= new LinkModelBuilder();
  set links(LinkModelBuilder links) => _$this._links = links;

  DistrictModelBuilder();

  DistrictModelBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _type = _$v.type;
      _name = _$v.name;
      _code = _$v.code;
      _links = _$v.links?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DistrictModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DistrictModel;
  }

  @override
  void update(void Function(DistrictModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DistrictModel build() {
    _$DistrictModel _$result;
    try {
      _$result = _$v ??
          new _$DistrictModel._(
              id: id,
              type: type,
              name: name,
              code: code,
              links: _links?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'links';
        _links?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DistrictModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
