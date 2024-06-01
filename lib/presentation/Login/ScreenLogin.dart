// Importing necessary packages
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tailme/application/auth/bloc/login_form_bloc.dart';
import 'package:tailme/domain/Login/model/user_login_model.dart';
import 'package:tailme/presentation/RegisterUser/register_user.dart';

// Importing bottom navigation screen

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    debugPrint("build print");
    // Initialize ScreenUtil for width and height adaptation

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(72),
                      left: ScreenUtil().setWidth(18),
                      right: ScreenUtil().setWidth(18),
                      bottom: ScreenUtil().setHeight(20)),
                  child: BlocConsumer<LoginFormBloc, LoginFormState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Form(
                        autovalidateMode: AutovalidateMode.always,
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: ScreenUtil().setHeight(30),
                                width: ScreenUtil().setWidth(30),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    'assets/images/back_arrow.svg',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(20),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(85),
                              width: ScreenUtil().setWidth(280),
                              child: const Text(
                                'Welcome back! Glad to see you, Again!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(57),
                            ),
                            // SizedBox(
                            //   height: ScreenUtil().setHeight(56),
                            //   child: EmailTextformField(
                            //     onEmailChanged: (value) {
                            //       email = value;
                            //     },
                            //   ),
                            // ),
                            SizedBox(
                              height: ScreenUtil().setHeight(15),
                            ),
                            TextFormField(
                              onChanged: (value) => context
                                  .read<LoginFormBloc>()
                                  .add(LoginFormEvent.emailChanged(value)),
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) =>  context
                                  .read<LoginFormBloc>().state.email.value.fold(
                                (f) => f.maybeMap(
                                    invalidEmail: (_) => "Invaid Email",
                                    orElse: () => null),
                                (r) =>null,
                              ),
                              decoration: InputDecoration(
                                hintText: "Enter your email",
                                hintStyle: const TextStyle(
                                  color: Color(0xFF8390A1),
                                  fontSize: 15,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w500,
                                  height: 0.08,
                                ),
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: ScreenUtil().setWidth(16)),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            TextFormField(
                              //obscureText: state.isEyePressed,
                              onChanged: (value) => context
                                  .read<LoginFormBloc>()
                                  .add(LoginFormEvent.passwordChanged(value)),
                                   validator: (value) =>  context
                                  .read<LoginFormBloc>().state.password.value.fold(
                                (f) => f.maybeMap(
                                    shortPassword: (_) => "short password",
                                    orElse: () => null),
                                (r) =>null,
                              ),
                             
                              controller: _passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              
                              decoration: InputDecoration(
                                hintText: "Enter Your password",
                                hintStyle: const TextStyle(
                                  color: Color(0xFF8390A1),
                                  fontSize: 15,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w500,
                                  height: 0.08,
                                ),
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: ScreenUtil().setWidth(16)),
                                fillColor: Colors.white,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    // context
                                    //     .read<LoginFormBloc>()
                                    //     .add(const LoginFormEvent.eyeButtonPressed());
                                  },
                                  icon: Icon(
                                    // state.isEyePressed
                                    //     ? Icons.visibility_off
                                    Icons.visibility,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(5),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(50),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: ScreenUtil().setHeight(50),
                              child: BlocBuilder<LoginFormBloc,
                                  LoginFormState>(
                                builder: (context, state) {
                                  return ElevatedButton(
                                    onPressed: () {
                                      
                                        final user = UserLogin(
                                            email: _emailController.text,
                                            password:
                                                _passwordController.text);
                                        BlocProvider.of<LoginFormBloc>(
                                                context)
                                            .add(LoginFormEvent
                                                .signInWithEmailAndPasswordPressed(
                                                    emailStr: user.email,
                                                    passwordStr:
                                                        user.password));
                                      
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          WidgetStateProperty.all<Color>(
                                        const Color(
                                            0xFFFFAC4B), // Set background color here
                                      ),
                                      shape: WidgetStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Login',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: 'Urbanist',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(36),
                            ),
                            const Row(
                              children: [
                                Divider(
                                  color: Colors.white,
                                ),
                                // SizedBox(
                                //   width: ScreenUtil().setWidth(5),
                                // ),
                                // Text(
                                //   'Or Login with',
                                //   style: TextStyle(
                                //     color: Colors.white,
                                //     fontSize: 14,
                                //     fontFamily: 'Urbanist',
                                //     fontWeight: FontWeight.w600,
                                //     height: 0,
                                //   ),
                                // ),
                                // SizedBox(
                                //   width: ScreenUtil().setWidth(5),
                                // ),
                                // Container(
                                //   width: ScreenUtil().setWidth(120),
                                //   decoration: const ShapeDecoration(
                                //     shape: RoundedRectangleBorder(
                                //       side: BorderSide(
                                //         width: 1,
                                //         color: Color(0xFFE8ECF4),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(25),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: ScreenUtil().setWidth(105),
                                  height: ScreenUtil().setHeight(56),
                                  padding: EdgeInsets.symmetric(
                                      vertical: ScreenUtil().setHeight(15)),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: Color(0xFFDADADA)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/images/facebook_ic.svg',
                                    height: ScreenUtil().setHeight(26),
                                    width: ScreenUtil().setWidth(26),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // signInWithGoogle(context);
                                  },
                                  child: Container(
                                    width: ScreenUtil().setWidth(105),
                                    height: ScreenUtil().setHeight(56),
                                    padding: EdgeInsets.symmetric(
                                        vertical: ScreenUtil().setHeight(15)),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 1, color: Color(0xFFDADADA)),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/images/google_ic.svg',
                                      height: ScreenUtil().setHeight(26),
                                      width: ScreenUtil().setWidth(26),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: ScreenUtil().setWidth(105),
                                  height: ScreenUtil().setHeight(56),
                                  padding: EdgeInsets.symmetric(
                                      vertical: ScreenUtil().setHeight(15)),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: Color(0xFFDADADA)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/images/cib_apple.svg',
                                    height: ScreenUtil().setHeight(26),
                                    width: ScreenUtil().setWidth(26),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Don’t have an account? ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            height: 0.09,
                            letterSpacing: 0.15,
                          ),
                        ),
                        TextSpan(
                          text: 'Register Now',
                          style: const TextStyle(
                            color: Color(0xFFB9FFFE),
                            fontSize: 15,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ScreenUserRegistration()),
                              );
                            },
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
