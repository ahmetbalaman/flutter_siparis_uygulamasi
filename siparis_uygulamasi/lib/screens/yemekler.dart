import 'package:flutter/material.dart';
import 'package:siparis_uygulamasi/foods.dart';
import 'package:siparis_uygulamasi/screens/yemeksiparis.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}
/*  List<String> foodName = ["Köfte", "Ayran", "Fanta", "Makarna"];
  var foodPhotoAsset = ["köfte.jpg", "ayran.webp", "fanta.png", "makarna.jpg"];
  List<double> foodPrice = [15.99, 2.0, 3.0, 14.99];*/

class _FoodPageState extends State<FoodPage> {
  Future<List<foods>> verilerial() async {
    List<foods> yemek = [];

    foods y1 = foods(1, "Köfte", 15.99, "köfte.jpg");
    foods y2 = foods(2, "Ayran", 2.0, "ayran.webp");
    foods y3 = foods(3, "Fanta", 3.0, "fanta.png");
    foods y4 = foods(4, "Makarna", 14.99, "makarna.jpg");

    yemek.add(y1);
    yemek.add(y2);
    yemek.add(y3);
    yemek.add(y4);

    return yemek;
  }

  @override
  Widget build(BuildContext context) {
    var ekranOlcu = MediaQuery.of(context).size;
    var ekranYukseklik = ekranOlcu.height;
    var ekranGenislik = ekranOlcu.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Yemekler"),
        ),
        body: FutureBuilder<List<foods>>(
          future: verilerial(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var yemek = snapshot.data;

              return ListView.builder(
                itemCount: yemek!.length,
                itemBuilder: (context, index) {
                  var yemekk = yemek[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => YemekSiparis(
                                  foodName: yemekk.foodName,
                                  foodPhoto: yemekk.foodPhotoAsset,
                                  foodPrice: yemekk.foodPrice)));
                    },
                    child: Card(
                      elevation: 1,
                      child: Row(
                        children: [
                          SizedBox(
                              width: ekranGenislik / 3,
                              height: ekranYukseklik / 6,
                              child: Image.asset(
                                  "foodphotos/${yemekk.foodPhotoAsset}")),
                          Padding(
                            padding: EdgeInsets.only(left: ekranGenislik / 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  yemekk.foodName!,
                                  style: baslikstil,
                                ),
                                SizedBox(height: ekranYukseklik / 12),
                                Text(
                                  "${yemekk.foodPrice!}",
                                  style: altbaslikstil,
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_right,
                            size: 50,
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center();
            }
          },
        ));
  }
}

TextStyle get baslikstil => const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
TextStyle get altbaslikstil => const TextStyle(
    fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue);
