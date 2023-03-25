import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newversionflutter/DATA_CLASS.dart';
import 'package:newversionflutter/Img_picker.dart';
import 'chat.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,

      ///APP BAR
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Fluttertoast.showToast(
                  msg: "Drawer",
                  toastLength: Toast.LENGTH_SHORT,
                  backgroundColor: Colors.red,
                );
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(0.7)),
                child: const Icon(Icons.menu),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Text(
              "Chats",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePickerExample()));
                },
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.7)),
                  child: const Icon(Icons.camera_alt),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(
                    msg: "Edit",
                    toastLength: Toast.LENGTH_SHORT,
                    backgroundColor: Colors.red,
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.7)),
                  child: const Icon(
                    Icons.edit,
                    size: 19,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: ListView(
          children: [
            ///SEARCH FIELD
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  fillColor: Colors.grey.withOpacity(0.5),
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: "Search",
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),

            ///ACTIVE USERS
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                            color: Colors.grey, shape: BoxShape.circle),
                        child: const Icon(Icons.add),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        "Your story",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      )
                    ],
                  ),
                  Row(
                      children: List.generate(
                    NewDataTable.newData.length,
                    (index) {
                      var user =  NewDataTable.newData.elementAt(index);
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          width: 80,
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    height: 60,
                                    width: 60,
                                    decoration: const BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.asset("Assets/img" + (index + 1).toString() +".jpg"),
                                    ),
                                  ),
                                  Positioned(
                                    right: 5,
                                    bottom: 5,
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green,
                                          border:
                                              Border.all(color: Colors.black)),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              SizedBox(
                                width: 60,
                                child: Text(
                                  user["name"],
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 13),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            ///USER AND MESSAGES
            ...List.generate(NewDataTable.newData.length, (index) {
              var user =  NewDataTable.newData.elementAt(index);
              return Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(chatUsername: user['name'],)));
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset("Assets/img" + (index + 1).toString() +".jpg"),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 5,
                              bottom: 5,
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                    border:
                                    Border.all(color: Colors.black)),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user["name"], style: TextStyle(
                              fontSize: 17,
                              color: Colors.white.withOpacity(0.7)
                            ),),
                            const SizedBox(height: 5,),
                             Row(
                               children: [
                                 Text("say Hi 👋",
                                   style: TextStyle(
                                       color: Colors.white.withOpacity(0.7),
                                       fontSize: 13,
                                       overflow: TextOverflow.clip
                                   ),),
                               ],
                             )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            )
          ],
        ),
      ),
    );
  }
}
