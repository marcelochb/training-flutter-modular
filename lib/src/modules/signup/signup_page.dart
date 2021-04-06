import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pocket_modular/src/components/atoms/button/button_widget.dart';
import 'package:pocket_modular/src/components/atoms/input/input_widget.dart';
import 'package:pocket_modular/src/modules/signup/signup_controller.dart';
import 'package:pocket_modular/src/shared/theme/color_theme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends ModularState<SignUpPage, SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastro',
          // style: TextStyle(color: ColorTheme.instance.element),
        ),
        backgroundColor: ColorTheme.instance.background,
        elevation: 0.0,
      ),
      body: Container(
        color: ColorTheme.instance.background,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputWidget(
                label: 'Nome',
                onChanged: controller.user.changeName,
              ),
              InputWidget(
                label: 'E-mail',
                onChanged: controller.user.changeEmail,
              ),
              InputWidget(
                label: 'Senha',
                isSecurityText: true,
                onChanged: controller.user.changePassword,
              ),
              SizedBox(height: 25),
              ButtonWidget(
                label: 'Salvar',
                onPress: controller.signUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
