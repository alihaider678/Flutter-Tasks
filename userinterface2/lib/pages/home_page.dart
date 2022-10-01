import 'package:flutter/material.dart';
import 'package:userinterface2/utilities/emoticon_face.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
          label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ''
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, Ali!',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text('what would you buy today?',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),


                      // Notification

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Icon(Icons.notifications,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 25,
                  ),


                  //search bar

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(Icons.search,
                          color: Colors.orange,),
                        SizedBox(width: 5),
                        Text('search',
                          style: TextStyle(
                            color: Colors.orange,
                          ),)
                      ],
                    ),
                  ),

                  SizedBox(height: 25),

                  //How do you feel?

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'How do you feel?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.more_horiz,
                        color: Colors.white,
                      )
                    ],
                  ),

                  SizedBox(height: 25),

                  // 4 Different Faces
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //bad
                      Column(
                        children: [
                          EmoticonFace(
                            emoticonFace:'😫' ,
                          ),

                          SizedBox(height: 8),

                          Text(
                            'Bad',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          )
                        ],
                      ),

                      //fine
                      Column(
                        children: [
                          EmoticonFace(
                            emoticonFace:'🙂' ,
                          ),

                          SizedBox(height: 8),

                          Text(
                            'Fine',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          )
                        ],
                      ),

                      //well
                      Column(
                        children: [
                          EmoticonFace(
                            emoticonFace:'😁' ,
                          ),

                          SizedBox(height: 8),

                          Text(
                            'Well',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          )
                        ],
                      ),

                      //excellent
                      Column(
                        children: [
                          EmoticonFace(
                            emoticonFace:'🤩' ,
                          ),

                          SizedBox(height: 8),

                          Text(
                            'Excellent',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),


            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                color: Colors.grey.shade100,
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              'Best Selling',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.more_horiz),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )

          ],
        ),
      )
    );
  }
}
