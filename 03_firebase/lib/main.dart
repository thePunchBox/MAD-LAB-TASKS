import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase core
import 'firebase_options.dart'; // Import your generated Firebase options
import 'auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  await Firebase.initializeApp(
    // Await Firebase initialization
    options:
        DefaultFirebaseOptions.currentPlatform, // Use your Firebase options
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up Form',
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Controllers to capture email and password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService a = AuthService();

  String? _message; // For displaying messages to the user

  // Function for handling Sign Up button
  void _handleSignUp() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    final result = await a.signUp(email, password); // Await sign up result
    if (result != null) {
      // Check if result is not null
      setState(() {
        _message = 'Sign Up successful!'; // Success message
      });
    } else {
      setState(() {
        _message = 'Error: Unable to sign up.'; // Display error message
      });
    }
  }

  // Function for handling Login button
  void _handleLogin() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    final user = await a.signIn(email, password); // Await sign in result
    if (user != null) {
      setState(() {
        _message = 'Login successful!'; // Success message
      });
    } else {
      setState(() {
        _message =
            'Login failed. Please check your credentials.'; // Error message
      });
    }
    print('Login: Email: $email, Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            if (_message != null) // Display message if it exists
              Text(
                _message!,
                style: TextStyle(color: Colors.red),
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _handleSignUp,
                  child: Text('Sign Up'),
                ),
                ElevatedButton(
                  onPressed: _handleLogin,
                  child: Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
