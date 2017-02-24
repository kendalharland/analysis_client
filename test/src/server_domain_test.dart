import 'dart:convert';
import 'package:analysis_client/src/domains/server_domain.dart';
import 'package:test/test.dart';

void main() {
  group('$ServerRequestDomain', () {
    StringBuffer clientOutput = new StringBuffer();
    ServerRequestDomain requestDomain;

    setUp(() {
      clientOutput = new StringBuffer();
      requestDomain = new ServerRequestDomain(clientOutput);
    });

    test('shutdown should request to shutdown the server', () async {
      final requestId = 'A';

      await requestDomain.shutdown(requestId);
      expect(
          clientOutput.toString(),
          JSON.encode({
                'id': requestId,
                'method': 'server.shutdown',
              }) +
              '\n');
    });
  });
}
