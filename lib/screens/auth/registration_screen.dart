import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moon_design/moon_design.dart';
import 'package:rentalapp/screens/student/home_screen_student.dart';import 'package:rentalapp/screens/auth/login_screen.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  // Global Form Key
  final _formKey = GlobalKey<FormState>();

  // TextEditingController for each input field
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Terms and conditions checkbox
  bool termsAndConditions = false;
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    // Get the screen height and width
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 70),
                  Text(
                    "Create your account",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 26, fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      textInputField("Name", "ex: Jon Smith", _nameController, false),
                      textInputField("Email", "ex: jon.smith@email.com", _emailController, false),
                      textInputField("Password", "*********", _passwordController, true, _isPasswordObscured),
                      textInputField("Confirm password", "*********", _confirmPasswordController, true, _isConfirmPasswordObscured, _passwordController),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MoonCheckbox(
                            value: termsAndConditions,
                            activeColor: const Color(0xFF40A69F),
                            borderColor: const Color(0xFF40A69F),
                            onChanged: (bool? value) => setState(() => termsAndConditions = value!),
                          ),
                          const SizedBox(width: 8),
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(fontSize: 12, color: Colors.black),
                              children: [
                                TextSpan(text: "I understood the ", style: GoogleFonts.poppins()),
                                TextSpan(
                                  text: "terms & policy",
                                  style: GoogleFonts.poppins(color: const Color(0xFF40A69F)),
                                ),
                                TextSpan(text: ".", style: GoogleFonts.poppins()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  MoonFilledButton(
                    backgroundColor: const Color(0xFF40A69F),
                    height: 42,
                    width: 288,
                    buttonSize: MoonButtonSize.lg,
                    onTap: () {
                      if (_formKey.currentState!.validate() && termsAndConditions) {
                        // If form is valid, navigate to HomePage
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      } else if (!termsAndConditions) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("You must accept the terms and conditions.")),
                        );
                      }
                    },
                    label: Text(
                      "Create Account",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text("Or continue with"),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      socialIconButton("Google", "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png"),
                      const SizedBox(width: 10),
                      socialIconButton("Facebook", "https://static.vecteezy.com/system/resources/previews/018/930/476/non_2x/facebook-logo-facebook-icon-transparent-free-png.png"),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? ", style: GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 14))),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF40A69F))),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textInputField(String label, String hintText, TextEditingController controller, bool isPassword, [bool isObscured = false, TextEditingController? passwordController]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 16))),
        const SizedBox(height: 10),
        SizedBox(
          width: 290,
          child: MoonFormTextInput(
            controller: controller,
            cursorColor: Colors.grey[800],
            backgroundColor: const Color(0xFFEEF3F2),
            hintText: hintText,
            obscureText: isPassword ? isObscured : false,
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
              if (isPassword && value.length < 8) {
                return "The password should be at least 8 characters.";
              }
              if (label == "Confirm password" && passwordController != null) {
                if (value != passwordController.text) {
                  return "Passwords do not match.";
                }
              }
              return null;
            },
            onChanged: (value) {
              setState(() {}); // Trigger rebuild to remove any error message
            },
            trailing: isPassword
                ? GestureDetector(
              onTap: () {
                setState(() {
                  if (label == "Password") {
                    _isPasswordObscured = !_isPasswordObscured;
                  } else {
                    _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
                  }
                });
              },
              child: Icon(
                isObscured ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey[500],
              ),
            )
                : null,
          ),
        ),
        const SizedBox(height: 8),
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
