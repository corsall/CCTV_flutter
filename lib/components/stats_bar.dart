import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StatsBar extends StatelessWidget {
  const StatsBar({super.key});

  Future<String> getCurrentIP() async {
    try {
      var response = await http.get(Uri.parse('https://api.ipify.org?format=json'));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        String ipAddress = data['ip'];
        return ipAddress;
      } else {
        throw Exception('Failed to fetch IP address');
      }
    } catch (e) {
      return 'Unknown'; // Return a default value if IP address cannot be fetched
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CurrentTimeDisplay(),
          RichText(
            text: TextSpan(
              text: 'CCTV Status: ',
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(
                  text: 'Online',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Recording Status: ',
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(
                  text: 'Recording',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Storage: ',
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(
                  text: '1 GB remaining',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder<String>(
            future: getCurrentIP(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                String currentIP = snapshot.data!;
                return Text("Current IP: $currentIP");
              }
            },
          ),
        ],
      ),
    );
  }
}

class CurrentTimeDisplay extends StatefulWidget {
  const CurrentTimeDisplay({super.key});

  @override
  State<CurrentTimeDisplay> createState() => _CurrentTimeDisplayState();
}

class _CurrentTimeDisplayState extends State<CurrentTimeDisplay> {
  late Timer _timer;
  String currentTime = '';

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        DateTime now = DateTime.now();
        currentTime = "${now.hour}:${now.minute}:${now.second}";
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text("UTC Time: $currentTime");
  }
}
