import 'dart:convert';
import 'package:analysis_client/src/domains/analysis_domain.dart';
import 'package:test/test.dart';

void main() {
  group('$AnalysisRequestDomain', () {
    StringBuffer clientOutput = new StringBuffer();
    AnalysisRequestDomain requestDomain;

    setUp(() {
      clientOutput = new StringBuffer();
      requestDomain = new AnalysisRequestDomain(clientOutput);
    });

    test('setAnalysisRoots should send danalysis roots to the server',
        () async {
      final requestId = 'A';
      final includedFiles = const ['/path/a'];
      final excludedFiles = const ['/path/c'];
      final packageRoots = const {'/path/d/': '/package/root/d'};

      await requestDomain.setAnalysisRoots(
        requestId,
        included: includedFiles,
        excluded: excludedFiles,
        packageRoots: packageRoots,
      );

      expect(
          clientOutput.toString(),
          JSON.encode({
                'id': requestId,
                'method': 'analysis.setAnalysisRoots',
                'params': {
                  'included': includedFiles,
                  'excluded': excludedFiles,
                  'packageRoots': packageRoots,
                }
              }) +
              '\n');
    });
  });
}
