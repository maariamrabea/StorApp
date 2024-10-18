import 'package:flutter/material.dart';

class SizeList extends StatefulWidget {
  const SizeList({super.key});

  @override
  State<SizeList> createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  final List<String> sizeList = ['s', 'm', 'l', 'xl', 'xxl'];
  var currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  currentSelected = index;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  color:currentSelected==index?

                  Colors.teal.withOpacity(0.4):Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border:
                      Border.all(color: Colors.grey.withOpacity(0.4), width: 2),
                ),
                child: Text(
                  sizeList[index],
                  style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
          itemCount: sizeList.length),
    );
  }
}
