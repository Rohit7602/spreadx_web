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

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  AuthState authState = AuthState.isLOGIN;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: styleSheet.COLOR.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  height: styleSheet.appConfig.getScreenHeight(context) * 0.6,
                  padding: styleSheet.DECORATION.PADDING_20,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      // borderRadius: styleSheet.contDecoration.RADIUS_20,
                      // color: styleSheet.colors.whiteColor,
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
                      TextButtonView(
                        btnName: "Forgot Password?",
                        onPressed: () {
                          setAuthState(AuthState.isForgot);
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(authState == AuthState.isLOGIN
                              ? "Don't have an account?"
                              : "Already have an account?"),
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
                      ),
                    ],
                  ),
                ),
              ),
              styleSheet.appConfig.addWidth(20),
              Flexible(
                flex: 1,
                child: Container(
                  // height: styleSheet.appConfig.getScreenHeight(context) *
                  //     view.loginContainerHeight,
                  padding: styleSheet.DECORATION.PADDING_20,
                  decoration: BoxDecoration(
                      color: styleSheet.COLOR.whiteColor,
                      borderRadius: styleSheet.DECORATION.RADIUS_20,
                      boxShadow: styleSheet.DECORATION.primaryShadow),
                  child: LayoutBuilder(
                    builder: (context, constr) {
                      switch (authState) {
                        case AuthState.isForgot:
                          return ForgotPDCompoView(
                            onSendOTP: setAuthState,
                          );
                        case AuthState.isOTPView:
                          return OTPComponentView(
                            getBack: setAuthState,
                          );
                        case AuthState.isSignUp:
                          return const SignUpComponentView();
                        case AuthState.createPD:
                          return CreatePDComponentView(
                            getBack: setAuthState,
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
