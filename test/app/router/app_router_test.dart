import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:send_money/app/router/app_router.dart';
import 'package:send_money/app/router/route_paths.dart';

void main() {
  late GoRouter router;

  setUp(() {
    router = AppRouter.router;
  });

  test('initial route should be login', () {
    expect(router.routeInformationProvider!.value.uri.toString(), RoutePaths.login);
  });

  test('dashboard route should exist', () {
    final match = router.configuration.findMatch(
      Uri.parse(RoutePaths.dashboard),
    );

    expect(match.matches.isNotEmpty, true);
  });

  test('send money route should exist', () {
    final match = router.configuration.findMatch(
      Uri.parse(RoutePaths.dashboard + RoutePaths.sendMoney),
    );

    expect(match.matches.isNotEmpty, true);
  });

  test('transactions route should exist', () {
    final match = router.configuration.findMatch(
      Uri.parse(RoutePaths.dashboard + RoutePaths.transactions),
    );

    expect(match.matches.isNotEmpty, true);
  });
}