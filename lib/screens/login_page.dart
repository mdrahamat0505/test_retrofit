// ignore_for_file: dead_code

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_app/components/app_text_form_field.dart';
import 'package:test_app/di/interjection_service.dart';
import 'package:test_app/log_in/repository/login_repository.dart';
import 'package:test_app/log_in/use_case/get_login_use_case.dart';
import 'package:test_app/models/user_data.dart';
import 'package:test_app/network/api_client.dart';
import 'package:test_app/services/local_storage.dart';
import 'package:test_app/utils/const_string.dart';
import 'package:test_app/utils/common_widgets/gradient_background.dart';
import 'package:test_app/utils/helpers/nevigation_helper.dart';
import 'package:test_app/utils/helpers/snackbar_helper.dart';
import 'package:test_app/values/app_constants.dart';
import 'package:test_app/values/app_regex.dart';
import 'package:test_app/values/app_routes.dart';
import 'package:test_app/values/app_strings.dart';
import 'package:test_app/values/app_theme.dart';

import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> passwordNotifier = ValueNotifier(true);
  final ValueNotifier<bool> fieldValidNotifier = ValueNotifier(false);

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  void initializeControllers() {
    emailController = TextEditingController()..addListener(controllerListener);
    passwordController = TextEditingController()
      ..addListener(controllerListener);
  }

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }

  void controllerListener() {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty && password.isEmpty) return;

    if (AppRegex.emailRegex.hasMatch(email) && password.isNotEmpty) {
      fieldValidNotifier.value = true;
    } else {
      fieldValidNotifier.value = false;
    }
  }

  @override
  void initState() {
    initializeControllers();
    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const GradientBackground(
            children: [
              Text(
                AppStrings.signInToYourNAccount,
                style: AppTheme.titleLarge,
              ),
              SizedBox(height: 6),
              Text(AppStrings.signInToYourAccount, style: AppTheme.bodySmall),
            ],
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppTextFormField(
                    controller: emailController,
                    labelText: AppStrings.email,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onChanged: (_) => _formKey.currentState?.validate(),
                    validator: (value) {
                      return value!.isEmpty
                          ? AppStrings.pleaseEnterEmailAddress
                          : AppConstants.emailRegex.hasMatch(value)
                              ? null
                              : AppStrings.invalidEmailAddress;
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: passwordNotifier,
                    builder: (_, passwordObscure, __) {
                      return AppTextFormField(
                        obscureText: passwordObscure,
                        controller: passwordController,
                        labelText: AppStrings.password,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (_) => _formKey.currentState?.validate(),
                        validator: (value) {
                          return value!.isEmpty
                              ? AppStrings.pleaseEnterPassword
                              : AppConstants.passwordRegex.hasMatch(value)
                                  ? null
                                  : AppStrings.invalidPassword;
                        },
                        suffixIcon: IconButton(
                          onPressed: () =>
                              passwordNotifier.value = !passwordObscure,
                          style: IconButton.styleFrom(
                            minimumSize: const Size.square(48),
                          ),
                          icon: Icon(
                            passwordObscure
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ValueListenableBuilder(
                    valueListenable: fieldValidNotifier,
                    builder: (_, isValid, __) {
                      return FilledButton(
                        onPressed: isValid
                            ? () async {
                                final _restClient = di.get<RestClient>();

                                var map = {
                                  "email": emailController.text,
                                  "password": passwordController.text
                                };
                                var jsonData = await _restClient.login(map);

                                if (jsonData != null) {
                                  UserData userData =
                                      UserData.fromJson(jsonData);

                                  final _localStorage = di.get<LocalStorage>();
                                  _localStorage
                                      .setToken('${userData.data?.Token}');

                                  NavigationHelper.pushReplacementNamed(
                                    AppRoutes.allUser,
                                  );

                                  SnackbarHelper.showSnackBar(
                                    AppStrings.loggedIn,
                                  );

                                  log('True');
                                } else {
                                  log('false');
                                }
                                //GetLoginUseCase? ise

                                // LoginRepository? repository;
                                // GetLoginUseCase? apiService ;
                                //
                                //
                                // final response = await apiService?.call(map: map);
                                //
                                // repository?.getLogin(map: map);

                                // emailController.clear();
                                // passwordController.clear();
                              }
                            : null,
                        child: const Text(AppStrings.login),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.doNotHaveAnAccount,
                style: AppTheme.bodySmall.copyWith(color: Colors.black),
              ),
              TextButton(
                onPressed: () => NavigationHelper.pushReplacementNamed(
                  AppRoutes.register,
                ),
                child: const Text(AppStrings.register),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
