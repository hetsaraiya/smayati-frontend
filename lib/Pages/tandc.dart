import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samyati/Theme/theme_modal.dart';

const String tandc = '''
Terms and Conditions for [Your App Name] Fitness App

Effective Date: [Date]

1. Acceptance of Terms

By downloading, installing, or using [Your App Name] Fitness App (the "App"), you agree to comply with and be bound by these Terms and Conditions ("Terms"). If you do not agree to these Terms, please do not use the App.

2. Use of the App

2.1 Eligibility: You must be at least [age] years old to use this App.

2.2 User Account: You may be required to create a user account to access certain features of the App. You are responsible for maintaining the confidentiality of your account credentials and are fully responsible for all activities that occur under your account.

3. Content and Services

3.1 Fitness Information: The App provides fitness-related information, workouts, and other content for informational purposes only. Consult with a healthcare professional before starting any new fitness program.

3.2 User-Generated Content: Users may contribute content. By submitting content, you grant [Your Company] a worldwide, non-exclusive, royalty-free license to use, reproduce, modify, publish, distribute, and display the content.

4. Privacy Policy

Your use of the App is also governed by our Privacy Policy, which can be found here. By using the App, you consent to the terms of the Privacy Policy.

5. Prohibited Conduct

You agree not to:

5.1 Violate any applicable laws or regulations.

5.2 Infringe on the rights of others.

5.3 Interfere with the proper functioning of the App.

6. Disclaimers and Limitation of Liability

6.1 No Warranty: The App is provided "as is" without any warranties, express or implied. We do not warrant the accuracy, completeness, or fitness for a particular purpose of the App.

6.2 Limitation of Liability: In no event shall [Your Company] be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in any way connected with the use of the App.

7. Modifications to Terms

[Your Company] reserves the right to modify or revise these Terms at any time. The updated Terms will be effective upon posting. Continued use of the App after any such changes constitutes your acceptance of the new Terms.

8. Termination

[Your Company] may terminate or suspend your access to the App at any time, with or without cause.

9. Governing Law

These Terms shall be governed by and construed in accordance with the laws of [Your Country/State].

Contact Us:

If you have any questions about these Terms, please contact us at [your contact email].
''';

class TandC extends StatelessWidget {
  const TandC({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeNotifier, child) {
      return const Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 120,
              ),
              Text("Terms And Conditions"),
              SizedBox(
                height: 50,
              ),
              Text(tandc, style: TextStyle(fontSize: 15))
            ],
          ),
        ),
      );
    });
  }
}
