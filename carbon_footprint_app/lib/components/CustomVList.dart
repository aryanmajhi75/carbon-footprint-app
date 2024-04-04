import 'package:carbon_footprint_app/dataClasses/listTileData.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomHList extends StatefulWidget {
  final List<listTileData> ListChildren;
  const CustomHList({
    super.key,
    required this.ListChildren,
  });

  @override
  State<CustomHList> createState() => _CustomHListState();
}

class _CustomHListState extends State<CustomHList> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.amber.shade500,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenWidth * 0.8,
                  child: Text(
                    widget.ListChildren[index].title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: "Quicksand",
                      fontSize: 50,
                      overflow: TextOverflow.clip,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Image.asset(
                  widget.ListChildren[index].imageUrl,
                  height: screenHeight * 0.14,
                  width: screenWidth * 0.7,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        );
      },
      itemCount: widget.ListChildren.length,
    );
  }
}
