import 'package:routefly/routefly.dart';

import 'app/app_page.dart' as a0;
import 'app/drives/drives_page.dart' as a1;
import 'app/jump/jump_page.dart' as a2;
import 'app/topics/topics_page.dart' as a3;
import 'app/work/work_page.dart' as a4;

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/',
    uri: Uri.parse('/'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.AppPage(),
    ),
  ),
  RouteEntity(
    key: '/drives',
    uri: Uri.parse('/drives'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.DrivesPage(),
    ),
  ),
  RouteEntity(
    key: '/jump',
    uri: Uri.parse('/jump'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a2.JumpPage(),
    ),
  ),
  RouteEntity(
    key: '/topics',
    uri: Uri.parse('/topics'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a3.TopicsPage(),
    ),
  ),
  RouteEntity(
    key: '/work',
    uri: Uri.parse('/work'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a4.WorkPage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  drives: '/drives',
  jump: '/jump',
  topics: '/topics',
  work: '/work',
);
