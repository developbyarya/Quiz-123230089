import 'package:flutter/material.dart';
import 'package:kuis/model/food_list.dart';
import 'package:kuis/screen/detail_makanan.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Text("Makanan Enak | 123230089"),
      ),
      body: ListView.builder(
        itemBuilder: (context, item) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetaiLMakanan(data: dummyFoods[item])));
            },
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  spacing: 16,
                  children: [
                    Image.network(
                      dummyFoods[item].image,
                      width: 150,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dummyFoods[item].name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Card(
                          color: Colors.blueAccent,
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                dummyFoods[item].category,
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Rp. ${dummyFoods[item].price}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: dummyFoods.length,
      ),
    );
  }
}
