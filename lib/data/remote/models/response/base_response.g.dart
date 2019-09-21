// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BaseResponse> _$baseResponseSerializer =
    new _$BaseResponseSerializer();

class _$BaseResponseSerializer implements StructuredSerializer<BaseResponse> {
  @override
  final Iterable<Type> types = const [BaseResponse, _$BaseResponse];
  @override
  final String wireName = 'BaseResponse';

  @override
  Iterable serialize(Serializers serializers, BaseResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'links',
      serializers.serialize(object.links,
          specifiedType: const FullType(LinkResponse)),
      'meta',
      serializers.serialize(object.meta,
          specifiedType: const FullType(MetaResponse)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(DataResponse)),
    ];

    return result;
  }

  @override
  BaseResponse deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BaseResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'links':
          result.links.replace(serializers.deserialize(value,
              specifiedType: const FullType(LinkResponse)) as LinkResponse);
          break;
        case 'meta':
          result.meta.replace(serializers.deserialize(value,
              specifiedType: const FullType(MetaResponse)) as MetaResponse);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(DataResponse)) as DataResponse);
          break;
      }
    }

    return result.build();
  }
}

class _$BaseResponse extends BaseResponse {
  @override
  final LinkResponse links;
  @override
  final MetaResponse meta;
  @override
  final DataResponse data;

  factory _$BaseResponse([void Function(BaseResponseBuilder) updates]) =>
      (new BaseResponseBuilder()..update(updates)).build();

  _$BaseResponse._({this.links, this.meta, this.data}) : super._() {
    if (links == null) {
      throw new BuiltValueNullFieldError('BaseResponse', 'links');
    }
    if (meta == null) {
      throw new BuiltValueNullFieldError('BaseResponse', 'meta');
    }
    if (data == null) {
      throw new BuiltValueNullFieldError('BaseResponse', 'data');
    }
  }

  @override
  BaseResponse rebuild(void Function(BaseResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BaseResponseBuilder toBuilder() => new BaseResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BaseResponse &&
        links == other.links &&
        meta == other.meta &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, links.hashCode), meta.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BaseResponse')
          ..add('links', links)
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class BaseResponseBuilder
    implements Builder<BaseResponse, BaseResponseBuilder> {
  _$BaseResponse _$v;

  LinkResponseBuilder _links;
  LinkResponseBuilder get links => _$this._links ??= new LinkResponseBuilder();
  set links(LinkResponseBuilder links) => _$this._links = links;

  MetaResponseBuilder _meta;
  MetaResponseBuilder get meta => _$this._meta ??= new MetaResponseBuilder();
  set meta(MetaResponseBuilder meta) => _$this._meta = meta;

  DataResponseBuilder _data;
  DataResponseBuilder get data => _$this._data ??= new DataResponseBuilder();
  set data(DataResponseBuilder data) => _$this._data = data;

  BaseResponseBuilder();

  BaseResponseBuilder get _$this {
    if (_$v != null) {
      _links = _$v.links?.toBuilder();
      _meta = _$v.meta?.toBuilder();
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BaseResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BaseResponse;
  }

  @override
  void update(void Function(BaseResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BaseResponse build() {
    _$BaseResponse _$result;
    try {
      _$result = _$v ??
          new _$BaseResponse._(
              links: links.build(), meta: meta.build(), data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'links';
        links.build();
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BaseResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
