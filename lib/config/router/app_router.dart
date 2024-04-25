import 'package:aprendizaje/presentation/screns.dart';
import 'package:go_router/go_router.dart';


final appRouter = GoRouter(
  initialLocation: '/m',
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const Test(),
    ),

    GoRoute(
      path: '/h',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/m',
      builder: (context, state) => const Memorama(),
    ),
    
    GoRoute(
      path: '/d',
      builder: (context, state) => const DesafiosScreen(),
    ),
  ],
);
