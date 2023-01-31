import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_ui/smart_devices.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Padding Constants
  final double horizontalPadding = 40.0;
  final double verticalPadding = 25.0;

  // List of all smart devices

  List smartDevices = [
    // [Smart Device Name, Icon path, Power Status]
    ["Lights", "lib/icons/light-bulb.png", true],
    ["AC", "lib/icons/air-conditioner.png", false],
    ["TV", "lib/icons/smart-tv.png", false],
    ["Fan", "lib/icons/fan.png", false],
  ];

  // power button switched

  void powerSwitchChanged(bool value, int index){
    setState(() {
        smartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      //SafeArea prevents the Notch(Notification area) at the top
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // menu icon
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  //account icon
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),
            //Welcome Home
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Welcome Home,",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[700],
                      ),
                  ),
                  Text(
                    "SHUBHAM",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 72,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ),

            const SizedBox(height: 20),
            // smart devices + grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                  "Smart Devices",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.grey[800],
                  )
              ),
            ),

            Expanded(
                child: GridView.builder(  //Children in the gridview are all squares
                    itemCount: smartDevices.length,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(25),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1/1.3   // To change sides ratio of the grid
                    ),
                    itemBuilder: (context, index){
                      return SmartDeviceBox(
                        smartDeviceName: smartDevices[index][0],
                        iconPath: smartDevices[index][1],
                        powerOn: smartDevices[index][2],
                        onChanged: (value) => powerSwitchChanged(value, index),
                      );
                    }
                )
            )
          ],
        ),
      ),
    );
  }
}
