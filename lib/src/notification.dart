import 'package:semver/semver.dart';
import 'package:meta/meta.dart';

abstract class Notification {
  final String event;

  const Notification._(String eventSuffix) : event = 'server.$eventSuffix';
}

class ServerConnected extends Notification {
  final SemanticVersion version;
  final int pid;
  final String sessionId;

  ServerConnected({
    @required this.version,
    @required this.pid,
    @required this.sessionId,
  })
      : super._('connected');
}

class ServerError extends Notification {
  final bool isFatal;
  final String message;
  final StackTrace stackTrace;

  const ServerError({
    @required this.isFatal,
    @required this.message,
    @required this.stackTrace,
  })
      : super._('error');
}

class ServerStatus extends Notification {
  // TODO: Update data types when package:analysis_server is published.
  final Object analysisStatus;
  final Object pubStatus;

  ServerStatus({
    @required this.analysisStatus,
    @required this.pubStatus,
  })
      : super._('status');
}
