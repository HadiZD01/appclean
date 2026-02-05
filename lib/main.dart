import 'package:appclean/core/di/dependency_injection.dart';
import 'package:appclean/core/routing/app_router.dart';
import 'package:appclean/doc_app.dart';
import 'package:flutter/material.dart';

void main() {
  setupDependencyInjection();
  runApp(DocApp(appRouter: AppRouter()));
}
