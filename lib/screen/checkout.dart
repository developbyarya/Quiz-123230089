import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  final int total_harga;
  const Checkout({super.key, required this.total_harga});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          Icon(
            Icons.verified,
            color: Colors.green,
          ),
          Text(
            "Chekckout Berhasil",
            style: TextStyle(
                color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "Rp. $total_harga",
            style: TextStyle(
                color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text("Kembali Ke Home"),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
