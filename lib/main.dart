import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dashboard.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LandingPage(),
    );
  }
}


class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background currency symbols with more quantity and variation
          Positioned(
            top: 30,
            left: 30,
            child: Text(
              '₹', // Indian Rupee symbol
              style: TextStyle(fontSize: 60, color: Colors.grey.withOpacity(0.3)),
            ),
          ),
          Positioned(
            top: 120,
            right: 20,
            child: Text(
              '\$', // Dollar symbol
              style: TextStyle(fontSize: 60, color: Colors.grey.withOpacity(0.3)),
            ),
          ),
          Positioned(
            bottom: 150,
            left: 50,
            child: Text(
              '€', // Euro symbol
              style: TextStyle(fontSize: 60, color: Colors.grey.withOpacity(0.3)),
            ),
          ),
          Positioned(
            bottom: 100,
            right: 40,
            child: Text(
              '£', // Pound symbol
              style: TextStyle(fontSize: 60, color: Colors.grey.withOpacity(0.3)),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 100,
            child: Text(
              '₣', // Swiss Franc symbol
              style: TextStyle(fontSize: 60, color: Colors.grey.withOpacity(0.3)),
            ),
          ),
          Positioned(
            top: 200,
            left: 100,
            child: Text(
              '₹', // Indian Rupee symbol
              style: TextStyle(fontSize: 60, color: Colors.grey.withOpacity(0.3)),
            ),
          ),
          Positioned(
            top: 300,
            right: 70,
            child: Text(
              '₣', // Swiss Franc symbol
              style: TextStyle(fontSize: 60, color: Colors.grey.withOpacity(0.3)),
            ),
          ),
          Positioned(
            bottom: 250,
            left: 200,
            child: Text(
              '€', // Euro symbol
              style: TextStyle(fontSize: 60, color: Colors.grey.withOpacity(0.3)),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 100,
            child: Text(
              '\$', // Dollar symbol
              style: TextStyle(fontSize: 60, color: Colors.grey.withOpacity(0.3)),
            ),
          ),
          Positioned(
            top: 350,
            left: 170,
            child: Text(
              '£', // Pound symbol
              style: TextStyle(fontSize: 60, color: Colors.grey.withOpacity(0.3)),
            ),
          ),
          Positioned(
            top: 400,
            left: 50,
            child: Text(
              '₹', // Indian Rupee symbol
              style: TextStyle(fontSize: 60, color: Colors.grey.withOpacity(0.3)),
            ),
          ),
          Positioned(
            bottom: 400,
            right: 50,
            child: Text(
              '€', // Euro symbol
              style: TextStyle(fontSize: 60, color: Colors.grey.withOpacity(0.3)),
            ),
          ),
          Positioned(
            top: 450,
            right: 100,
            child: Text(
              '₣', // Swiss Franc symbol
              style: TextStyle(fontSize: 60, color: Colors.grey.withOpacity(0.3)),
            ),
          ),
          Positioned(
            top: 100,
            left: 200,
            child: Text(
              '\$', // Dollar symbol
              style: TextStyle(fontSize: 60, color: Colors.grey.withOpacity(0.3)),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 200,
            child: Text(
              '£', // Pound symbol
              style: TextStyle(fontSize: 60, color: Colors.grey.withOpacity(0.3)),
            ),
          ),

          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Welcome to MoneyLink',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF34495E),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Your journey starts here!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF34495E),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE74C3C),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignInPage()),
                    );
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xFFE74C3C)),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to the Sign-Up page (MyHomePage)
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage()),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18, color: Color(0xFFE74C3C)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isVerified = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(1900);
    DateTime lastDate = DateTime(2100);

    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (selectedDate != null && selectedDate != initialDate) {
      setState(() {
        dobController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            top: -80,
            left: -80,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Color(0xFFE74C3C),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: -80,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Color(0xFFF39C12),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: -100,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Color(0xFF34495E),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Create Your Account",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: dobController,
                          decoration: const InputDecoration(
                            labelText: "Date of Birth",
                            icon: Icon(Icons.calendar_today),
                          ),
                          onTap: () async {
                            FocusScope.of(context).requestFocus(FocusNode());
                            await _selectDate(context);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your date of birth';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: "Phone Number",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Aadhaar Number",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Aadhaar number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              setState(() {
                                isVerified = true;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const OtpEntryPage()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Please fill in all required fields')),
                              );
                            }
                          },
                          child: const Text("Submit", style: TextStyle(fontSize: 18)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Sign In with Phone'),
      ),
      body: Stack(
        children: [
          // Background currency symbols in a full circle at the bottom left
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: CustomPaint(
                painter: CombinedPainter(),
              ),
            ),
          ),

          // Main content
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Enter your phone number',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    prefixText: '+91 ',
                    counterText: '',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    return _validatePhoneNumber(value);
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF39C12),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OtpEntryPage()),
                    );
                  },
                  child: const Text(
                    'Send Verification Code',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to validate phone number
  String? _validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Please enter your phone number';
    } else if (phoneNumber.length != 10) {
      return 'Please enter a valid 10-digit number';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(phoneNumber)) {
      return 'Please enter only digits';
    }
    return null;
  }
}


class CombinedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    // Set the radius and position for the circle
    double radius = 180;  // Increased radius for a larger circle
    Offset center = Offset(0, size.height - 100);  // Bottom left position

    // Draw the Rupee symbols in a circular path (full circle)
    int numSymbols = 50;  // Increased number of symbols to fill the circle
    double angleStep = (2 * pi) / numSymbols;  // Full circle step

    // Draw symbols along the circular path
    for (int i = 0; i < numSymbols; i++) {
      double angle = angleStep * i;  // Calculate the angle for each symbol
      double x = center.dx + radius * cos(angle);
      double y = center.dy + radius * sin(angle);

      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: '₹',
          style: TextStyle(
            fontSize: 25,  // Adjust symbol size
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      // Draw the Rupee symbol at the calculated position
      textPainter.paint(canvas, Offset(x - textPainter.width / 2, y - textPainter.height / 2));
    }
    radius=150;
    // numSymbols = 40;
    for (int i = 0; i < numSymbols; i++) {
      double angle = angleStep * i;
      double x = center.dx + radius * cos(angle);
      double y = center.dy + radius * sin(angle);

      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: '₹',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      textPainter.paint(canvas, Offset(x - textPainter.width / 2, y - textPainter.height / 2));
    }

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}





class OtpEntryPage extends StatefulWidget {
  const OtpEntryPage({Key? key}) : super(key: key);

  @override
  _OtpEntryPageState createState() => _OtpEntryPageState();
}

class _OtpEntryPageState extends State<OtpEntryPage> {
  final TextEditingController otpController = TextEditingController();
  final FocusNode otpFocusNode = FocusNode();
  bool showIcons = true;

  @override
  void initState() {
    super.initState();
    otpFocusNode.addListener(() {
      // Toggle icons based on focus
      setState(() {
        showIcons = !otpFocusNode.hasFocus; // Hide icons when focused
      });
    });

    otpController.addListener(() {
      // If user starts typing, hide the icons
      if (otpController.text.isNotEmpty) {
        setState(() {
          showIcons = false;
        });
      } else {
        setState(() {
          showIcons = true;
        });
      }
    });
  }

