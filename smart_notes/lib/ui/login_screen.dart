// import 'package:flutter/material.dart';
// import 'package:smart_notes/widgets/button.dart';
// import 'package:smart_notes/widgets/textfield.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightBlue,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Icon(Icons.book_online_outlined, size: 100, color: Colors.white),
//               Text(
//                 "Smart Notes",
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),

//               SizedBox(height: 16),

//               CustomTextField(
//                 hintText: "Enter your email",
//                 labelText: "Email",
//                 keyboardType: TextInputType.emailAddress,
//                 prefixIcon: Icon(Icons.email, color: Colors.white),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//               ),

//               SizedBox(height: 16),
//               CustomTextField(
//                 hintText: "Enter your password",
//                 labelText: "Password",
//                 obscureText: true,
//                 prefixIcon: Icon(Icons.lock, color: Colors.white),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//               ),

//               SizedBox(height: 24),
//               CustomButton(
//                 text: "Login",
//                 onPressed: () {
//                   // Example of handling login button press
//                   print("Login button pressed");

//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:smart_notes/widgets/button.dart';
import 'package:smart_notes/widgets/textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Define Brand Colors centrally for consistency
    final Color primaryColor = Colors.blue.shade800;
    final Color secondaryColor = Colors.blue.shade400;

    return Scaffold(
      // 2. resizeToAvoidBottomInset ensures the UI pushes up when keyboard opens
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // 3. Modern Gradient Background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [primaryColor, secondaryColor],
          ),
        ),
        child: SafeArea(
          child: Center(
            // 4. SingleChildScrollView prevents "Pixel Overflow" errors
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // --- Header Section ---
                  _buildHeader(),

                  const SizedBox(height: 40),

                  // --- Form Card Section ---
                  Container(
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Please login to your account",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Email Field
                        CustomTextField(
                          labelText: "Email",
                          hintText: "example@mail.com",
                          keyboardType: TextInputType.emailAddress,
                          // Note: Changed icon color to grey to be visible on white card
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.grey[600],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Password Field
                        CustomTextField(
                          labelText: "Password",
                          hintText: "••••••••",
                          obscureText: true,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.grey[600],
                          ),
                        ),

                        // Forgot Password Link
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: primaryColor),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Login Button
                        CustomButton(
                          text: "Login",
                          backgroundColor: primaryColor, // Use brand color
                          onPressed: () {
                            print("Login pressed");
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // --- Footer Section ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.white70),
                      ),
                      GestureDetector(
                        onTap: () => print("Navigate to Register"),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
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

  // Extracted Header to keep build method clean
  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.library_books_rounded, // A more modern icon choice
            size: 60,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "Smart Notes",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
