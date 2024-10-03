import 'package:flutter/material.dart';

class ProdCard extends StatelessWidget {
  final String imagePath;
  final String nameProdect;
  final String price;
  const ProdCard({
    super.key,
    required this.imagePath,
    required this.nameProdect,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: 190,
      height: 100,
      child: Card(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10)),
              child: Container(
                height: 120,
                child: Image.network(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    price + " SRA",
                    style: TextStyle(
                        fontSize: 5,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 8),
                  child: Text(
                    nameProdect,
                    style: TextStyle(
                        fontFamily: "Cairo",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Icon(
                    Icons.shopping_basket_outlined,
                    size: 20,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Icon(
                    Icons.favorite,
                    size: 17,
                    color: Colors.red,
                  ),
                ),
                Spacer(),
                Container(
                  child: Icon(
                    Icons.star,
                    size: 15,
                    color: Color.fromARGB(255, 252, 227, 0),
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star,
                    size: 15,
                    color: Color.fromARGB(255, 252, 227, 0),
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star,
                    size: 15,
                    color: Color.fromARGB(255, 252, 227, 0),
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star,
                    size: 15,
                    color: Color.fromARGB(255, 252, 227, 0),
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star,
                    size: 15,
                    color: Color.fromARGB(255, 252, 227, 0),
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star,
                    size: 15,
                    color: Color.fromARGB(255, 252, 227, 0),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: MaterialButton(
                minWidth: 160,
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => prodctPage()),
                  // );
                },
                child: Text(
                  "عرض",
                  style: TextStyle(
                      fontFamily: "Cairo", fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
