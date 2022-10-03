import 'package:flutter/material.dart';
class BestSelling extends StatelessWidget {
  final icon;
  final String bestsellingName;
  final String numberOfBestSelling;
  final String price;
  final color;

  const BestSelling({
    Key? key,
    required this.color,
    required this.icon,
    required this.bestsellingName,
    required this.numberOfBestSelling,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                padding: EdgeInsets.all(8),
                color: color,
                child: Icon(icon,
                  color: Colors.white,),
              ),
            ),
            SizedBox(
                width: 12
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(bestsellingName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                //subtitle
                Text(numberOfBestSelling,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),),
                SizedBox(height: 5),
                Text(price,
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
