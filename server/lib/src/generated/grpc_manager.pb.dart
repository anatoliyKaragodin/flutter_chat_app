///
//  Generated code. Do not modify.
//  source: grpc_manager.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Empty', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Empty._() : super();
  factory Empty() => create();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

class Message extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Message', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'senderId', $pb.PbFieldType.O3, protoName: 'senderId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chatId', $pb.PbFieldType.O3, protoName: 'chatId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdDate', protoName: 'createdDate')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messageId', $pb.PbFieldType.O3, protoName: 'messageId')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedDate', protoName: 'updatedDate')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deletedDate', protoName: 'deletedDate')
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isRead', protoName: 'isRead')
    ..hasRequiredFields = false
  ;

  Message._() : super();
  factory Message({
    $core.int? senderId,
    $core.int? chatId,
    $core.String? content,
    $core.String? createdDate,
    $core.int? messageId,
    $core.String? updatedDate,
    $core.String? deletedDate,
    $core.bool? isRead,
  }) {
    final _result = create();
    if (senderId != null) {
      _result.senderId = senderId;
    }
    if (chatId != null) {
      _result.chatId = chatId;
    }
    if (content != null) {
      _result.content = content;
    }
    if (createdDate != null) {
      _result.createdDate = createdDate;
    }
    if (messageId != null) {
      _result.messageId = messageId;
    }
    if (updatedDate != null) {
      _result.updatedDate = updatedDate;
    }
    if (deletedDate != null) {
      _result.deletedDate = deletedDate;
    }
    if (isRead != null) {
      _result.isRead = isRead;
    }
    return _result;
  }
  factory Message.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Message.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Message clone() => Message()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Message copyWith(void Function(Message) updates) => super.copyWith((message) => updates(message as Message)) as Message; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  Message createEmptyInstance() => create();
  static $pb.PbList<Message> createRepeated() => $pb.PbList<Message>();
  @$core.pragma('dart2js:noInline')
  static Message getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Message>(create);
  static Message? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get senderId => $_getIZ(0);
  @$pb.TagNumber(1)
  set senderId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSenderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSenderId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get chatId => $_getIZ(1);
  @$pb.TagNumber(2)
  set chatId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChatId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChatId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get createdDate => $_getSZ(3);
  @$pb.TagNumber(4)
  set createdDate($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatedDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedDate() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get messageId => $_getIZ(4);
  @$pb.TagNumber(5)
  set messageId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMessageId() => $_has(4);
  @$pb.TagNumber(5)
  void clearMessageId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get updatedDate => $_getSZ(5);
  @$pb.TagNumber(6)
  set updatedDate($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUpdatedDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearUpdatedDate() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get deletedDate => $_getSZ(6);
  @$pb.TagNumber(7)
  set deletedDate($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDeletedDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearDeletedDate() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isRead => $_getBF(7);
  @$pb.TagNumber(8)
  set isRead($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasIsRead() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsRead() => clearField(8);
}

class MessageBase extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MessageBase', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messageId', $pb.PbFieldType.O3, protoName: 'messageId')
    ..hasRequiredFields = false
  ;

  MessageBase._() : super();
  factory MessageBase({
    $core.bool? ok,
    $core.int? messageId,
  }) {
    final _result = create();
    if (ok != null) {
      _result.ok = ok;
    }
    if (messageId != null) {
      _result.messageId = messageId;
    }
    return _result;
  }
  factory MessageBase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageBase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessageBase clone() => MessageBase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessageBase copyWith(void Function(MessageBase) updates) => super.copyWith((message) => updates(message as MessageBase)) as MessageBase; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MessageBase create() => MessageBase._();
  MessageBase createEmptyInstance() => create();
  static $pb.PbList<MessageBase> createRepeated() => $pb.PbList<MessageBase>();
  @$core.pragma('dart2js:noInline')
  static MessageBase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageBase>(create);
  static MessageBase? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get ok => $_getBF(0);
  @$pb.TagNumber(1)
  set ok($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get messageId => $_getIZ(1);
  @$pb.TagNumber(2)
  set messageId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessageId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessageId() => clearField(2);
}

class LastMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LastMessage', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messageId', $pb.PbFieldType.O3, protoName: 'messageId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', $pb.PbFieldType.O3, protoName: 'userId')
    ..hasRequiredFields = false
  ;

  LastMessage._() : super();
  factory LastMessage({
    $core.int? messageId,
    $core.int? userId,
  }) {
    final _result = create();
    if (messageId != null) {
      _result.messageId = messageId;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    return _result;
  }
  factory LastMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LastMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LastMessage clone() => LastMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LastMessage copyWith(void Function(LastMessage) updates) => super.copyWith((message) => updates(message as LastMessage)) as LastMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LastMessage create() => LastMessage._();
  LastMessage createEmptyInstance() => create();
  static $pb.PbList<LastMessage> createRepeated() => $pb.PbList<LastMessage>();
  @$core.pragma('dart2js:noInline')
  static LastMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LastMessage>(create);
  static LastMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get messageId => $_getIZ(0);
  @$pb.TagNumber(1)
  set messageId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get userId => $_getIZ(1);
  @$pb.TagNumber(2)
  set userId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);
}

class MessageFromBase extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MessageFromBase', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chatId', $pb.PbFieldType.O3, protoName: 'chatId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'senderId', $pb.PbFieldType.O3, protoName: 'senderId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdDate', protoName: 'createdDate')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedDate', protoName: 'updatedDate')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deletedDate', protoName: 'deletedDate')
    ..hasRequiredFields = false
  ;

  MessageFromBase._() : super();
  factory MessageFromBase({
    $core.int? chatId,
    $core.int? senderId,
    $core.String? content,
    $core.String? createdDate,
    $core.String? updatedDate,
    $core.String? deletedDate,
  }) {
    final _result = create();
    if (chatId != null) {
      _result.chatId = chatId;
    }
    if (senderId != null) {
      _result.senderId = senderId;
    }
    if (content != null) {
      _result.content = content;
    }
    if (createdDate != null) {
      _result.createdDate = createdDate;
    }
    if (updatedDate != null) {
      _result.updatedDate = updatedDate;
    }
    if (deletedDate != null) {
      _result.deletedDate = deletedDate;
    }
    return _result;
  }
  factory MessageFromBase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageFromBase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessageFromBase clone() => MessageFromBase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessageFromBase copyWith(void Function(MessageFromBase) updates) => super.copyWith((message) => updates(message as MessageFromBase)) as MessageFromBase; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MessageFromBase create() => MessageFromBase._();
  MessageFromBase createEmptyInstance() => create();
  static $pb.PbList<MessageFromBase> createRepeated() => $pb.PbList<MessageFromBase>();
  @$core.pragma('dart2js:noInline')
  static MessageFromBase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageFromBase>(create);
  static MessageFromBase? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get chatId => $_getIZ(0);
  @$pb.TagNumber(1)
  set chatId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get senderId => $_getIZ(1);
  @$pb.TagNumber(2)
  set senderId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSenderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSenderId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get createdDate => $_getSZ(3);
  @$pb.TagNumber(4)
  set createdDate($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatedDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedDate() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get updatedDate => $_getSZ(4);
  @$pb.TagNumber(5)
  set updatedDate($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUpdatedDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdatedDate() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get deletedDate => $_getSZ(5);
  @$pb.TagNumber(6)
  set deletedDate($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDeletedDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearDeletedDate() => clearField(6);
}

