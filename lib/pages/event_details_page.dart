import 'package:flutter/material.dart';
import 'package:worldskills/models/event.dart';
import 'package:worldskills/pages/register_page.dart';

class EventDetailsPage extends StatefulWidget {
  final EventItem eventItem;
  EventDetailsPage({super.key, required this.eventItem});

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "lib/assets/wsmb2024_logo.png",
          height: 65,
          fit: BoxFit.contain,
        ),
        surfaceTintColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            const Text(
              "Event Details",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Image.asset(
              widget.eventItem.imagePath,
              fit: BoxFit.contain,
              width: screenWidth * .6,
              height: screenHeight * 0.4,
            ),
            Text(
              widget.eventItem.title,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              widget.eventItem.description,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EventRegisterPage(eventItem: widget.eventItem))),
                child: const Text("REGISTER")),
          ],
        ),
      ),
    );
  }
}
