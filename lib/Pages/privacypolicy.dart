import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samyati/Theme/theme_modal.dart';

const String privacyPolicyText = '''
Privacy Policy for [Your Fitness App Name]

Last Updated: [Date]

Welcome to [Your Fitness App Name] ("us," "we," or "our"). This privacy policy outlines how we collect, use, disclose, and protect the information you provide when using our mobile application, [Your Fitness App Name] (the "App").

1. Information We Collect
1.1 Personal Information
We may collect the following types of personal information:

User Account Information: When you create an account, we may collect your name, email address, and other necessary account details.
Health and Fitness Data: The App may collect and process data related to your health and fitness activities, including but not limited to workout routines, exercise preferences, and performance metrics.
1.2 Usage Information
We may automatically collect certain information about your use of the App, including:

Device Information: Information about your mobile device, including device type, operating system, and unique device identifiers.
Log Information: Details about your interactions with the App, such as the features used, time and date of access, and app crashes.
2. How We Use Your Information
We use the collected information for the following purposes:

Provide and Personalize the App: To deliver and personalize the features and content of the App based on your preferences.
Analytics: To analyze usage patterns, improve the App's functionality, and enhance user experience.
Communication: To communicate with you regarding updates, promotions, and other relevant information.
3. Data Sharing and Disclosure
We do not sell, trade, or otherwise transfer your personal information to third parties without your consent, except as outlined in this Privacy Policy. We may share your information with:

Service Providers: Third-party service providers assisting us in operating the App and delivering services.
Legal Compliance: In response to a legal request or when required to comply with applicable laws and regulations.
4. Data Security
We implement industry-standard security measures to protect your personal information from unauthorized access, disclosure, alteration, and destruction.

5. Your Choices
You may have the option to manage your privacy settings within the App. Additionally, you can opt-out of receiving promotional communications by following the instructions provided in such communications.

6. Changes to this Privacy Policy
We may update this Privacy Policy from time to time. The latest version will be posted on this page, and the effective date will be revised accordingly.

7. Contact Us
If you have any questions, concerns, or requests regarding this Privacy Policy, please contact us at [your contact email].

By using the App, you agree to the terms outlined in this Privacy Policy.
''';

// privacy_policy_content.dart
class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

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
              Text(privacyPolicyText, style: TextStyle(fontSize: 15)),
            ],
          ),
        ),
      );
    });
  }
}
