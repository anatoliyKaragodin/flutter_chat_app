///
//  Generated code. Do not modify.
//  source: grpc_manager.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode('CgVFbXB0eQ==');
@$core.Deprecated('Use messageDescriptor instead')
const Message$json = const {
  '1': 'Message',
  '2': const [
    const {'1': 'senderId', '3': 1, '4': 1, '5': 5, '10': 'senderId'},
    const {'1': 'chatId', '3': 2, '4': 1, '5': 5, '10': 'chatId'},
    const {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'createdDate', '3': 4, '4': 1, '5': 9, '10': 'createdDate'},
    const {'1': 'messageId', '3': 5, '4': 1, '5': 5, '10': 'messageId'},
    const {'1': 'updatedDate', '3': 6, '4': 1, '5': 9, '10': 'updatedDate'},
    const {'1': 'deletedDate', '3': 7, '4': 1, '5': 9, '10': 'deletedDate'},
    const {'1': 'isRead', '3': 8, '4': 1, '5': 8, '10': 'isRead'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode('CgdNZXNzYWdlEhoKCHNlbmRlcklkGAEgASgFUghzZW5kZXJJZBIWCgZjaGF0SWQYAiABKAVSBmNoYXRJZBIYCgdjb250ZW50GAMgASgJUgdjb250ZW50EiAKC2NyZWF0ZWREYXRlGAQgASgJUgtjcmVhdGVkRGF0ZRIcCgltZXNzYWdlSWQYBSABKAVSCW1lc3NhZ2VJZBIgCgt1cGRhdGVkRGF0ZRgGIAEoCVILdXBkYXRlZERhdGUSIAoLZGVsZXRlZERhdGUYByABKAlSC2RlbGV0ZWREYXRlEhYKBmlzUmVhZBgIIAEoCFIGaXNSZWFk');
@$core.Deprecated('Use messageBaseDescriptor instead')
const MessageBase$json = const {
  '1': 'MessageBase',
  '2': const [
    const {'1': 'ok', '3': 1, '4': 1, '5': 8, '10': 'ok'},
    const {'1': 'messageId', '3': 2, '4': 1, '5': 5, '10': 'messageId'},
  ],
};

/// Descriptor for `MessageBase`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageBaseDescriptor = $convert.base64Decode('CgtNZXNzYWdlQmFzZRIOCgJvaxgBIAEoCFICb2sSHAoJbWVzc2FnZUlkGAIgASgFUgltZXNzYWdlSWQ=');
@$core.Deprecated('Use lastMessageDescriptor instead')
const LastMessage$json = const {
  '1': 'LastMessage',
  '2': const [
    const {'1': 'messageId', '3': 1, '4': 1, '5': 5, '10': 'messageId'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 5, '10': 'userId'},
  ],
};

/// Descriptor for `LastMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lastMessageDescriptor = $convert.base64Decode('CgtMYXN0TWVzc2FnZRIcCgltZXNzYWdlSWQYASABKAVSCW1lc3NhZ2VJZBIWCgZ1c2VySWQYAiABKAVSBnVzZXJJZA==');
@$core.Deprecated('Use messageFromBaseDescriptor instead')
const MessageFromBase$json = const {
  '1': 'MessageFromBase',
  '2': const [
    const {'1': 'chatId', '3': 1, '4': 1, '5': 5, '10': 'chatId'},
    const {'1': 'senderId', '3': 2, '4': 1, '5': 5, '10': 'senderId'},
    const {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'createdDate', '3': 4, '4': 1, '5': 9, '10': 'createdDate'},
    const {'1': 'updatedDate', '3': 5, '4': 1, '5': 9, '10': 'updatedDate'},
    const {'1': 'deletedDate', '3': 6, '4': 1, '5': 9, '10': 'deletedDate'},
  ],
};

/// Descriptor for `MessageFromBase`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageFromBaseDescriptor = $convert.base64Decode('Cg9NZXNzYWdlRnJvbUJhc2USFgoGY2hhdElkGAEgASgFUgZjaGF0SWQSGgoIc2VuZGVySWQYAiABKAVSCHNlbmRlcklkEhgKB2NvbnRlbnQYAyABKAlSB2NvbnRlbnQSIAoLY3JlYXRlZERhdGUYBCABKAlSC2NyZWF0ZWREYXRlEiAKC3VwZGF0ZWREYXRlGAUgASgJUgt1cGRhdGVkRGF0ZRIgCgtkZWxldGVkRGF0ZRgGIAEoCVILZGVsZXRlZERhdGU=');
