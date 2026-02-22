import 'package:appclean/core/di/dependency_injection.dart';
import 'package:appclean/core/helpers/constants.dart';
import 'package:appclean/core/helpers/extensions.dart';
import 'package:appclean/core/helpers/shared_pref_helper.dart';
import 'package:appclean/core/routing/app_router.dart';
import 'package:appclean/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setupDependencyInjection();
  await ScreenUtil.ensureScreenSize();
  await checkedIfLoggedInUser();
  runApp(DocApp(appRouter: AppRouter()));
}

checkedIfLoggedInUser() async {
  String userToken = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (userToken.isNullOrEmpty()) {
    isLoggedIn = false;
  } else {
    isLoggedIn = true;
  }
}
