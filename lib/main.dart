import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dashboard.dart';
import 'dart:math';

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
      backgroundColor: Colors.deepPurple[50],
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
  bool isVerified = false; // To track if Aadhaar verification is done
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  TextEditingController dobController = TextEditingController(); // Controller for Date of Birth

  // Simulate Aadhaar verification process
  void verifyAadhaar() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        isVerified = true;
      });
    } else {
      // Show a SnackBar with a message if form is not filled
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter all required information')),
      );
    }
  }

  // Function to show date picker and update the Date of Birth controller
  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(1900);
    DateTime lastDate = DateTime(2100);

    // Show date picker
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    // If a date is selected, update the controller's text
    if (selectedDate != null && selectedDate != initialDate) {
      setState(() {
        dobController.text = "${selectedDate.toLocal()}".split(' ')[0]; // Format: yyyy-MM-dd
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
            // Navigate back to the LandingPage
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove shadow to ensure transparency
      ),
      body: Stack(
        children: [
          // Background design with abstract shapes
          Positioned(
            top: -80,
            left: -80,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Color(0xFFE74C3C), // Crimson Red
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
                color: Color(0xFFF39C12), // Mustard Yellow
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
                color: Color(0xFF34495E), // Charcoal Gray
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Centered box with the form fields
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(  // Make the form scrollable
                child: Form(
                  key: _formKey, // Add form key here for validation
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
                        // Title
                        const Text(
                          "Create Your Account",  // Title added here
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Name field
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

                        // Date of Birth field
                        TextFormField(
                          controller: dobController,  // Use controller here
                          decoration: const InputDecoration(
                            labelText: "Date of Birth",
                            icon: Icon(Icons.calendar_today),
                          ),
                          onTap: () async {
                            FocusScope.of(context).requestFocus(FocusNode());
                            await _selectDate(context);  // Call the function to show date picker
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your date of birth';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),

                        // Email field
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

                        // Phone Number field
                        TextFormField(
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

                        // Password field
                        TextFormField(
                          obscureText: true, // To hide the password text
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

                        // Aadhaar Number field
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Aadhaar Number",
                            border: const OutlineInputBorder(),
                            suffixIcon: InkWell(
                              onTap: verifyAadhaar, // Trigger verification on tap
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  isVerified ? 'Verified' : 'Verify',
                                  style: TextStyle(
                                    color: isVerified
                                        ? Colors.green
                                        : Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Aadhaar number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        // Submit button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const DashboardPage()),
                            );
                          },
                          child: const Text("Submit", style: TextStyle(fontSize: 18)),
                        ),
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
                // Use TextFormField instead of TextField for validation
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10, // Restricts the input length to 10
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Allows only digits
                    LengthLimitingTextInputFormatter(10), // Limit to 10 digits
                  ],
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    prefixText: '+91 ',
                    counterText: '', // Hides the length counter
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  // Use the validator here for validation
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
                    String phoneNumber = phoneController.text;
                    // If the phone number is valid, navigate to OTP page
                    if (_validatePhoneNumber(phoneNumber) == null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const OtpEntryPage()),
                      );
                    }
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
    // Check if phone number is empty
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Please enter your phone number';
    }
    // Check if phone number length is exactly 10 digits
    else if (phoneNumber.length != 10) {
      return 'Please enter a valid 10-digit number';
    }
    // Check if the phone number contains only digits
    else if (!RegExp(r'^[0-9]+$').hasMatch(phoneNumber)) {
      return 'Please enter only digits';
    }
    return null; // Return null if the phone number is valid
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




class OtpEntryPage extends StatelessWidget {
  const OtpEntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Enter OTP'),
      ),
      body: Stack(
        children: [
          // Triangle with rupee symbols at the top-right corner
          Positioned.fill(
            child: Align(
              // alignment: Alignment.topRight,
              child: CustomPaint(
                painter: RupeeTrianglePainter(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Enter the OTP sent to your phone',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: InputDecoration(
                    labelText: 'OTP',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const DashboardPage()),
                    );
                  },
                  child: const Text(
                    'Verify OTP',
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

class RupeeTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define paint for the triangle background
    final paint = Paint()..color = Colors.grey.withOpacity(0.3);

    // Define the triangle path in the top-right corner
    final trianglePath = Path()
      ..moveTo(size.width, 0) // Start at the top-right corner
      ..lineTo(size.width, size.height * 0.3) // Down to 30% of the height
      ..lineTo(size.width * 0.7, 0) // Left to 70% of the width
      ..close();

    // Draw the triangle
    canvas.drawPath(trianglePath, paint);

    // Prepare text style for rupee symbols
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );
    final textStyle = TextStyle(
      color: Colors.black.withOpacity(0.6),
      fontSize: 18, // Smaller font size for better spacing
    );

    // Fill the triangle area with rupee symbols
    double startX = size.width - 15; // Start near the top right
    double startY = 5; // Start close to the top of the triangle

    // Adjust symbol placement and spacing within the triangle
    while (startX > size.width * 0.7) {
      while (startY < size.height * 0.3) {
        textPainter.text = TextSpan(text: '₹', style: textStyle);
        textPainter.layout();
        textPainter.paint(canvas, Offset(startX, startY));
        startY += 22; // Adjust vertical spacing between symbols
      }
      startY = 5; // Reset Y position for the next column
      startX -= 22; // Adjust horizontal spacing between symbols
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
