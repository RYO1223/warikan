// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../data/model/group/group.dart' as _i7;
import '../../data/model/payment/payment.dart' as _i6;
import '../add_payment/add_payment_page.dart' as _i2;
import '../edit_payment/edit_payment_page.dart' as _i3;
import '../home/home_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    AddPaymentRoute.name: (routeData) {
      final args = routeData.argsAs<AddPaymentRouteArgs>();
      return _i4.MaterialPageX<_i6.Payment>(
          routeData: routeData,
          child: _i2.AddPaymentPage(key: args.key, group: args.group));
    },
    EditPaymentRoute.name: (routeData) {
      final args = routeData.argsAs<EditPaymentRouteArgs>();
      return _i4.MaterialPageX<_i6.Payment>(
          routeData: routeData,
          child: _i3.EditPaymentPage(key: args.key, payment: args.payment));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(HomeRoute.name, path: '/'),
        _i4.RouteConfig(AddPaymentRoute.name, path: '/add-payment-page'),
        _i4.RouteConfig(EditPaymentRoute.name, path: '/edit-payment-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.AddPaymentPage]
class AddPaymentRoute extends _i4.PageRouteInfo<AddPaymentRouteArgs> {
  AddPaymentRoute({_i5.Key? key, required _i7.Group group})
      : super(AddPaymentRoute.name,
            path: '/add-payment-page',
            args: AddPaymentRouteArgs(key: key, group: group));

  static const String name = 'AddPaymentRoute';
}

class AddPaymentRouteArgs {
  const AddPaymentRouteArgs({this.key, required this.group});

  final _i5.Key? key;

  final _i7.Group group;

  @override
  String toString() {
    return 'AddPaymentRouteArgs{key: $key, group: $group}';
  }
}

/// generated route for
/// [_i3.EditPaymentPage]
class EditPaymentRoute extends _i4.PageRouteInfo<EditPaymentRouteArgs> {
  EditPaymentRoute({_i5.Key? key, required _i6.Payment payment})
      : super(EditPaymentRoute.name,
            path: '/edit-payment-page',
            args: EditPaymentRouteArgs(key: key, payment: payment));

  static const String name = 'EditPaymentRoute';
}

class EditPaymentRouteArgs {
  const EditPaymentRouteArgs({this.key, required this.payment});

  final _i5.Key? key;

  final _i6.Payment payment;

  @override
  String toString() {
    return 'EditPaymentRouteArgs{key: $key, payment: $payment}';
  }
}
