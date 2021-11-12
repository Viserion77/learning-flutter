import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:learning_flutter/http/interceptors/logging_interceptors.dart';

final Client client = InterceptedClient.build(interceptors: [
  LoggingInterceptor(),
]);
