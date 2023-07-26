import 'package:flutter/material.dart';
import 'package:itgrow_flutter_test_project/model/user.dart';
import 'package:itgrow_flutter_test_project/res/app_strings.dart';
import 'package:itgrow_flutter_test_project/res/app_values.dart';
import 'package:itgrow_flutter_test_project/res/components/input_box_outlined.dart';
import 'package:itgrow_flutter_test_project/res/components/password_input_box_outlined.dart';
import 'package:itgrow_flutter_test_project/res/components/screen_subtitle.dart';
import 'package:itgrow_flutter_test_project/res/components/screen_title.dart';
import 'package:itgrow_flutter_test_project/res/components/submit_button.dart';
import 'package:itgrow_flutter_test_project/viewmodel/auth/login_viewmodel.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _userIdController;
  late TextEditingController _passwordController;

  late FocusNode _userIdFocusNode;
  late FocusNode _passwordFocusNode;

  late ValueNotifier<bool> _obscurePassword;
  late ValueNotifier<bool> _isFocusChanged;

  late final LoginViewmodel _loginViewmodel;

  @override
  void initState() {
    _loginViewmodel = Provider.of<LoginViewmodel>(context, listen: false);

    _userIdController = TextEditingController();
    _passwordController = TextEditingController();

    _userIdFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();

    _obscurePassword = ValueNotifier<bool>(true);
    _isFocusChanged = ValueNotifier<bool>(false);

    super.initState();
  }

  @override
  void dispose() {
    _userIdController.dispose();
    _passwordController.dispose();

    _userIdFocusNode.dispose();
    _passwordFocusNode.dispose();

    _obscurePassword.dispose();
    _isFocusChanged.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        MediaQuery.of(context).size.height * AppScaleFactors.sf1;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Login"),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(

            child: Container(
              height: screenHeight,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(
                    height: screenHeight * AppScaleFactors.sf0_05,
                  ),

                  SizedBox(
                    height: screenHeight * AppScaleFactors.sf0_02,
                  ),

                  // Screen Title
                  const ScreenTitle(title: AppStrings.loginTitle),

                  // Screen Subtitle
                  const ScreenSubtitle(subtitle: AppStrings.loginSubtitle),

                  SizedBox(
                    height: screenHeight * AppScaleFactors.sf0_04,
                  ),

                  //User ID input
                  InputBoxOutlined(
                    inputController: _userIdController,
                    currentFocusNode: _userIdFocusNode,
                    // hintText: AppStrings.userId,
                    labelText: AppStrings.userId,
                    prefixIcon: const Icon(Icons.person_outline),
                    nextFocusNode: _passwordFocusNode,
                    maxLines: 1,
                  ),

                  SizedBox(
                    height: screenHeight * AppScaleFactors.sf0_01,
                  ),

                  //Password input
                  ValueListenableBuilder(
                    valueListenable: _obscurePassword,
                    builder: (context, value, child) {
                      return PasswordInputBoxOutlined(
                        passwordController: _passwordController,
                        passwordFocusNode: _passwordFocusNode,
                        obscurePassword: _obscurePassword,
                        // hintText: AppStrings.password,
                        labelText: AppStrings.password,
                        isFocusChanged: _isFocusChanged,
                      );
                    },
                  ),

                  SizedBox(
                    height: screenHeight * AppScaleFactors.sf0_04,
                  ),

                  // Login button
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: AppPaddings.p32),
                    child:
                    Consumer<LoginViewmodel>(builder: (context, viewmodel, _) {
                      return StreamBuilder<bool>(
                          stream: viewmodel.isLoadingStream,
                          builder: (context, isLoading) {
                            return SubmitButton(
                              title: AppStrings.login,
                              isLoading: isLoading.data ?? false,
                              onTap: () async {
                                User user = User(userId: _userIdController.text, password: _passwordController.text);
                                await viewmodel.login(
                                  context,
                                  user,
                                  true,
                                );
                              },
                            );
                          }
                      );
                    }),
                  ),

                  SizedBox(
                    height: screenHeight * AppScaleFactors.sf0_04,
                  ),

                  SizedBox(
                    height: screenHeight * AppScaleFactors.sf0_05,
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
