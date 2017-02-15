import 'dart:async';

import 'package:analysis_client/src/notification.dart';
import 'package:analysis_client/src/request_domain.dart';
import 'package:analysis_client/src/entities.dart';

class ServerRequestDomain implements RequestDomain {
  final StringSink _sink;

  ServerRequestDomain(this._sink);

  @override
  Stream<Notification> get notifications => null;

  /// Sends a request to shutdown the server.
  AnalysisRequest shutdown(String id) {
    _sink.writeln(new ShutdownRequest(id));
  }
}
