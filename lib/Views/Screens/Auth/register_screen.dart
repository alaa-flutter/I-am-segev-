import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_calculator/Helpers/snackbar.dart';
import 'package:work_calculator/Views/Widgets/custom_text.dart';
import '../../Widgets/Auth_Widgets/auth_button.dart';
import '../../Widgets/Auth_Widgets/auth_text_field.dart';
import 'forgot_password_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with SnackBarHelper {
  late TextEditingController fullNameEditingController;
  late TextEditingController emailEditingController;
  late TextEditingController passwordEditingController;
  late TextEditingController addressEditingController;
  late FocusNode passFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode addressFocusNode;

  @override
  void initState() {
    fullNameEditingController = TextEditingController();
    emailEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
    addressEditingController = TextEditingController();
    passFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    addressFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    fullNameEditingController.dispose();
    emailEditingController.dispose();
    passwordEditingController.dispose();
    addressEditingController.dispose();
    passFocusNode.dispose();
    emailFocusNode.dispose();
    addressFocusNode.dispose();
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
                height: 100.h,
              ),
              CustomText(
                title: 'Welcome',

                fontSize: 30.sp,
                isTitle: true,
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomText(
                title: 'Sign up to continue',
                fontSize: 18.sp,
              ),
              SizedBox(
                height: 30.h,
              ),
              AuthTextField(
                hintText: 'Full Name',
                controller: fullNameEditingController,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 12.h,
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
                height: 12.h,
              ),
              AuthTextField(
                hintText: 'Address',
                controller: addressEditingController,
                textInputType: TextInputType.text,
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
                onPressed: () {},
                buttonName: 'Sign up',
                isLoading: isLoading,
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                    text: 'Already a user ?',
                    style: TextStyle(color: Colors.black, fontSize: 18.sp),
                    children: [
                      TextSpan(
                        text: '  Sign in',
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pop();
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
