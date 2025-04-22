import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokoku/models/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   List<Product> _products=[];
  @override
  void initState(){
    super.initState();
    fetchProducts();
  }

Future<void> fetchProducts() async {
 final response = await http.get(Uri.parse('https://fakestoreapi.com/products')
 );
  debugPrint('Response: ${response.body}');

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);

    setState(() {
      _products = data.map(
        (json) => Product.fromJson(json)
      ).toList();
    });

  } else Exception('Gagal mengambil data product');
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TOKOKU'),
      ),
      body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ), 
      itemCount: _products.length,
      itemBuilder: (context, index){
        final Product = _products[index];
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                width: double.infinity,
                child: Image.network(Product.image),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              child: Text(Product.categoty,
                style:TextStyle(
                fontSize: 12,
                color: Colors.grey),
            
              ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              child: Text(Product.title,
                style:TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold),
            
              ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              child: Text('Rp.50.000',
                style:TextStyle(
             
                color: Colors.grey),
            
              ),
              )
              
            ]),);
      },
     ),
         );
  }
}