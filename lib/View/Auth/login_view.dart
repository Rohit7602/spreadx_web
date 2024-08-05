import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/text_btn.dart';
import 'package:spreadx_web/Data/enum.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/View/Auth/Widgets/create_pd.dart';
import 'package:spreadx_web/View/Auth/Widgets/login_component.dart';
import 'package:spreadx_web/View/Auth/Widgets/forgot_pd_comp.dart';
import 'package:spreadx_web/View/Auth/Widgets/signup_comp.dart';
import 'package:spreadx_web/View/Auth/Widgets/otp_compo_view.dart';
import 'package:spreadx_web/web_config.dart';
import 'package:spreadx_web/main.dart';

import '../../Components/Button/back_btn.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  AuthState authState = AuthState.isLOGIN;

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return Scaffold(
      backgroundColor: styleSheet.COLOR.bgLightBlueColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  // height: styleSheet.appConfig.getScreenHeight(context) * 0.6,
                  padding: styleSheet.DECORATION.PADDING_20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    // borderRadius: styleSheet.contDecoration.RADIUS_20,
                    color: styleSheet.COLOR.whiteColor,
                    // boxShadow: styleSheet.contDecoration.primaryShadow,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        styleSheet.images.appLogo,
                        width: 280,
                      ),
                      styleSheet.appConfig.addHeight(15),
                      authState == AuthState.isLOGIN
                          ? Column(
                              children: [
                                TextButtonView(
                                  btnName: "Forgot Password?",
                                  onPressed: () {
                                    setAuthState(AuthState.isForgot);
                                  },
                                ),
                                TextButtonView(
                                  btnName: authState == AuthState.isLOGIN
                                      ? "Sign Up"
                                      : "Login",
                                  onPressed: () {
                                    setAuthState(authState == AuthState.isLOGIN
                                        ? AuthState.isSignUp
                                        : AuthState.isLOGIN);
                                  },
                                ),
                              ],
                            )
                          : const SizedBox(),
                      authState == AuthState.isOTPViewFromSignUp ||
                              authState == AuthState.isOTPViewFromForgotPassword
                          ? Column(
                              children: [
                                Text(
                                  "We sent you an OTP code",
                                  style: view.loginHeadingTextSize,
                                ),
                                styleSheet.appConfig.addHeight(10),
                                Text(
                                    "We have sent you an OTP code. Please enter the code below to reset your password",
                                    textAlign: TextAlign.center,
                                    style: styleSheet.TEXT_THEME.fs12Medium
                                        .copyWith(
                                            color:
                                                styleSheet.COLOR.primaryColor))
                              ],
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
              styleSheet.appConfig.addWidth(20),
              Flexible(
                flex: 2,
                child: Container(
                  // height: styleSheet.appConfig.getScreenHeight(context) *
                  //     view.loginContainerHeight,
                  padding: styleSheet.DECORATION.PADDING_20,
                  decoration: BoxDecoration(
                    color: styleSheet.COLOR.whiteColor,
                  ),
                  child: LayoutBuilder(
                    builder: (context, constr) {
                      switch (authState) {
                        case AuthState.isForgot:
                          return ForgotPDCompoView(
                            onSendOTP: () => setState(() => authState =
                                AuthState.isOTPViewFromForgotPassword),
                            onPop: () =>
                                setState(() => authState = AuthState.isLOGIN),
                          );
                        case AuthState.isOTPViewFromForgotPassword ||
                              AuthState.isOTPViewFromSignUp:
                          return OTPComponentView(
                            state: authState,
                            onVerify: (state) =>
                                setState(() => authState = state),
                            onPop: () =>
                                setState(() => authState = AuthState.isLOGIN),
                          );
                        case AuthState.isSignUp:
                          return SignUpComponentView(
                            onPop: () =>
                                setState(() => authState = AuthState.isLOGIN),
                            onContinue: () => setState(() =>
                                authState = AuthState.isOTPViewFromSignUp),
                          );
                        case AuthState.createPD:
                          return CreatePDComponentView(
                            onPop: () =>
                                setState(() => authState = AuthState.isLOGIN),
                            onCreatePassword: () =>
                                setState(() => authState = AuthState.isLOGIN),
                          );
                        default:
                          return const LoginComponentView();
                      }
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ).paddingAll(20),
    );
  }

  setAuthState(AuthState state) {
    authState = state;
    setState(() {});
  }
}
