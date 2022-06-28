// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../data/model/group/group.dart' as _i5;
import '../../data/model/payment/payment.dart' as _i6;
import '../add_payment/add_payment_page.dart' as _i2;
import '../home/home_page.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    AddPaymentRoute.name: (routeData) {
      final args = routeData.argsAs<AddPaymentRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.AddPaymentPage(
              key: args.key,
              group: args.group,
              addPaymentToHomeState: args.addPaymentToHomeState));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(HomeRoute.name, path: '/'),
        _i3.RouteConfig(AddPaymentRoute.name, path: '/add-payment-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.AddPaymentPage]
class AddPaymentRoute extends _i3.PageRouteInfo<AddPaymentRouteArgs> {
  AddPaymentRoute(
      {_i4.Key? key,
      required _i5.Group group,
      required void Function(_i6.Payment) addPaymentToHomeState})
      : super(AddPaymentRoute.name,
            path: '/add-payment-page',
            args: AddPaymentRouteArgs(
                key: key,
                group: group,
                addPaymentToHomeState: addPaymentToHomeState));

  static const String name = 'AddPaymentRoute';
}

class AddPaymentRouteArgs {
  const AddPaymentRouteArgs(
      {this.key, required this.group, required this.addPaymentToHomeState});

  final _i4.Key? key;

  final _i5.Group group;

  final void Function(_i6.Payment) addPaymentToHomeState;

  @override
  String toString() {
    return 'AddPaymentRouteArgs{key: $key, group: $group, addPaymentToHomeState: $addPaymentToHomeState}';
  }
}
