import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MaterialApp(home: MyImageSlider())
}

class MyImageSlider extends StatefulWidget {
  const MyImageSlider({super.key});

  @override
  State<MyImageSlider> createState() => _MyImageSliderState();
}

class _MyImageSliderState extends State<MyImageSlider> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=800',
    'https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=800',
    'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=800',
    'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?w=800',
    'https://images.unsplash.com/photo-1447752875215-b2761acb3c5d?w=800',
    'https://images.unsplash.com/photo-1472214103451-9374bd1c798e?w=800',
    'https://images.unsplash.com/photo-1501854140801-50d01698950b?w=800',
  ]

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scafold(
      appBar: AppBar(title: const Text("7 Image Slider")),
      body: Column(
        children: [
           SizedBox(height: 50),

          CarouselSlider(
            options: CarouselOptions(
              height: 250.0,
              autoPlay: true, 
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: imgList.map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: Image.network(
                  item,
                  fit: BoxFit.cover,
                  width: 1000,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            )).toList(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return Container(
                width: 20.0,
                height: 80.0,
                margin: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(
                      _currentIndex = entry.key ? 0.9 : 0.4
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
  }
}
