import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/auth/login/presenter/login_presenter.dart';
import 'package:fwc_album_app/app/pages/auth/login/view/login_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;

  const LoginPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends LoginViewImpl {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Form(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_login.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            slivers: [
              Form(
                key: formKey,
                child: SliverList(
                  delegate: SliverChildListDelegate.fixed([
                    SizedBox(
                      height: size.height * (size.width > 350 ? .3 : .25),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Center(
                        child: Text(
                          'Login',
                          style: context.textStyles.titleWhite,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: emailEC,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        label: Text('E-mail'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Obrigat??rio'),
                        Validatorless.email('E-mail inv??lido'),
                      ]),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordEC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        label: Text('Senha'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Obrigat??rio'),
                        Validatorless.min(6, 'Pelo menos 6 caract??res'),
                      ]),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text(
                        'Esqueceu a senha?',
                        style:
                            context.textStyles.textSecondaryFontMedium.copyWith(
                          color: context.colors.yellow,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Button(
                      width: size.width * .9,
                      onPressed: () {
                        bool isFormValid =
                            formKey.currentState?.validate() ?? false;
                        if (isFormValid) {
                          showLoader();
                          widget.presenter.login(emailEC.text, passwordEC.text);
                        }
                      },
                      style: context.buttonStyles.yellowButton,
                      labelStyle: context
                          .textStyles.textSecondaryFontExtraBoldPrimaryColor,
                      label: 'Entrar',
                    )
                  ]),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const Spacer(),
                    Text.rich(
                      TextSpan(
                        text: 'N??o possui uma conta? ',
                        children: [
                          TextSpan(
                            text: 'Cadastre-se',
                            style: context.textStyles.textSecondaryFontMedium
                                .copyWith(
                              color: context.colors.yellow,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = (() => Navigator.of(context)
                                  .pushNamed('/auth/register')),
                          )
                        ],
                      ),
                      style:
                          context.textStyles.textSecondaryFontMedium.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
