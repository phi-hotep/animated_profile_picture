import 'package:animated_profile_picture/custom_text.dart';
import 'package:animated_profile_picture/my_sliver_header_profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 14, 101, 100)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SizedBox div = const SizedBox(
    height: 20,
  );
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          floating: false,
          delegate: MySliverHeaderProfile(
            name: const CustomText(
              textSize: 12,
              bold: false,
              child: Text('Miss Africa'),
            ),
            maxH: 400,
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              height: 200,
              color: const Color.fromARGB(255, 96, 139, 109).withOpacity(0.3),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: CustomText(
                        textSize: 20,
                        bold: true,
                        child: Text(
                          'Account',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        textSize: 15,
                        bold: false,
                        child: Text('+1(613)xxx-xxxx'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        textSize: 20,
                        bold: false,
                        child: Text('Bio'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        textSize: 15,
                        bold: false,
                        child: Text('Love african women'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            div,
            Container(
              height: 350,
              width: 300,
              color: const Color.fromARGB(255, 96, 139, 109).withOpacity(0.3),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.privacy_tip,
                          color: Colors.white,
                        ),
                        SizedBox(width: 20),
                        CustomText(
                          textSize: 15,
                          bold: false,
                          child: Text('Privacy and Security'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                        SizedBox(width: 20),
                        CustomText(
                          textSize: 15,
                          bold: false,
                          child: Text('Notifications and Sounds'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.battery_saver,
                          color: Colors.white,
                        ),
                        SizedBox(width: 20),
                        CustomText(
                          textSize: 15,
                          bold: false,
                          child: Text('Power Saving'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            div,
            Container(
              height: 300,
              width: 300,
              color: const Color.fromARGB(255, 96, 139, 109).withOpacity(0.3),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        SizedBox(width: 20),
                        CustomText(
                          textSize: 15,
                          bold: false,
                          child: Text('Settings'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.folder_shared,
                          color: Colors.white,
                        ),
                        SizedBox(width: 20),
                        CustomText(
                          textSize: 15,
                          bold: false,
                          child: Text('Shared Folder'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_search,
                          color: Colors.white,
                        ),
                        SizedBox(width: 20),
                        CustomText(
                          textSize: 15,
                          bold: false,
                          child: Text('Search Friends'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        )
      ],
    );
  }
}
