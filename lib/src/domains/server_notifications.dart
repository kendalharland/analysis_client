import 'package:analysis_client/src/notification.dart';
import 'package:meta/meta.dart';
import 'package:semver/semver.dart';

class ServerConnected implements Notification {
  final SemanticVersion version;
  final int pid;
  final String sessionId;

  ServerConnected({
    @required this.version,
    @required this.pid,
    @required this.sessionId,
  });

  @override
  String get event => 'server.connected';
}

class ServerError implements Notification {
  final bool isFatal;
  final String message;
  final StackTrace stackTrace;

  ServerError({
    @required this.isFatal,
    @required this.message,
    @required this.stackTrace,
  });

  String get event => 'server.error';
}

class ServerStatus implements Notification {
  // TODO: Update data types when package:analysis_server is published.
  final Object analysisStatus;
  final Object pubStatus;

  ServerStatus({
    @required this.analysisStatus,
    @required this.pubStatus,
  });

  String get event => 'server.status';
}
