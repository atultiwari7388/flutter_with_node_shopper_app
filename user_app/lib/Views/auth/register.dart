import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:user_app/Views/auth/login.dart';
import '../../utils/app_styles.dart';
import '../../utils/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/reusable_text.dart';
import '../../widgets/text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned(
            top: -100.h,
            left: -100.w,
            child: Container(
              width: 300.w,
              height: 300.h,
              decoration: BoxDecoration(
                color: kPrimary.withOpacity(0.3),
                borderRadius: BorderRadius.circular(150),
              ),
            ),
          ),
          Positioned(
            bottom: -100.h,
            right: -100.w,
            child: Container(
              width: 300.w,
              height: 300.h,
              decoration: BoxDecoration(
                color: kSecondary.withOpacity(0.3),
                borderRadius: BorderRadius.circular(150),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  // Logo and Title
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 170.h),
                        ReusableText(
                          text: "Register",
                          style: appStyle(24, kPrimary, FontWeight.w500),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      // height: 400.h,
                      height: MediaQuery.of(context).size.height / 1.1,
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 20.h),
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Spacer(),
                          buildTextFieldInputWidget(
                            "Name",
                            TextInputType.name,
                            nameController,
                            MaterialCommunityIcons.ab_testing,
                            validator: (value) {
                              if (value == null || !GetUtils.isEmail(value)) {
                                return "Please enter a valid email";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15.h),
                          buildTextFieldInputWidget(
                            "Email ID",
                            TextInputType.emailAddress,
                            emailController,
                            MaterialCommunityIcons.email,
                            validator: (value) {
                              if (value == null || !GetUtils.isEmail(value)) {
                                return "Please enter a valid email";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15.h),
                          buildTextFieldInputWidget(
                            "Password",
                            TextInputType.visiblePassword,
                            passController,
                            MaterialCommunityIcons.security,
                            isPass: true,
                            validator: (value) {
                              if (value == null || value.length < 6) {
                                return "Password must be at least 6 characters";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              Expanded(child: Container()),
                              GestureDetector(
                                onTap: () {},
                                child: Text("Forgot Password?",
                                    style: appStyle(
                                        14, kPrimary, FontWeight.bold)),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h),
                          CustomButton(
                              text: "Create Account",
                              onPress: () {},
                              color: kSecondary),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ReusableText(
                                  text: "Already have a new account",
                                  style: appStyle(14, kDark, FontWeight.w500)),
                              SizedBox(width: 5.w),
                              GestureDetector(
                                onTap: () => Get.to(() => const LoginScreen()),
                                child: ReusableText(
                                    text: "Login",
                                    style: appStyle(
                                        14, kPrimary, FontWeight.bold)),
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFieldInputWidget buildTextFieldInputWidget(
    String hintText,
    TextInputType type,
    TextEditingController controller,
    IconData icon, {
    bool isPass = false,
    String? Function(String?)? validator,
  }) {
    return TextFieldInputWidget(
      hintText: hintText,
      textInputType: type,
      textEditingController: controller,
      icon: icon,
      isPass: isPass,
      validator: validator,
    );
  }
}
