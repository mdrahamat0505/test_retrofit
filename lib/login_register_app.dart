import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/logIn/bloc/login_bloc.dart';

import 'routes.dart';
import 'utils/helpers/nevigation_helper.dart';
import 'utils/helpers/snackbar_helper.dart';
import 'values/app_routes.dart';
import 'values/app_strings.dart';
import 'values/app_theme.dart';

class LoginRegisterApp extends StatelessWidget {
  const LoginRegisterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.loginAndRegister,
        theme: AppTheme.themeData,
        initialRoute: AppRoutes.login,
        scaffoldMessengerKey: SnackbarHelper.key,
        navigatorKey: NavigationHelper.key,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
