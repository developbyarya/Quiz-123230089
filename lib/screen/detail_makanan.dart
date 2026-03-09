import 'package:flutter/material.dart';
import 'package:kuis/model/food_list.dart';
import 'package:kuis/screen/checkout.dart';

class DetaiLMakanan extends StatefulWidget {
  final Food data;
  const DetaiLMakanan({super.key, required this.data});

  @override
  State<DetaiLMakanan> createState() => _DetaiLMakananState();
}

class _DetaiLMakananState extends State<DetaiLMakanan> {
  int jumlah_makanan = 0;
  int total_harga = 0;
  final TextEditingController _controller = TextEditingController(text: "0");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.data.name),
        ),
        body: Column(
          children: [
            SizedBox(
              width: 300,
              child: Image.network(widget.data.image),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.data.name,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.data.category,
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rp. ${widget.data.price}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${widget.data.calories} kcal',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Text(
                      widget.data.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 14),
                    ),
                    Text('Komposisi: ${widget.data.ingredients.join(', ')}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18)),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: 20,
                      children: [
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            controller: _controller,
                            decoration: InputDecoration(
                                prefixIcon: IconButton(
                                    onPressed: () {
                                      if (jumlah_makanan > 0) {
                                        setState(() {
                                          jumlah_makanan--;
                                          total_harga = widget.data.price *
                                              jumlah_makanan;
                                          _controller.text = '$jumlah_makanan';
                                        });
                                      }
                                    },
                                    icon: Icon(Icons.remove)),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        jumlah_makanan++;
                                        total_harga =
                                            widget.data.price * jumlah_makanan;
                                        _controller.text = '$jumlah_makanan';
                                      });
                                    },
                                    icon: Icon(Icons.add)),
                                border: OutlineInputBorder(),
                                hintText: "Jumlah"),
                          ),
                        ),
                        Text(
                          "Total: Rp. $total_harga",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    foregroundColor: Colors.white),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => Checkout(
                                              total_harga: total_harga)));
                                },
                                child: Text(
                                  "Checkout",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )))
                      ],
                    )
                  ]),
            ))
          ],
        ));
  }
}
