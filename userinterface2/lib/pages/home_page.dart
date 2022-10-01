import 'package:flutter/material.dart';
import 'package:userinterface2/utilities/best_selling.dart';
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
              icon: Icon(Icons.message),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
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
                          SizedBox(height: 10),
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
                color: Colors.grey.shade200,
                child: Center(
                  child: Column(
                    children: [
                      //best selling heading
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              'Best Selling',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.more_horiz),
                        ],
                      ),
                      SizedBox(height: 20),

                      //list view of best selling

                      Expanded(
                          child: ListView(
                            children: [
                              BestSelling(
                                icon: Icons.favorite,
                                bestsellingName: 'Orange fresh Juice',
                                numberOfBestSelling: 'For you make fresh Juice Its a pure juice for everyone',
                                price: '40.99 PKR',
                                color: Colors.orange,
                              ),
                              BestSelling(
                                icon: Icons.favorite,
                                bestsellingName: 'Juicy Grapes',
                                numberOfBestSelling: 'Grapes are sweet and it give us good taste',
                                price: '80.99 PKR',
                                color: Colors.green.shade300,
                              ),
                              BestSelling(
                                icon: Icons.star,
                                bestsellingName: 'Fresh Carrot',
                                numberOfBestSelling: 'Carrot is useful for healthy body',
                                price: '25.99 PKR',
                                color: Colors.red,
                              ),
                            ],
                          ) )


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
