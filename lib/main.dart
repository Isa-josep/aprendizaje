import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aprendizaje/config/router/app_router.dart';
void main() {
  runApp(
    const ProviderScope(
      child: MainApp()
    )
  );
}


class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  MaterialApp.router(
      title: "Widgets",
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
