import 'package:flutter/material.dart';

class YemekSiparis extends StatelessWidget {
  String? foodName;
  double? foodPrice;
  var foodPhoto;

  YemekSiparis(
      {required this.foodName,
      required this.foodPrice,
      required this.foodPhoto});

  @override
  Widget build(BuildContext context) {
    var ekranOlcu=MediaQuery.of(context).size;
    var ekranYukseklik = ekranOlcu.height;
    var ekranGenislik = ekranOlcu.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(foodName!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: ekranYukseklik/2,
                child: Image.asset("foodphotos/$foodPhoto")),
            Text(foodPrice.toString(),style: const TextStyle(fontSize: 50,color: Colors.blue),),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("$foodName Şiparişiniz Alınmıştır!"),
                    ));
                  },
                  child: const Text(
                    "Şipariş Ver",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
