import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samyati/Theme/theme_modal.dart';

const String help = '''
[Your App Name] Fitness App Help Center
Welcome to the [Your App Name] Fitness App Help Center. Here, you can find answers to common questions and solutions to common issues. If you can't find what you're looking for, please don't hesitate to contact our support team.

Frequently Asked Questions (FAQs)
1. How do I create an account?
To create an account, follow these steps:

Open the app and click on the "Sign Up" button.
Fill in the required information.
Click "Create Account."
2. I forgot my password. How do I reset it?
If you've forgotten your password:

On the login screen, click "Forgot Password."
Enter the email associated with your account.
Follow the instructions sent to your email to reset your password.
3. How do I track my workouts?
To track your workouts:

Navigate to the "Workouts" section.
Choose the type of workout you want to log.
Enter the details of your workout and save.
4. Can I customize workout plans?
Yes, you can customize workout plans:

Go to "My Plans."
Select the plan you want to customize.
Click "Customize Plan" and make the desired changes.
Contact Support
If you need further assistance or have specific inquiries, please reach out to our support team. We're here to help!

Email: support@[yourcompany.com]
Phone: [Your support phone number]
Live Chat: [If applicable, provide information about your live chat feature]
App Updates and News
Stay informed about the latest app updates, news, and announcements on our Blog page.

Thank you for using [Your App Name] Fitness App!
''';

class Help extends StatelessWidget {
  const Help({super.key});

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
              Text(help, style: TextStyle(fontSize: 15))
            ],
          ),
        ),
      );
    });
  }
}
