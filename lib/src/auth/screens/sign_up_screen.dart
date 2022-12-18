import 'package:flutter/material.dart';
import 'package:greengrocer/src/auth/components/custom_text_field.dart';

import '../../config/custom_colors.dart';
import '../../services/validator.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();

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
                        const CustomTextField(
                                                    icon: Icons.person,
                          label: 'Nome',
                          validator: nomeValidator,
                        ),
                        const CustomTextField(
                          icon: Icons.email,
                          label: 'Email',
                          validator: emailValidator,
                        ),
                        const CustomTextField(
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
                            onPressed: () {
                               _formKey.currentState!.validate();

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
