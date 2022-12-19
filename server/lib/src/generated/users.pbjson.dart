///
//  Generated code. Do not modify.
//  source: users.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use userModelDescriptor instead')
const UserModel$json = const {
  '1': 'UserModel',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'profilePicUrl', '3': 4, '4': 1, '5': 9, '10': 'profilePicUrl'},
    const {'1': 'password', '3': 5, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'createdDate', '3': 6, '4': 1, '5': 9, '10': 'createdDate'},
    const {'1': 'updatedDate', '3': 7, '4': 1, '5': 9, '10': 'updatedDate'},
    const {'1': 'deletedDate', '3': 8, '4': 1, '5': 9, '10': 'deletedDate'},
  ],
};

/// Descriptor for `UserModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userModelDescriptor = $convert.base64Decode('CglVc2VyTW9kZWwSDgoCaWQYASABKAVSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSFAoFZW1haWwYAyABKAlSBWVtYWlsEiQKDXByb2ZpbGVQaWNVcmwYBCABKAlSDXByb2ZpbGVQaWNVcmwSGgoIcGFzc3dvcmQYBSABKAlSCHBhc3N3b3JkEiAKC2NyZWF0ZWREYXRlGAYgASgJUgtjcmVhdGVkRGF0ZRIgCgt1cGRhdGVkRGF0ZRgHIAEoCVILdXBkYXRlZERhdGUSIAoLZGVsZXRlZERhdGUYCCABKAlSC2RlbGV0ZWREYXRl');
@$core.Deprecated('Use getUserRequestDescriptor instead')
const GetUserRequest$json = const {
  '1': 'GetUserRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'createdDate', '3': 4, '4': 1, '5': 9, '10': 'createdDate'},
  ],
};

/// Descriptor for `GetUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserRequestDescriptor = $convert.base64Decode('Cg5HZXRVc2VyUmVxdWVzdBIOCgJpZBgBIAEoBVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIUCgVlbWFpbBgDIAEoCVIFZW1haWwSIAoLY3JlYXRlZERhdGUYBCABKAlSC2NyZWF0ZWREYXRl');
@$core.Deprecated('Use getUserResponseDescriptor instead')
const GetUserResponse$json = const {
  '1': 'GetUserResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'updatedDate', '3': 2, '4': 1, '5': 9, '10': 'updatedDate'},
    const {'1': 'deletedDate', '3': 3, '4': 1, '5': 9, '10': 'deletedDate'},
  ],
};

/// Descriptor for `GetUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserResponseDescriptor = $convert.base64Decode('Cg9HZXRVc2VyUmVzcG9uc2USDgoCaWQYASABKAVSAmlkEiAKC3VwZGF0ZWREYXRlGAIgASgJUgt1cGRhdGVkRGF0ZRIgCgtkZWxldGVkRGF0ZRgDIAEoCVILZGVsZXRlZERhdGU=');
@$core.Deprecated('Use createUserRequestDescriptor instead')
const CreateUserRequest$json = const {
  '1': 'CreateUserRequest',
  '2': const [
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'profilePicUrl', '3': 4, '4': 1, '5': 9, '10': 'profilePicUrl'},
    const {'1': 'password', '3': 5, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'createdDate', '3': 6, '4': 1, '5': 9, '10': 'createdDate'},
  ],
};

/// Descriptor for `CreateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserRequestDescriptor = $convert.base64Decode('ChFDcmVhdGVVc2VyUmVxdWVzdBISCgRuYW1lGAIgASgJUgRuYW1lEhQKBWVtYWlsGAMgASgJUgVlbWFpbBIkCg1wcm9maWxlUGljVXJsGAQgASgJUg1wcm9maWxlUGljVXJsEhoKCHBhc3N3b3JkGAUgASgJUghwYXNzd29yZBIgCgtjcmVhdGVkRGF0ZRgGIAEoCVILY3JlYXRlZERhdGU=');
@$core.Deprecated('Use createUserResponseDescriptor instead')
const CreateUserResponse$json = const {
  '1': 'CreateUserResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'profilePicUrl', '3': 4, '4': 1, '5': 9, '10': 'profilePicUrl'},
    const {'1': 'createdDate', '3': 5, '4': 1, '5': 9, '10': 'createdDate'},
  ],
};

/// Descriptor for `CreateUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserResponseDescriptor = $convert.base64Decode('ChJDcmVhdGVVc2VyUmVzcG9uc2USDgoCaWQYASABKAVSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSFAoFZW1haWwYAyABKAlSBWVtYWlsEiQKDXByb2ZpbGVQaWNVcmwYBCABKAlSDXByb2ZpbGVQaWNVcmwSIAoLY3JlYXRlZERhdGUYBSABKAlSC2NyZWF0ZWREYXRl');
@$core.Deprecated('Use updateUserRequestDescriptor instead')
const UpdateUserRequest$json = const {
  '1': 'UpdateUserRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'profilePicUrl', '3': 4, '4': 1, '5': 9, '10': 'profilePicUrl'},
    const {'1': 'password', '3': 5, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `UpdateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserRequestDescriptor = $convert.base64Decode('ChFVcGRhdGVVc2VyUmVxdWVzdBIOCgJpZBgBIAEoBVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIUCgVlbWFpbBgDIAEoCVIFZW1haWwSJAoNcHJvZmlsZVBpY1VybBgEIAEoCVINcHJvZmlsZVBpY1VybBIaCghwYXNzd29yZBgFIAEoCVIIcGFzc3dvcmQ=');
@$core.Deprecated('Use updateUserResponseDescriptor instead')
const UpdateUserResponse$json = const {
  '1': 'UpdateUserResponse',
  '2': const [
    const {'1': 'dateUpdated', '3': 1, '4': 1, '5': 9, '10': 'dateUpdated'},
    const {'1': 'isUpdated', '3': 2, '4': 1, '5': 8, '10': 'isUpdated'},
  ],
};

/// Descriptor for `UpdateUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserResponseDescriptor = $convert.base64Decode('ChJVcGRhdGVVc2VyUmVzcG9uc2USIAoLZGF0ZVVwZGF0ZWQYASABKAlSC2RhdGVVcGRhdGVkEhwKCWlzVXBkYXRlZBgCIAEoCFIJaXNVcGRhdGVk');
@$core.Deprecated('Use deleteUserRequestDescriptor instead')
const DeleteUserRequest$json = const {
  '1': 'DeleteUserRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'dateDeleted', '3': 2, '4': 1, '5': 9, '10': 'dateDeleted'},
  ],
};

/// Descriptor for `DeleteUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserRequestDescriptor = $convert.base64Decode('ChFEZWxldGVVc2VyUmVxdWVzdBIOCgJpZBgBIAEoBVICaWQSIAoLZGF0ZURlbGV0ZWQYAiABKAlSC2RhdGVEZWxldGVk');
@$core.Deprecated('Use deleteUserResponseDescriptor instead')
const DeleteUserResponse$json = const {
  '1': 'DeleteUserResponse',
  '2': const [
    const {'1': 'isDeleted', '3': 1, '4': 1, '5': 8, '10': 'isDeleted'},
  ],
};

/// Descriptor for `DeleteUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserResponseDescriptor = $convert.base64Decode('ChJEZWxldGVVc2VyUmVzcG9uc2USHAoJaXNEZWxldGVkGAEgASgIUglpc0RlbGV0ZWQ=');
