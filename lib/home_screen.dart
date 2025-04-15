import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      itemCount: 10,
      itemBuilder: (context, index){
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                width: double.infinity,
                child: Image.network('https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              child: Text('kategori ${index+1}',
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
              child: Text('Produk ${index+1}',
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