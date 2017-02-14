import 'dart:async';

import 'package:analysis_client/src/entities.dart';
import 'package:analysis_client/src/notification.dart';
import 'package:analysis_client/src/request_domain.dart';

class AnalysisRequestDomain implements RequestDomain {
  final StringSink _sink;

  AnalysisRequestDomain(this._sink);

  @override
  Stream<Notification> get notifications => null;

  /// Sets the root paths used to determine which files to analyze.
  Future<Object> setAnalysisRoots(
    String id, {
    List<String> included: const [],
    List<String> excluded: const [],
    Map<String, String> packageRoots: const {},
  }) async {
    _sink.write(new SetAnalysisRootsRequest(
      id,
      included: included,
      excluded: excluded,
      packageRoots: packageRoots,
    ));
  }

  /// Return the errors associated with the file at the given [filePath].
  Future<Object> getErrors(String id, String filePath) async {
    _sink.write(new GetErrorsRequest(id, filePath: filePath));
  }
}
