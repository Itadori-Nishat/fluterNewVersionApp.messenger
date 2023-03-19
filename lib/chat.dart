import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newversionflutter/DATA_CLASS.dart';

class ChatPage extends StatefulWidget {
  String chatUsername;

  ChatPage({
    Key? key,
    required this.chatUsername,
  }) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textEditingController = TextEditingController();

  final List<String> _messages = [];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.2),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  size: 25,
                )),
            GestureDetector(
              onTap: () {
                Fluttertoast.showToast(
                  msg: "Profile",
                  toastLength: Toast.LENGTH_SHORT,
                  backgroundColor: Colors.red,
                );
              },
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                            color: Colors.grey, shape: BoxShape.circle),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: const Image(
                            image: AssetImage("Assets/img.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 5,
                        bottom: 5,
                        child: Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                              border: Border.all(color: Colors.black)),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width * 0.3,
                        child: Text(
                          widget.chatUsername ?? '',
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      Text(
                        "Active now",
                        style: TextStyle(
                            fontSize: 12, color: Colors.white.withOpacity(0.5)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "Audio Call",
                  toastLength: Toast.LENGTH_SHORT,
                  backgroundColor: Colors.red,
                );
              },
              icon: const Icon(Icons.call)),
          IconButton(
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "Video Call",
                  toastLength: Toast.LENGTH_SHORT,
                  backgroundColor: Colors.red,
                );
              },
              icon: const Icon(Icons.video_call)),
          IconButton(
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "More Info",
                  toastLength: Toast.LENGTH_SHORT,
                  backgroundColor: Colors.red,
                );
              },
              icon: const Icon(Icons.info)),
        ],
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(10),
                          margin: EdgeInsets.only(left: width * 0.15),
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                          child: Text(
                            _messages[index],
                            textAlign: TextAlign.justify,
                            style: const TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                            msg: "Open camera",
                            toastLength: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.red,
                          );
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.shade400),
                          child: const Icon(Icons.camera_alt, color: Colors.white,size: 22,),
                        ),
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "Assets/smile.svg",
                        height: 20,
                        color: Colors.blue,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Message....",
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(
                    msg: "Audio record",
                    toastLength: Toast.LENGTH_SHORT,
                    backgroundColor: Colors.red,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade700),
                    child: const Icon(Icons.mic, color: Colors.white,),
                  ),
                ),
              ),
              IconButton(
                visualDensity: VisualDensity.compact,
                icon: const Icon(
                  Icons.send,
                  size: 25,
                  color: Colors.white,
                ),
                onPressed: () {
                  String message = _textEditingController.text;
                  setState(() {
                    _messages.add(message);
                    _textEditingController.clear();
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
