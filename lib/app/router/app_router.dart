import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/send_money/presentation/pages/send_money_page.dart';
import '../../features/transactions/presentation/pages/transactions_page.dart';
import '../../features/wallet/presentation/pages/dashboard_page.dart';

import 'route_names.dart';
import 'route_paths.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: RoutePaths.login,
    routes: [
      GoRoute(
        path: RoutePaths.login,
        name: RouteNames.login,
        builder: (_, __) => const LoginPage(),
      ),
      GoRoute(
        path: RoutePaths.dashboard,
        name: RouteNames.dashboard,
        builder: (_, __) => const DashboardPage(),
        routes: [
          GoRoute(
            path: RoutePaths.sendMoney,
            name: RouteNames.sendMoney,
            builder: (_, __) => const SendMoneyPage(),
          ),
          GoRoute(
            path: RoutePaths.transactions,
            name: RouteNames.transactions,
            builder: (_, __) => const TransactionsPage(),
          ),
        ]
      ),
    ],
  );
}