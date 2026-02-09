import 'package:appclean/core/di/dependency_injection.dart';
import 'package:appclean/core/routing/app_router.dart';
import 'package:appclean/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setupDependencyInjection();
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(appRouter: AppRouter()));
}
