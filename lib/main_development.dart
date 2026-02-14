// 
import 'package:appclean/core/di/dependency_injection.dart';
import 'package:appclean/core/routing/app_router.dart';
import 'package:appclean/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart'; // مهم من أجل kReleaseMode

void main() async {
  // تأكد من تهيئة الـ Widgets قبل أي عمليات async
  WidgetsFlutterBinding.ensureInitialized();
  
  setupDependencyInjection();
  await ScreenUtil.ensureScreenSize();

  runApp(
    DevicePreview(
      // سيعمل فقط في وضع الـ Debug ولن يظهر في النسخة النهائية
      enabled: !kReleaseMode, 
      builder: (context) => DocApp(appRouter: AppRouter()),
    ),
  );
}