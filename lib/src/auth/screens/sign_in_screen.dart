import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/auth/components/custom_text_field.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../../pages_routes/app_pages.dart';
import '../../services/validator.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Nome do App
                Text.rich(
                  TextSpan(
                    style: const TextStyle(fontSize: 40),
                    children: [
                      TextSpan(
                        text: 'Cadastro',
                        style: TextStyle(
                          color: CustomColors.customContrastColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                //Animação
                SizedBox(
                  height: 30,
                  child: DefaultTextStyle(
                    style: const TextStyle(fontSize: 25),
                    child: AnimatedTextKit(
                      pause: Duration.zero,
                      repeatForever: true,
                      animatedTexts: [
                        FadeAnimatedText('Listas'),
                        FadeAnimatedText('de'),
                        FadeAnimatedText('Usuários')
                      ],
                    ),
                  ),
                ),
              ],
            )),

            //Form
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 40,
              ),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(45))),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //Email
                    CustomTextField(
                      controller: emailController,
                      icon: Icons.email,
                      label: 'Email',
                      isSecret: false,
                      textInputType: TextInputType.emailAddress,
                      validator: emailValidator,
                    ),

                    //Senha
                    CustomTextField(
                      controller: passwordController,
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                      textInputType: TextInputType.number,
                      validator: passwordValidator,
                    ),

                    //Entrar
                    SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              if (_formKey.currentState!.validate()) {
                                String email = emailController.text;
                                String password = passwordController.text;
                                //print('Email: $email - Senha: $password');
                                QueryBuilder<ParseObject> login = QueryBuilder<
                                    ParseObject>(ParseObject('usuario'))
                                  ..whereEqualTo('email', email);
                                final ParseResponse apiResponse =
                                    await login.query();
                                if (apiResponse.success &&
                                    apiResponse.results != null) {
                                  if (apiResponse.results!.first
                                          .get<String>('senha') ==
                                      password) {
                                    print('OK');
                                    Get.toNamed(PagesRoutes.pagelista);
                                  } else {
                                    print('erro');
                                  }
                                }
                              }
                            },
                            child: const Text(
                              'Entrar',
                              style: TextStyle(fontSize: 18),
                            ))),

                    //Divisor
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text('Ou'),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //New User Button
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                            side: const BorderSide(
                              width: 2,
                              color: Colors.green,
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed(PagesRoutes.pagecadastro);
                          },
                          child: const Text(
                            'Criar conta',
                            style: TextStyle(fontSize: 18),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}