import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

class Service {
  Response hello(Request req) {
    return Response.ok('Hello World');
  }

  Response greet(Request request, String greet) {
    return Response.ok('Hello $greet');
  }
}

class Route {
  final service = Service();
  final router = Router();

  Handler get handler {
    router.get('/', service.hello);
    router.get('/greet/<greet>', service.greet);

    return router;
  }
}

void main() async {
  final route = Route();

  await shelf_io.serve(route.handler, 'localhost', 8080);
}
