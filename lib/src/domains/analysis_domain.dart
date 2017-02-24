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
  AnalysisRequest setAnalysisRoots(
    String id, {
    List<String> included: const [],
    List<String> excluded: const [],
    Map<String, String> packageRoots: const {},
  }) {
    _sink.writeln(new SetAnalysisRootsRequest(
      id,
      included: included,
      excluded: excluded,
      packageRoots: packageRoots,
    ));
    return null;
  }

  /// Return the errors associated with the file at the given [filePath].
  AnalysisRequest getErrors(String id, String filePath) {
    _sink.writeln(new GetErrorsRequest(id, filePath: filePath));
    return null;
  }
}
