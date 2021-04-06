import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pocket_modular/src/modules/splash/splash_controller.dart';
import 'package:pocket_modular/src/shared/theme/color_theme.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorTheme.instance.background,
      child: Center(
        child: Container(
          width: 400,
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
