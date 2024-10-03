import 'dart:ffi';
import 'updateprodect.dart';
import 'package:flutter/material.dart';
import 'package:store_app/helper/Api.dart';
import 'package:store_app/model/prodects.dart';
import 'package:store_app/model/prodects_model.dart';
import 'package:store_app/model/users.dart';
import 'package:store_app/services/AddProdect.dart';
import 'package:store_app/services/allcategories.dart';
import 'package:store_app/services/allprodect_categories.dart';
import 'package:store_app/services/allprodect_service.dart';
import 'package:store_app/services/updateprodect.dart';
import '../services/s.dart';
import '../widgets/cardprodect.dart';
import 'package:http/http.dart' as http;
import '../services/userservice.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});
  static String id = 'HomePage';

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),

      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              ))
        ],
        backgroundColor: Color.fromARGB(255, 255, 140, 0),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "NEW",
              style: TextStyle(color: Color.fromARGB(255, 255, 214, 64)),
            ),
            Text(
              " Trend",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: FutureBuilder<List<ProdectModel>>(
        future: allprodectcatogries_service().GetAllProdectCatogries(),
        // initialData: InitialData,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          if (snapshot.hasData) {
            List<ProdectModel> Prodactlist = snapshot.data!;
            return Padding(
              padding: EdgeInsets.only(top: 60, left: 5, right: 5),
              child: GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 80,
                    crossAxisCount: 2,
                    childAspectRatio: 1.5),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int i) {
                  return CustomCard(
                    prodec: Prodactlist[i],
                  );
                },
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

      // body: Container(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       var res = AddProdect().addProdect(
      //           title: 'kkkkkkk',
      //           price: '23.8',
      //           category: 'Electronics',
      //           descrption: 'descrption',
      //           image: 'https://jfksjfs.png');

      //       print(res);
      //     },
      //     child: Text("Get Products"),
      //   ),
      // ));
    );
  }
}

class customcard2 extends StatelessWidget {
  const customcard2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          // decoration: BoxDecoration(boxShadow: [
          //   BoxShadow(
          //       // spreadRadius: 1,
          //       color: Colors.grey.withOpacity(0.6),
          //       blurRadius: 10,
          //       offset: Offset(5, 5))
          // ]),
          height: 130,
          // width: 200,
          width: MediaQuery.of(context).size.width / 2,
          child: Card(
            elevation: 8,
            // color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "data  new",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r"$250",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Spacer(),
        Positioned(
          right: 32,
          top: -50,
          child: Image.network(
            "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
            height: 100,
          ),
        ),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  // String title;
  // String price;
  // String image;
  // int? num;

  ProdectModel prodec;
  CustomCard({
    required this.prodec,

    // required this.title,
    // required this.price,
    // required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // prodec.id=num;
    return GestureDetector(
      onTap: () {
        // print('${prodec.id}'
        //     '${prodec.title}'
        //     '${prodec.price}'
        //     '${prodec.image}'
        //     '${prodec.category}');
        Navigator.pushNamed(context, updateProdect.id, arguments: prodec);
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //   builder: (context) => updateProdect(
        //     prodect: prodec,
        //   ),
        // ));
      },
      child: Card(
        shadowColor: Color.fromARGB(255, 255, 149, 0),
        elevation: 5,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                top: -60,
                left: 80,
                child: Image.network(
                  "${prodec.image}",
                  height: 110,
                  width: 70,
                )),
            Container(
              width: MediaQuery.of(context).size.width / 2 - 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 10),
                    child: Text(
                      '${prodec.title!.split(" ").take(4).join(' ')}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(r'$' '${prodec.price}')),
                      Container(
                          margin: EdgeInsets.only(
                            right: 10,
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ))
                    ],
                  )
                ],
              ),
            ),
            // Positioned(
            //     child: Image.network(
            //   "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
            //   height: 100,
            // ),
            // ),
          ],
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final String name;
  final String email;
  String? avatarUrl;

  UserCard({
    super.key,
    required this.name,
    required this.email,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(avatarUrl!),
        ),
        title: Text(name),
        subtitle: Text(email),
      ),
    );
  }
}

// FutureBuilder<List<ProdectModel>>(
//           future: allprodect_service().GetAllProdect(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               var prodect = snapshot.data;
//               return GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                 ),
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (BuildContext context, int i) {
//                   return ProdCard(
//                       imagePath: '${prodect![i].image}',
//                       nameProdect: '${prodect[i].title}',
//                       price: '${prodect[i].price}');
//                 },
//               );
//             }
//             if (snapshot.hasError) {
//               Center(
//                 child: Text("${snapshot.error}"),
//               );
//             }

//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           },
//         ));
