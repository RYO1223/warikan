import 'package:auto_route/auto_route.dart';
import 'package:warikan/ui/add_payment/add_payment_page.dart';
import 'package:warikan/ui/home/home_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: AddPaymentPage),
  ],
)
class $AppRouter {}
