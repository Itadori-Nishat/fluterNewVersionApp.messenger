import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<String> _message = [    "Message 1",    "Message 2",    "Message 3",    "Message 4",    "Message 5",  ];
  String reactmsg = "❤️";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete Message on Tap Demo"),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: (){
                Vibration.vibrate(duration: 1000, );
              },
              child: Text("Tap to vibrate")),
          Expanded(
            child: ListView.builder(
              itemCount: _message.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_message[index]),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Delete Message"),
                          content: Text("Are you sure you want to delete this message?"),
                          actions: [
                            TextButton(
                              child: Text("Cancel"),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            TextButton(
                              child: Text("Delete"),
                              onPressed: () {
                                setState(() {
                                  _message.removeAt(index);
                                });
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
