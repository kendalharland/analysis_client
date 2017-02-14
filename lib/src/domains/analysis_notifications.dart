import 'dart:io';

import 'package:analysis_client/src/notification.dart';
import 'package:meta/meta.dart';

class AnalyzedFiles implements Notification {
  /// The list of paths of files that are being analyzed.
  final List<String> directories;

  AnalyzedFiles(this.directories);

  String get event => 'analysis.analyzedFiles';
}

class Errors implements Notification {
  /// The errors contained in the file
  final List<Object> errors;

  Errors(this.errors);

  @override
  String get event => 'analysis.errors';
}

class FlushResults implements Notification {
  final List<String> files;

  FlushResults(this.files);

  @override
  String get event => 'analysis.flushResults';
}

class Folding implements Notification {
  final File file;
  final Object foldingRegion;

  Folding({
    @required this.file,
    @required this.foldingRegion,
  });

  @override
  String get event => 'analysis.folding';
}

class Highlights implements Notification {
  final File file;
  final Object regions;

  Highlights({
    @required this.file,
    @required this.regions,
  });

  @override
  String get event => 'analysis.highlights';
}

class Implemented implements Notification {
  final File file;
  final List<Object> classes;
  final List<Object> members;

  Implemented({
    @required this.file,
    @required this.classes,
    @required this.members,
  });

  @override
  String get event => "analysis.implemented";
}

class Invalidate implements Notification {
  final File file;
  final int offset;
  final int length;
  final int delta;

  Invalidate({
    @required this.file,
    @required this.offset,
    @required this.length,
    @required this.delta,
  });

  @override
  String get event => 'analysis.invalidate';
}
