import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:worldskills/models/event.dart';
import 'package:worldskills/models/user.dart';
import 'package:worldskills/pages/registration_details_page.dart';

class EventRegisterPage extends StatefulWidget {
  final EventItem eventItem;
  EventRegisterPage({super.key, required this.eventItem});

  @override
  State<EventRegisterPage> createState() => _EventRegisterPageState();
}

class _EventRegisterPageState extends State<EventRegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final icNumController = TextEditingController();
  final emailController = TextEditingController();
  final institutionController = TextEditingController();
  final addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "lib/assets/wsmb2024_logo.png",
          height: 60,
          fit: BoxFit.contain,
        ),
        surfaceTintColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "REGISTRATION FORM",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Placeholder(
                  fallbackHeight: 80,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  onPressed: () => print("Upload Image"),
                  child: const Text("UPLOAD"),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Name",
                    hintText: "Enter your name",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Name cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: icNumController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "IC Number",
                    hintText: "Enter your identity card number",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'IC Number cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    hintText: "Enter your email",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    } else {
                      if (!value.contains('@')) {
                        return "Not a valid email";
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: institutionController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "School / Institution",
                    hintText: "Enter your school or institution",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'School or institution cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Address",
                    hintText: "Enter your address",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Address cannot be empty';
                    }
                    return null;
                  },
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                    onPressed: _formSubmit, child: const Text("SUBMIT")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _formSubmit() {
    if (_formKey.currentState!.validate()) {
      User user = User(
          name: nameController.text,
          category: widget.eventItem.title,
          icNumber: icNumController.text,
          email: emailController.text,
          institution: institutionController.text);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RegistrationDetailsPage(user: user)));
    }
  }
}
