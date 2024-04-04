import 'package:carbon_footprint_app/constants.dart';
import 'package:carbon_footprint_app/dataClasses/expansionListData.dart';
import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  final String heading;
  final List<ExpansionListData> items;

  const CustomExpansionTile({
    super.key,
    required this.heading,
    required this.items,
  });

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _expand = false;

  final TextStyle _headingTStyle = const TextStyle(
    color: Colors.white,
    fontSize: 50,
    fontWeight: FontWeight.bold,
  );

  final TextStyle _dataTStyle = const TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white70,
  );

  final TextStyle _titleStyle = const TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white70,
  );

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return ExpansionPanelList(
      animationDuration: const Duration(seconds: 1),
      dividerColor: DTprimary().onIconCol,
      elevation: 6,
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          _expand = isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return ListTile(
              title: Text(
                widget.heading,
                style: _headingTStyle,
              ),
            );
          },
          backgroundColor: DTprimary().onContainer.withAlpha(90),
          isExpanded: _expand,
          canTapOnHeader: true,
          body: Padding(
            padding: ComponentData().defPad,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.4,
                      child: Text(
                        widget.items[0].title,
                        style: _titleStyle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.4,
                      child: Text(
                        widget.items[0].data,
                        style: _dataTStyle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.4,
                      child: Text(
                        widget.items[1].title,
                        style: _titleStyle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.4,
                      child: Text(
                        widget.items[1].data,
                        style: _dataTStyle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
