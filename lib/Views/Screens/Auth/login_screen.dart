import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_calculator/Views/Screens/Auth/register_screen.dart';
import 'package:work_calculator/Views/Widgets/custom_text.dart';
import '../../../Helpers/snackbar.dart';
import '../../Widgets/Auth_Widgets/auth_button.dart';
import '../../Widgets/Auth_Widgets/auth_text_field.dart';
import '../../Widgets/Auth_Widgets/google_button.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SnackBarHelper {
  late TextEditingController emailEditingController;
  late TextEditingController passwordEditingController;
  late FocusNode passFocusNode;

  @override
  void initState() {
    emailEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
    passFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    passFocusNode.dispose();
    super.dispose();
  }


  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 120.h,
              ),
              CustomText(
                title: 'Welcome Back',
                fontSize: 30.sp,
                isTitle: true,
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomText(
                title: 'Sign in to continue',
                fontSize: 18.sp,
              ),
              SizedBox(
                height: 30.h,
              ),
              AuthTextField(
                hintText: 'Email address',
                controller: emailEditingController,
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 12.h,
              ),
              AuthTextField(
                hintText: 'Password',
                controller: passwordEditingController,
                textInputType: TextInputType.visiblePassword,
                obscure: true,
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ForgotPasswordScreen(),),);
                  },
                  child: Text(
                    'Forget password ?',
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 18.sp,
                        decoration: TextDecoration.underline,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              AuthButton(
                onPressed: () {
                  ///
                },
                buttonName: 'Login',
                isLoading: isLoading,
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                    text: 'Don\'t have an account?',
                    style:
                         TextStyle(
                           color: Colors.black,
                             fontSize: 18.sp),
                    children: [
                      TextSpan(
                        text: '  Sign up',
                        style:  TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                           Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterScreen(),),);
                          },
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
