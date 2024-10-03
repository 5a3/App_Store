import 'package:flutter/material.dart';
import 'package:store_app/model/prodects_model.dart';
import 'package:store_app/services/AddProdect.dart';
import 'package:store_app/services/updateprodect.dart';
import 'package:store_app/widgets/customtextfiled.dart';
import 'homepage.dart';
import 'dart:convert';

class updateProdect extends StatefulWidget {
  static String id = 'UpdateProdect';

  updateProdect({
    super.key,
  });

  @override
  State<updateProdect> createState() => _updateProdectState();
}

class _updateProdectState extends State<updateProdect> {
  TextEditingController title = new TextEditingController();
  TextEditingController price = new TextEditingController();
  TextEditingController image = new TextEditingController();
  TextEditingController descrption = new TextEditingController();
  TextEditingController category = new TextEditingController();
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   title.text = widget.prodect!.title.toString().substring(0, 6);
  //   price.text = widget.prodect!.price.toString();
  //   descrption.text = widget.prodect!.description.toString();
  //   image.text = widget.prodect!.image.toString();
  // }

  @override
  Widget build(BuildContext context) {
    ProdectModel prodect =
        ModalRoute.of(context)!.settings.arguments as ProdectModel;
    return Scaffold(
        appBar: AppBar(title: Text("Update Prodect")),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: formkey,
            child: Column(
              children: [
                customtextfiled(
                  controller: title,
                  title: 'العنوان',
                ),
                customtextfiled(
                  controller: image,
                  title: 'الصوره',
                ),
                customtextfiled(
                  controller: descrption,
                  title: 'الوصف',
                ),
                customtextfiled(
                  controller: price,
                  title: 'السعر',
                ),
                customtextfiled(
                  controller: category,
                  title: 'الفئه',
                ),
                MaterialButton(
                  color: Color.fromARGB(255, 244, 122, 0),
                  onPressed: () {
                    UpdateProdect_service().updateProdect(
                        id: '${prodect.id}'.toString(),
                        title: '${title.text}',
                        price: '${price.text}',
                        descrption: '${descrption.text}',
                        category: '${category.text}',
                        image: '${image.text}');
                  },
                  child: Text('تعديل'),
                )
              ],
            ),
          ),
        ));
  }
}
