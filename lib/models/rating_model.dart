import 'dart:convert';

class Rating{
  final double rate;
  final int count;

  Rating({
    required this.rate,
   required this.count,
  });
  
  factory Rating.fromJson(Map<String, dynamic> Json){
    return Rating(rate:(Json['rate'] as num).toDouble(), 
    count: Json['count'],
    );
  }
}