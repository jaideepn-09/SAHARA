import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:twilio_flutter/twilio_flutter.dart';

class CommunityPage extends StatelessWidget {
   CommunityPage({super.key});

  TextEditingController messageController = TextEditingController();
  TwilioFlutter twilioFlutter = TwilioFlutter(
    accountSid: '#',
    authToken: '#',
    twilioNumber: '#',
  );

   Future<void> findVolunteers(String message) async {
     try {
       var response = await http.post(
         Uri.parse('https://1c2a-103-89-235-242.ngrok-free.app/find-volunteers'),
         headers: {
           'Content-Type': 'application/json',
         },
         body: jsonEncode({'message': message}),
       );
       if (response.statusCode == 200) {
         var data = jsonDecode(response.body);
         String matchedCategory = data['matched_category'];
         List<dynamic> phoneNumbersDynamic = data['phone_numbers'];
         List<String> phoneNumbers = phoneNumbersDynamic.cast<String>();
         print('Matched Category: $matchedCategory');
         print('Phone Numbers: $phoneNumbers');
         await sendSMS(phoneNumbers, message);
       } else {
         print('Failed to fetch volunteers: ${response.statusCode}');
       }
     } catch (e) {
       print('Error fetching volunteers: $e');
     }
   }

  Future<void> sendSMS(List<String> phoneNumbers, String message) async {
    for (var phoneNumber in phoneNumbers) {
      String formattedPhoneNumber = phoneNumber;
      print('Formatted Phone Number: $formattedPhoneNumber');
      print(formattedPhoneNumber.runtimeType);
      await twilioFlutter.sendSMS(
        toNumber: formattedPhoneNumber,
        messageBody: message,
      );
      print('SMS sent to $phoneNumber');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Page'),
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
                await findVolunteers(message);
              },
              child: const Text("Find Volunteers"),
            ),
          ],
        ),
      ),
    );
  }
}

