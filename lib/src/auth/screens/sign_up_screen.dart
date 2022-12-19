import 'package:flutter/material.dart';
import 'package:greengrocer/src/auth/components/custom_text_field.dart';
import 'package:greengrocer/src/services/validator.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import '../../config/custom_colors.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nomeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(children: [
                const Expanded(
                  child: Center(
                    child: Text(
                      'Cadastro',
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ),
                  ),
                ),
//Formulário
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 40,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(45),
                    ),
                  ),
                  //Form
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        CustomTextField(
                          controller: nomeController,
                          icon: Icons.person,
                          label: 'Nome',
                          textInputType: TextInputType.text,
                          validator: nomeValidator,
                        ),
                        CustomTextField(
                          controller: emailController,
                          icon: Icons.email,
                          label: 'Email',
                          textInputType: TextInputType.emailAddress,
                          validator: emailValidator,
                        ),
                        CustomTextField(
                          controller: passwordController,

                          icon: Icons.lock,
                          label: 'Senha',
                          isSecret: true,
                          textInputType: TextInputType.number,
                          validator: passwordValidator,
                        ),
                        //Create Button
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),

                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              String email = emailController.text;
                              String password = passwordController.text;
                              String nome = nomeController.text;
                              //print("$nome - $email - $password");
                              var cadastraruser = ParseObject('usuario')
                                ..set('nome', nome)
                                ..set('email', email)
                                ..set('senha', password);
                              await cadastraruser.save();

                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pop();

                            },
                            child: const Text(
                              'Cadastrar Usuário',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
