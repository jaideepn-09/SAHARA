import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class PersonelPage extends StatelessWidget {
  const PersonelPage({super.key});

  static TextEditingController messageController = TextEditingController();

  Future<void> sendMessage(String message, String googleMapsLink) async {
    try {
      var response = await http.post(
        Uri.parse('https://1c2a-103-89-235-242.ngrok-free.app/classify'),
        body: {
          'message': message,
          'googleMapsLink': googleMapsLink,
        },
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
        title: Text('Personel Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Write your problem or message here:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter the message',
              ),
              controller: messageController,
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String message = messageController.text;
                Position position = await Geolocator.getCurrentPosition(
                  desiredAccuracy: LocationAccuracy.high,
                );
                String googleMapsLink = 'https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}';
                sendMessage(message, googleMapsLink);
              },
              child: const Text("Send message"),
            ),
          ],
        ),
      ),
    );
  }
}
