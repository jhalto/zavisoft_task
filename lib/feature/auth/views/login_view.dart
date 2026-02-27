import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zavisoft_task/core/const/app_colors.dart';
import 'package:zavisoft_task/core/const/app_text_style.dart';
import 'package:zavisoft_task/core/const/images_path.dart';
import 'package:zavisoft_task/core/global_widgets/custom_form_field.dart';
import 'package:zavisoft_task/core/global_widgets/custom_fullwidth_button.dart';
import 'package:zavisoft_task/core/helper/validation_helper.dart';
import 'package:zavisoft_task/feature/auth/controllers/auth_controller.dart';


class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {


    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        resizeToAvoidBottomInset: false,
      
        body: LayoutBuilder(
          builder: (context, constraints) {
            
            return Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).viewPadding.top,
              ),
              child: SingleChildScrollView(
                physics: isKeyboardOpen? const AlwaysScrollableScrollPhysics():const NeverScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        SizedBox(height: isKeyboardOpen ? 10 : 80),
                    
                        ClipRRect(
                          
                          child: Image.asset(ImagesPath.zavisoftLogo, width: 98,height: 98, )),
                    
                        SizedBox(height: isKeyboardOpen ? 10 : 20),
                    
                        Visibility(
                          visible: !isKeyboardOpen,
                          child: Text(
                            "ZaviSoft",
                            style: AppTextStyle.headline3.copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                    
                        Visibility(
                          visible: !isKeyboardOpen,
                          child: Text(
                            "Transforming Ideas, into reality",
                            style: AppTextStyle.titleLarge.copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                    
                        SizedBox(height: isKeyboardOpen ? 0 : 80),
                    
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(
                              left: 12,
                              right: 12,
                              top: isKeyboardOpen ? 5 : 32,
                            ),
                            decoration: const BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                                          
                            // 🔑 Scroll only form content
                            child: Column(
                              children: [
                                Text("Login", style: AppTextStyle.headline3),
                                SizedBox(height: isKeyboardOpen ? 10 : 24),
                                CustomFormField(
                                  controller: controller.userNameController,
                                  hint: "Username",
                                  textInputAction: TextInputAction.next,
                                  validator: Validation.validateName,
                                ),
                                const SizedBox(height: 12),
                                CustomFormField(
                                  validator: Validation.validatePassword,
                                  controller: controller.passwordController,
                                  hint: "Password",
                                  isPassword: true,
                                ),
                                const SizedBox(height: 8),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IntrinsicWidth(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Forgot password?",
                                          style: AppTextStyle.labelMedium.copyWith(
                                            height: 1.2,
                                          ),
                                        ),
                                        // const SizedBox(height: 1),
                                        Container(
                                          height: 1,
                                          width: double.infinity, // fill text width
                                          color: AppColors.secondaryTextColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                CustomFullwidthButton(
                                  onTap: () { 
                                    FocusScope.of(context).unfocus();
                                    // Get.toNamed(Routes.dashboard);
                                  },
                                  title: "Login",
                                  fontColor: AppColors.whiteColor,
                                ),
                                const SizedBox(height: 8),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Don't have any account?",
                                        style: AppTextStyle.labelMedium,
                                      ),
                                      WidgetSpan(
                                        child: Material(
                                          child: InkWell(
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            onTap: () {},
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 5,
                                              ),
                                              child: Text(
                                                "Register Now",
                                                style: AppTextStyle.labelLarge
                                                    .copyWith(
                                                      color: AppColors.primaryColor,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}