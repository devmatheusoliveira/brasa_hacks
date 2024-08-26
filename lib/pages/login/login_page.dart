import 'package:brasa_hacks_stone/shared/themes/app_colors.dart';
import 'package:brasa_hacks_stone/shared/themes/app_text_styles.dart';
import 'package:brasa_hacks_stone/shared/widgets/button_widget/button_widget.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;
  double height = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: height - 80,
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tenho Cadastro",
                    style: AppTextStyles.title,
                  ),
                  // SizedBox(height: 10),
                  // Text(
                  //   "Por favor, insira o seu CPF para prosseguir",
                  //   style: AppTextStyles.subtile,
                  // ),
                  const SizedBox(height: 56),
                  TextField(
                    inputFormatters: [
                      // obrigatório
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter()
                    ],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'CPF',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    keyboardType: TextInputType.number,
                    obscureText: _showPassword,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      suffixIcon: InkWell(
                        child: Icon(
                          _showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.grey,
                        ),
                        onTap: () {
                          setState(
                            () => _showPassword = !_showPassword,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // buttons
                  ButtonWidget(
                    onPressed: () {},
                    text: "Entrar",
                    color: AppColors.black,
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Expanded(child: Divider()),
                      Text(
                        "  Ou Entrar com  ",
                        style:
                            AppTextStyles.link.copyWith(color: AppColors.grey),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ButtonWidget(
                    onPressed: () {},
                    text: "Entrar com Gov.br",
                  ),
                  const Expanded(child: SizedBox()),
                  Center(
                    child: InkWell(
                      onTap: () {},
                      child: Text.rich(
                        TextSpan(
                          text: "Primeiro Cadastro? ",
                          children: [
                            TextSpan(
                              text: "Cadastrar",
                              style: AppTextStyles.link,
                            ),
                          ],
                          style: AppTextStyles.link.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