  @override
  void dispose() {
    otpController.dispose();
    otpFocusNode.dispose();
    super.dispose();
  }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Colors.grey,
  //       title: const Text('Enter OTP'),
  //     ),
  //     body: Stack(
  //       children: [
  //         if (showIcons) ...[
  //           Positioned(
  //             top: 50,
  //             left: -30,
  //             child: CoinIcon(),
  //           ),
  //           Positioned(
  //             top: 180,
  //             left: 130,
  //             child: CoinIcon(),
  //           ),
  //           Positioned(
  //             top: 120,
  //             right: 20,
  //             child: CoinIcon(),
  //           ),
  //           Positioned(
  //             bottom: 160,
  //             left: 100,
  //             child: CoinIcon(),
  //           ),
  //           Positioned(
  //             bottom: -30,
  //             right: 50,
  //             child: CoinIcon(),
  //           ),
  //         ],
  //         Positioned(
  //           top: 50,
  //           left: -30,
  //           child: CoinIcon(),
  //         ),
  //         Positioned(
  //           bottom: -30,
  //           right: 50,
  //           child: CoinIcon(),
  //         ),
  //         Positioned(
  //           top: 120,
  //           right: 20,
  //           child: CoinIcon(),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.all(20.0),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.stretch,
  //             children: [
  //               const Text(
  //                 'Enter the OTP sent to your phone',
  //                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //                 textAlign: TextAlign.center,
  //               ),
  //               const SizedBox(height: 20),
  //               TextField(
  //                 controller: otpController,
  //                 focusNode: otpFocusNode,
  //                 keyboardType: TextInputType.number,
  //                 maxLength: 6,
  //                 decoration: InputDecoration(
  //                   labelText: 'OTP',
  //                   border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(10),
  //                     borderSide: const BorderSide(color: Colors.black),
  //                   ),
  //                   enabledBorder: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(10),
  //                     borderSide: const BorderSide(color: Colors.black),
  //                   ),
  //                   focusedBorder: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(10),
  //                     borderSide: const BorderSide(color: Colors.black, width: 2.0),
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(height: 20),
  //               ElevatedButton(
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: const Color(0xFFF39C12),
  //                   padding: const EdgeInsets.symmetric(vertical: 15),
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(30),
  //                   ),
  //                 ),
  //                 onPressed: () async {
  //                   String otp = otpController.text;
  //
  //                   if (otp.isNotEmpty) {
  //                     // String phoneNumber = '+919014483135';  // Replace with the actual phone number
  //                     //
  //                     // // Send the OTP to the backend for verification
  //                     // var url = Uri.parse('https://sendotp1-dd05ruhj.b4a.run/verify_otp'); // Your backend URL
  //                     // try {
  //                     //   var response = await http.post(
  //                     //     url,
  //                     //     headers: {"Content-Type": "application/json"},
  //                     //     body: json.encode({
  //                     //       'phone_number': phoneNumber,  // Send the phone number
  //                     //       'otp': otp,                    // Send the entered OTP
  //                     //     }),
  //                     //   );
  //                     //
  //                     //   if (response.statusCode == 200) {
  //                     //     // If OTP verification is successful, navigate to Dashboard
  //                     //   } else {
  //                     //     // Handle error response from backend
  //                     //     print('Error: ${response.statusCode}');
  //                     //     print('Response body: ${response.body}');
  //                     //   }
  //                     // } catch (e) {
  //                     //   // Handle request error
  //                     //   print('Error: $e');
  //                     // }
  //                         Navigator.pushReplacement(
  //                           context,
  //                           MaterialPageRoute(builder: (context) => DashboardPage()),
  //                         );
  //                   } else {
  //                     // Handle case where OTP is empty
  //                     print('Please enter OTP');
  //                   }
  //                 },
  //                 child: const Text(
  //                   'Verify OTP',
  //                   style: TextStyle(fontSize: 18, color: Colors.white),
  //                 ),
  //               ),
  //               const SizedBox(height: 20),
  //               // Resend OTP Button
  //               ElevatedButton(
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: const Color(0xFFF39C12), // Same color as Verify OTP
  //                   padding: const EdgeInsets.symmetric(vertical: 15),
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(30),
  //                   ),
  //                 ),
  //                 onPressed: () async {
  //                   String phoneNumber = '9014483135';
  //                   if (true) {
  //                     String formattedPhoneNumber = '+91'+phoneNumber;
  //
  //                     var url = Uri.parse('https://sendotp1-dd05ruhj.b4a.run/send_otp'); // Replace with your backend URL
  //                     try {
  //                       var response = await http.post(
  //                         url,
  //                         headers: {"Content-Type": "application/json"},
  //                         body: json.encode({
  //                           'phone_number': formattedPhoneNumber,  // Send formatted phone number
  //                         }),
  //                       );
  //
  //                       // Check the response status
  //                       if (response.statusCode == 200) {
  //                         // Show a success message using a SnackBar
  //                         ScaffoldMessenger.of(context).showSnackBar(
  //                           SnackBar(
  //                             content: Text('Notification has been sent successfully!'),
  //                             duration: Duration(seconds: 2),
  //                           ),
  //                         );
  //                       } else {
  //                         // Handle error response from backend
  //                         print('Error: ${response.statusCode}');
  //                         print('Response body: ${response.body}');
  //                       }
  //                     } catch (e) {
  //                       // Handle request error
  //                       print('Error: $e');
  //                     }
  //                   }
  //                 },
  //
  //                 child: const Text(
  //                   'Resend OTP',
  //                   style: TextStyle(fontSize: 18, color: Colors.white),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Enter OTP'),
      ),
      body: Stack(
        children: [
          if (showIcons) ...[
            Positioned(top: 50, left: -30, child: CoinIcon()),
            Positioned(top: 180, left: 130, child: CoinIcon()),
            Positioned(top: 120, right: 20, child: CoinIcon()),
            Positioned(bottom: 160, left: 100, child: CoinIcon()),
            Positioned(bottom: -30, right: 50, child: CoinIcon()),
          ],
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'OTP Verification',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Note: OTP verification is not yet active. Please enter any 6-digit OTP to continue.',
                  style: TextStyle(fontSize: 16, color: Colors.redAccent),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Enter the OTP sent to your phone',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: otpController,
                  focusNode: otpFocusNode,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: InputDecoration(
                    labelText: 'OTP',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black, width: 2.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF39C12),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    String otp = otpController.text;
                    if (otp.isNotEmpty) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => DashboardPage()),
                      );
                    } else {
                      print('Please enter OTP');
                    }
                  },
                  child: const Text(
                    'Verify OTP',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF39C12),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () async {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Couldn\'t Send Notification Please Try again!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Text(
                    'Resend OTP',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}


class CoinIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 2),
      ),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.transparent,
        child: Text(
          '₹',
          style: TextStyle(
            fontSize: 24,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}