import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fwc_album_app/app/models/register_user_model.dart';
import 'package:fwc_album_app/app/pages/auth/register/view/register_view.dart';
import 'package:fwc_album_app/app/repository/auth/auth_repository.dart';

import './register_presenter.dart';

class RegisterPresenterImpl implements RegisterPresenter {
  late final RegisterView _view;
  final AuthRepository authRepository;

  RegisterPresenterImpl({required this.authRepository});

  @override
  Future<void> register(
      {required String name,
      required String email,
      required String password,
      required String confirmPassword}) async {
    final userModel = RegisterUserModel(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
    try {
      await authRepository.register(userModel);
      _view.registerSuccess();
    } on DioError catch (e, s) {
      log('Erro ao cadastrar usuário', error: e, stackTrace: s);
    }
  }

  @override
  set view(RegisterView view) => _view = view;
}
