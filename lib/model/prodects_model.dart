class ProdectModel {
  dynamic? id;
  String? title;
  dynamic? price;
  String? description;
  String? category;
  String? image;
  // RatingModel? rating;

  ProdectModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });
  // this.rating});

  factory ProdectModel.fromJson(json) {
    return ProdectModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
    // rating: RatingModel.fromJson(json['rating']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    // if (this.rating != null) {
    //   data['rating'] = this.rating!.toJson();
    // }
    return data;
  }
}

// class RatingModel {
//   double? rate;
//   int? count;

//   RatingModel({this.rate, this.count});

//   factory RatingModel.fromJson(Map<String, dynamic> json) {
//     return RatingModel(count: json['count'], rate: json['rate']);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['rate'] = this.rate;
//     data['count'] = this.count;
//     return data;
//   }
// }
