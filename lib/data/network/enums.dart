// ignore_for_file: constant_identifier_names

enum HttpMethod {
  GET('get'),
  POST('post'),
  DELETE('delete'),
  PUT('put'),
  PATCH('patch');

  const HttpMethod(this.method);
  final String method;

  @override
  String toString() => method;
}
