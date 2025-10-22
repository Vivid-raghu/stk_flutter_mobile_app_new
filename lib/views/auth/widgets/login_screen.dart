import 'package:flutter/material.dart';
import '../../../view_models/auth/auth_view_model.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  late final LoginViewModel viewModel;
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    viewModel = LoginViewModel();

    // Bind text controllers to ViewModel
    _userName.addListener(() {
      viewModel.setUsername(_userName.text);
    });
    _passwordController.addListener(() {
      viewModel.setPassword(_passwordController.text);
    });
  }

  @override
  void dispose() {
    _userName.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40), // Bottom space
          Center(
            child: Text(
              'Welcome',
              style: TextStyle(
                fontSize: isTablet ? 28 : 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "Email",
            style: TextStyle(fontSize: isTablet ? 18 : 14),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _userName,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(fontSize: isTablet ? 16 : 14),
            decoration: InputDecoration(
              hintText: 'Email',
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Password",
            style: TextStyle(fontSize: isTablet ? 18 : 14),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            style: TextStyle(fontSize: isTablet ? 16 : 14),
            decoration: InputDecoration(
              hintText: '********',
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                  ),
                  Text(
                    "Remember Me",
                    style: TextStyle(fontSize: isTablet ? 16 : 13),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style:
                  TextStyle(color: Colors.grey, fontSize: isTablet ? 14 : 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: isTablet ? 56 : 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF003C96),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () async {
                final result = await viewModel.login(context);
                if (result.$1 && context.mounted) {
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  _showCustomSnackBar(
                      viewModel.message.isNotEmpty
                          ? viewModel.message
                          : 'Login failed',
                      Colors.red);
                }
              },
              child: Text(
                "Login",
                style: TextStyle(
                    fontSize: isTablet ? 18 : 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCustomSnackBar(String message, Color color) {
    if (!viewModel.showSnackBar) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: const Duration(seconds: 3),
        content: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  message,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.white),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  viewModel.clearMessage();
                  viewModel.toggleShowSnackBar(false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
