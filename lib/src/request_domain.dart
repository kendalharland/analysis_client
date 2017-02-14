import 'dart:async';

import 'package:analysis_client/src/notification.dart';

abstract class RequestDomain {
  Stream<Notification> get notifications;
}
