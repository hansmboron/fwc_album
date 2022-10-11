// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/auth/register/presenter/register_presenter.dart';
import 'package:fwc_album_app/app/pages/auth/register/view/register_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  final RegisterPresenter presenter;

  const RegisterPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends RegisterViewImpl {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                height: 107,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bola.png'),
                      fit: BoxFit.fill),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                'Cadastrar Usuários',
                style: context.textStyles.titleBlack,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameEC,
                      decoration: const InputDecoration(
                        label: Text('Nome Completo *'),
                      ),
                      validator: Validatorless.required('Obrigatório'),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: emailEC,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        label: Text('E-mail *'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Obrigatório'),
                        Validatorless.email('E-mail precisa ser válido'),
                      ]),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordEC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text('Senha *'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Obrigatório'),
                        Validatorless.min(
                            6, 'Deve conter pelo menos 6 caractéres')
                      ]),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: confirmPasswordEC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text('Confirma Senha *'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Obrigatório'),
                        Validatorless.min(
                            6, 'Deve conter pelo menos 6 caractéres'),
                        Validatorless.compare(
                            passwordEC, 'Comfirma senha diferente de Senha'),
                      ]),
                    ),
                    const SizedBox(height: 30),
                    Button.primary(
                      width: double.maxFinite,
                      label: 'Cadastrar',
                      onPressed: () {
                        bool isformValid =
                            formKey.currentState?.validate() ?? false;

                        if (isformValid) {
                          showLoader();
                          widget.presenter.register(
                            name: nameEC.text,
                            email: emailEC.text,
                            password: passwordEC.text,
                            confirmPassword: confirmPasswordEC.text,
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
