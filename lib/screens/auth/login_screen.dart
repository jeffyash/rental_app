import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moon_design/moon_design.dart';
import 'package:rentalapp/screens/student/home_screen_student.dart';
import 'package:rentalapp/screens/auth/registration_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Global Form Key
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordObscured = true;
  String? _emailError;
  String? _passwordError;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 70),
                Text(
                  "Login",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      textInputField(
                          "Email", "ex: jon.smith@email.com", _emailController, false),
                      textInputField("Password", "*********", _passwordController, true),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                MoonFilledButton(
                  backgroundColor: const Color(0xFF40A69F),
                  height: 42,
                  width: 291,
                  buttonSize: MoonButtonSize.lg,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // If form is valid navigate to HomePage
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    }
                  },
                  label: Text(
                    "Login",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 24),
                GestureDetector(child: const Text("Forgot Password?")),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socialIconButton("Google", "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png"),
                    const SizedBox(width: 10),
                    socialIconButton("Facebook", "https://static.vecteezy.com/system/resources/previews/018/930/476/non_2x/facebook-logo-facebook-icon-transparent-free-png.png"),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? ",
                        style: GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 14))),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const CreateAccountPage()));
                      },
                      child: Text(
                        "Sign up",
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF40A69F))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textInputField(String label, String hintText, TextEditingController controller,
      bool isPassword) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 16))),
        const SizedBox(height: 13),
        SizedBox(
          width: 291,
          height: 64,
          child: MoonFormTextInput(
            controller: controller,
            cursorColor: Colors.grey[800],
            backgroundColor: const Color(0xFFEEF3F2),
            hintText: hintText,
            obscureText: isPassword ? _isPasswordObscured : false, // Obscure for password fields
            inactiveBorderColor: Colors.transparent,
            activeBorderColor: Colors.grey,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 15,
                color: Colors.grey[500],
              ),
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "This field cannot be empty.";
              }
              if (label == "Password" && value.length < 6) {
                return "Password must be at least 6 characters.";
              }
              return null; // If no validation errors
            },
            onChanged: (value) {
              setState(() {
                if (label == "Email") {
                  _emailError = null;
                } else if (label == "Password") {
                  _passwordError = null; // Clear password error
                }
              });
            },
            trailing: isPassword
                ? GestureDetector(
              onTap: () {
                setState(() {
                  _isPasswordObscured = !_isPasswordObscured;
                });
              },
              child: Icon(
                _isPasswordObscured ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey[500],
              ),
            )
                : null,
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }

  Widget socialIconButton(String text, String imageUrl) {
    return Container(
      width: 141,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xFFF1F5F9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(imageUrl, width: 30, height: 30),
          const SizedBox(width: 8),
          Text(text, style: GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
