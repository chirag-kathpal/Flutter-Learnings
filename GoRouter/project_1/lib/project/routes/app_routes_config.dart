import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_1/pages/about.dart';
import 'package:project_1/pages/contact_us.dart';
import 'package:project_1/pages/error_page.dart';
import 'package:project_1/pages/homepage.dart';
import 'package:project_1/pages/profile.dart';
import 'package:project_1/project/routes/app_routes_constants.dart';

class MyAppRouter {
  static GoRouter returnRouter(bool isAuth) {
    GoRouter router = GoRouter(
      routes: [
        GoRoute(
          name: MyAppRouteConstants.homeRouteName,
          path: '/',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: MyHomePage(),
            );
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.profileRouteName,
          path: '/profile/:userName/:userId',
          pageBuilder: (context, state) {
            return MaterialPage(
              child: Profile(
                userName: state.params['userName']!,
                userId: state.params['userId']!,
              ),
            );
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.aboutRouteName,
          path: '/about',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: About(),
            );
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.contactUsRouteName,
          path: '/contact_us',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: ContactUs(),
            );
          },
        ),
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(
          child: ErrorPage(),
        );
      },
      redirect: (context, state) {
        if (!isAuth &&
            state.location
                .startsWith('/${MyAppRouteConstants.profileRouteName}')) {
          return context.namedLocation(MyAppRouteConstants.contactUsRouteName);
        } else {
          return null;
        }
      },
    );
    return router;
  }
}
