import 'package:flutter/material.dart';

import 'archive_list.dart';

class Archive_screen extends StatefulWidget {
  const Archive_screen({Key? key}) : super(key: key);

  @override
  State<Archive_screen> createState() {
    return _Archive_screen();
  }
}

class _Archive_screen extends State<Archive_screen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          margin: const EdgeInsets.only(top: 50),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  'Choose a category for search post ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: "segoe",
                    color: Color.fromARGB(200, 0, 0, 0),
                  ),
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Archive_list()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        'Done ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "segoe",
                          color: Color.fromARGB(200, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, left: 80),
                    child: Text(
                      'Category ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "segoe",
                        color: Color.fromARGB(200, 0, 0, 0),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Archive_list()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 20, left: 70),
                      child: Text(
                        'Cancel ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "segoe",
                          color: Color.fromARGB(232, 34, 65, 170),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18, left: 20),
                child: Container(
                  height: 40,
                  width: 320,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        suffixIcon: Icon(
                          Icons.mic,
                          color: Colors.grey,
                        )),
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: ListView.separated( separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      );
                      },
                        itemCount:90,
                        itemBuilder: (BuildContext, Index) {
                          return GestureDetector(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 25,left: 20,bottom: 10),
                                  child: Text('Entertainment',style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w400),),
                                ),
                              ],
                            ),
                          );
                        }
                        ),
                  )
              ),
              Container(
                height: 50,
              )
            ],
          ),
        ));
  }
}
