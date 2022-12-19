///
//  Generated code. Do not modify.
//  source: grpcsynh.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'grpcsynh.pb.dart' as $0;
export 'grpcsynh.pb.dart';

class GrpcSynchronizationClient extends $grpc.Client {
  static final _$getUsersSynh =
      $grpc.ClientMethod<$0.SynhMainUser, $0.DataDBResponse>(
          '/GrpcSynchronization/getUsersSynh',
          ($0.SynhMainUser value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.DataDBResponse.fromBuffer(value));

  GrpcSynchronizationClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.DataDBResponse> getUsersSynh($0.SynhMainUser request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUsersSynh, request, options: options);
  }
}

abstract class GrpcSynchronizationServiceBase extends $grpc.Service {
  $core.String get $name => 'GrpcSynchronization';

  GrpcSynchronizationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SynhMainUser, $0.DataDBResponse>(
        'getUsersSynh',
        getUsersSynh_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SynhMainUser.fromBuffer(value),
        ($0.DataDBResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.DataDBResponse> getUsersSynh_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SynhMainUser> request) async {
    return getUsersSynh(call, await request);
  }

  $async.Future<$0.DataDBResponse> getUsersSynh(
      $grpc.ServiceCall call, $0.SynhMainUser request);
}
