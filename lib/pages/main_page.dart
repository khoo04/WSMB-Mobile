import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:worldskills/models/event.dart';
import 'package:worldskills/widgets/event_tile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  late final WebViewController _controller;
  List<EventItem> eventList = [
    EventItem(
      imagePath: "lib/assets/1.png",
      title: "Autonomous Mobile Robotics",
      description:
          "Designing, building and maintaing robots to solve problems industries from anufacturing to aerospace, mining to medicine",
    ),
    EventItem(
      imagePath: "lib/assets/2.png",
      title: "Cloud Computing",
      description:
          "Cloud computing has become a key part of corporate digital transformation strategy as companies migrate their physical IT activites, such as file storage and on-site servers, into a virtual environment",
    ),
    EventItem(
      imagePath: "lib/assets/3.png",
      title: "Cyber Security",
      description:
          "Information security analysts work to protect an organizatioon's computer systems networks, to prevent hackers from accessing and/or stealing sensitive information and data",
    ),
    EventItem(
      imagePath: "lib/assets/4.png",
      title: "3D Digital Game Art",
      description:
          "A 3D Digital Game Artist uses their creativity, technology, and geometry skills to create captivating animated experiences in a video game.",
    ),
    EventItem(
      imagePath: "lib/assets/5.png",
      title: "IT Software Solution for Business",
      description:
          "Creating new systems and modifying existing one to provide software solutions to large and small businesses.",
    ),
    EventItem(
      imagePath: "lib/assets/6.png",
      title: "Mobile Applications Development",
      description:
          "Mobile Applications Developers use technology and design to create apps which are appealing and function well on phones.",
    ),
    EventItem(
      imagePath: "lib/assets/7.png",
      title: "Information Network Cabling",
      description:
          "Designing and installing cable systems for telecommunication and network communication",
    ),
    EventItem(
      imagePath: "lib/assets/8.png",
      title: "Web Technologies",
      description:
          "Planning and designing, as well as testing websites, maintaining them, incorporating third-party platforms, and integrating social media platforms.",
    ),
  ];
  @override
  void initState() {
    super.initState();

    final WebViewController controller = WebViewController();

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
  Page resource error:
    code: ${error.errorCode}
    description: ${error.description}
    errorType: ${error.errorType}
    isForMainFrame: ${error.isForMainFrame}
          ''');
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://[www.dsd.gov.my/index.php/skillsmalaysia-menu/peringkat-malaysia/worldskills-malaysia-belia-wsmb]'));

    _controller = controller;
  }

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
      body: (_currentIndex == 0)
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                        hintText: "Search", border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return EventTile(eventItem: eventList[index]);
                    },
                    itemCount: eventList.length,
                  )),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )
          : const Center(
              child: Text("Not Implement Yet"),
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Main Page"),
          BottomNavigationBarItem(
              icon: Icon(Icons.web_asset), label: "Web Page"),
        ],
        currentIndex: _currentIndex,
        onTap: (value) => setState(() {
          _currentIndex = value;
        }),
      ),
    );
  }
}
