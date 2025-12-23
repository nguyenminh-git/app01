import 'package:flutter/material.dart';
class BannerSlide extends StatefulWidget {
  const BannerSlide({super.key});

  @override
  State <BannerSlide> createState() =>  BannerSlideState();
}

class  BannerSlideState extends State <BannerSlide> {
  int _currentIndex = 0;
  final List<String> banners=[
    'assets/images/11quatdieuhoamini.jpg',
    'assets/images/19banlamviecgosoi.jpg',
    'assets/images/24tranhtreotuongcanvas.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160,
          child: PageView.builder(
            itemCount: banners.length,
            onPageChanged: (index){
              setState(() => _currentIndex=index);
            },
            itemBuilder: (_,index)=>Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  banners[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            )
          ),
        ),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            banners.length,
            (i)=>Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentIndex==i?10:6,
              height: 6,
              decoration: BoxDecoration(
                color: _currentIndex==i?Colors.orange:Colors.grey,
                borderRadius: BorderRadius.circular(3),
              ),
            ) 
            //generator
          )
        )
      ],
    );
  }
}