import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/modules/login/login_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/social_login_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: _size.width,
        height: _size.height,
        child: Stack(
          children: [
            Container(
              color: AppColors.primary,
              height: _size.height * 0.36,
              width: _size.width,
            ),
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Image.asset(
                AppImages.person,
                height: 220,
              ),
            ),
            Positioned(
              bottom: _size.height * 0.04,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.logomini,
                    height: 44,
                    width: 72,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 70, right: 70),
                    child: Text(
                      'Organize seus boletos em um só lugar',
                      style: TextStyles.titleHome,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 40, top: 40),
                    child: SocialLoginButton(onTap: () {
                      _controller.googleSignIn(context);
                    }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
