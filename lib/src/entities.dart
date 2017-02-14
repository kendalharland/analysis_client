import 'dart:convert';
import 'package:meta/meta.dart';

abstract class Entity {
  final String id;

  const Entity._(this.id);

  /// Converts this entity to a JSON compatible object.
  toJson();

  @override
  String toString() => JSON.encode(toJson()).trim();
}

class ShutdownRequest extends Entity {
  const ShutdownRequest(String id) : super._(id);

  @override
  Map<String, String> toJson() => <String, String>{
        'id': id,
        'method': 'server.shutdown',
      };
}

class SetAnalysisRootsRequest extends Entity {
  final List<String> included;
  final List<String> excluded;
  final Map<String, String> packageRoots;

  const SetAnalysisRootsRequest(
    String id, {
    this.included: const [],
    this.excluded: const [],
    this.packageRoots: const {},
  })
      : super._(id);

  @override
  Map<String, Object> toJson() => {
        'id': id,
        'method': 'analysis.setAnalysisRoots',
        'params': {
          'included': included,
          'excluded': excluded,
          'packageRoots': packageRoots,
        }
      };
}

class GetErrorsRequest extends Entity {
  final String filePath;

  GetErrorsRequest(
    String id, {
    @required this.filePath,
  })
      : super._(id);

  @override
  Map<String, Object> toJson() => {
        'id': id,
        'method': 'analysis.getErrors',
        'params': {'file': filePath},
      };
}
