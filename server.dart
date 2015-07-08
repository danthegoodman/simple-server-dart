import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_route/shelf_route.dart';

void main(List<String> args) {
  var r = router()
      ..get('/stress', _stressTest);

  io.serve(r.handler, '127.0.0.1', 10000).then((server) {
    print('Serving at http://${server.address.host}:${server.port}');
  });
}

Response _stressTest(Request request) {
  var json = JSON.encode(request.requestedUri.queryParameters);
  return new Response.ok(json, headers: {
    'content-type': 'application/json',
    'content-length': json.length,
  });
}
