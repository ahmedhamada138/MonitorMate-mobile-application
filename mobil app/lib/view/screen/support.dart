import 'package:flutter/material.dart';
import 'package:icumonitoring/core/constans/ColorApp.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70), // ارتفاع الـ AppBar
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colorapp.primaryColorgradint, Colorapp.primaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: const Text(
            " Last week Alerts",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0, // إزالة الظل
          backgroundColor: Colors.transparent, // ضروري ليعمل التدرج
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Hospital logo

              const SizedBox(height: 20),

              // Welcome message
              const Text(
                'Welcome to the support center. We are here to help you!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              // Contact buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      iconColor: Colors.white,
                      backgroundColor: Colorapp.primaryColorgradint,
                    ),
                    onPressed: () {
                      //  launchUrl(Uri.parse("tel:+123456789"))
                    },
                    icon: const Icon(Icons.phone),
                    label: const Text('Call Us',
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      iconColor: Colors.white,
                      backgroundColor: Colorapp.primaryColorgradint,
                    ),
                    onPressed: () {
                      // launchUrl(Uri.parse("mailto:support@hospital.com"))
                    },
                    icon: const Icon(Icons.email),
                    label: const Text(
                      'Email Us',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Inquiry form
              const SupportForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class SupportForm extends StatefulWidget {
  const SupportForm({super.key});

  @override
  _SupportFormState createState() => _SupportFormState();
}

class _SupportFormState extends State<SupportForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      // Here you can handle form submission (e.g., send data to an API)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Your message has been sent!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Your Name'),
            validator: (value) =>
                value!.isEmpty ? 'Please enter your name' : null,
          ),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Your Email'),
            validator: (value) =>
                value!.isEmpty ? 'Please enter your email' : null,
          ),
          TextFormField(
            controller: messageController,
            decoration: const InputDecoration(labelText: 'Your Message'),
            maxLines: 3,
            validator: (value) =>
                value!.isEmpty ? 'Please enter your message' : null,
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                iconColor: Colors.white,
                backgroundColor: Colorapp.primaryColorgradint,
              ),
              onPressed: submitForm,
              child: const Text('Send Message',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
