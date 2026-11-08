// Optional mock backend for the J'Donuts app. No packages needed.
//
//   dart run tool/mock_server/bin/server.dart [port]
//
// GET /v1/health          -> {"data":{"ok":true},"error":null,"meta":{...}}
// GET /v1/catalog         -> {"data": <seed.json + served image URLs>, "error":null, "meta":{...}}
// GET /images/<file>.png  -> bundled placeholder art (so the app's disk image
//                            cache has real network images to cache)
//
// Each catalog response bumps the member's unread notifications so a refresh
// is visible in the app. Add ?fail=1 to see the error envelope, ?delay=ms to
// simulate latency.
import 'dart:convert';
import 'dart:io';

const int _defaultPort = 8080;

Future<void> main(List<String> args) async {
  final port = args.isNotEmpty ? int.parse(args.first) : _defaultPort;
  final server = await HttpServer.bind(InternetAddress.anyIPv4, port);
  stdout.writeln('Mock server on http://localhost:$port');
  var served = 0;

  await for (final request in server) {
    final path = request.uri.path;
    try {
      if (path == '/v1/health') {
        _json(request, _envelope({'ok': true}, served));
      } else if (path == '/v1/catalog') {
        await _catalog(request, ++served);
      } else if (path.startsWith('/images/')) {
        await _image(request, path.substring('/images/'.length));
      } else {
        request.response.statusCode = HttpStatus.notFound;
        await request.response.close();
      }
    } on Object catch (e) {
      request.response.statusCode = HttpStatus.internalServerError;
      request.response.write('$e');
      await request.response.close();
    }
  }
}

Future<void> _catalog(HttpRequest request, int served) async {
  final delay = int.tryParse(request.uri.queryParameters['delay'] ?? '') ?? 0;
  if (delay > 0) await Future<void>.delayed(Duration(milliseconds: delay));
  if (request.uri.queryParameters['fail'] == '1') {
    request.response.statusCode = HttpStatus.internalServerError;
    _json(request, {
      'data': null,
      'error': 'Simulated failure',
      'meta': {'served': served},
    });
    return;
  }
  final seed = jsonDecode(
    await File('assets/seed/seed.json').readAsString(),
  ) as Map<String, dynamic>;
  final host =
      'http://${request.headers.host}:${request.connectionInfo?.localPort}';
  _rewriteImages(seed, host);
  final member = seed['member'] as Map<String, dynamic>;
  member['unreadNotifications'] =
      (member['unreadNotifications'] as int) + served;
  _json(request, _envelope(seed, served));
}

/// Points each entity's `imageUrl` at this server's /images route.
void _rewriteImages(Map<String, dynamic> seed, String host) {
  for (final key in ['banners', 'products', 'shops']) {
    for (final item in (seed[key] as List).cast<Map<String, dynamic>>()) {
      final file = (item['imageAsset'] as String).split('/').last;
      item['imageUrl'] = '$host/images/$file';
    }
  }
}

Future<void> _image(HttpRequest request, String name) async {
  final file = File('assets/images/${name.replaceAll('/', '')}');
  if (!await file.exists()) {
    request.response.statusCode = HttpStatus.notFound;
    await request.response.close();
    return;
  }
  request.response.headers
    ..contentType = ContentType('image', 'png')
    ..set('Cache-Control', 'public, max-age=86400');
  await request.response.addStream(file.openRead());
  await request.response.close();
}

Map<String, dynamic> _envelope(Object data, int served) => {
  'data': data,
  'error': null,
  'meta': {
    'version': 1,
    'served': served,
    'generatedAt': DateTime.now().toUtc().toIso8601String(),
  },
};

void _json(HttpRequest request, Map<String, dynamic> body) {
  request.response
    ..headers.contentType = ContentType.json
    ..write(jsonEncode(body));
  request.response.close();
}
