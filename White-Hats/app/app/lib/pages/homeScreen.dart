import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:volunteer/pages/personelpage.dart';

import 'communitypage.dart';


class HomeScreen extends StatelessWidget {
  static const List<String> volunteerNumbers = [
    '(1)6366140831'
  ];

  const HomeScreen({super.key});

  static TextEditingController messageController = TextEditingController();

  Future<void> sendLocationSMS(BuildContext context) async {
    if (await Permission.location.request().isGranted &&
        await Permission.sms.request().isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        String googleMapsLink =
            'https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}';

        String message = messageController.text;

        for (String number in volunteerNumbers) {
          await sendSMS(
            message: 'The link is $googleMapsLink',
            recipients: [number],
          );
        }



        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Location SMS Sent Successfully!'),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to send location SMS: $e'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Location and SMS permissions are required.'),
        ),
      );
    }
  }

  Future<void> sendMessageToBackend(String message) async {
    try {
      var response = await http.post(
        Uri.parse(''),
        body: {'message': message},
      );
      if (response.statusCode == 200) {
        print('Message sent to backend successfully');
      } else {
        print('Failed to send message to backend: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending message to backend: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sahara',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.indigo[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/7732609_5236.jpg"),
             ElevatedButton(
                onPressed: () => sendLocationSMS(context),

                style:  ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red)
                ),
               child: const Text('Emergency',style: TextStyle(color: Colors.white),),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  CommunityPage()));
              },

              style:  ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red)
              ),
              child: const Text('Community Issue',style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  PersonelPage()));
              },

              style:  ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red)
              ),
              child: const Text('Personal Issue',style: TextStyle(color: Colors.white),),
            ),

          ],
        ),
      ),
    );
  }
}
