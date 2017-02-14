import 'package:analysis_client/src/domains/analysis_domain.dart';
import 'package:analysis_client/src/domains/server_domain.dart';

/// A client for the dart analysis server.
///
/// To learn more about the analysis server api see:
/// https://htmlpreview.github.io/?https://github.com/dart-lang/sdk/blob/
/// master/pkg/analysis_server/doc/api.html
class AnalysisServer {
  /// The domain for server requests.
  final ServerRequestDomain server;

  /// The domain for analysis requests.
  final AnalysisRequestDomain analysis;

  /// [cmdSink] is the sink for writing commands to the analysis server.
  AnalysisServer(StringSink cmdSink)
      : analysis = new AnalysisRequestDomain(cmdSink),
        server = new ServerRequestDomain(cmdSink);
}
