import 'package:flutter/material.dart';

import 'package:expandable/expandable.dart';

class DetailExpandablePanel extends StatelessWidget {
  final String headerName;
  final List<String> contentList;
  final bool initialExpanded;

  const DetailExpandablePanel({
    super.key,
    required this.headerName,
    required this.contentList,
    this.initialExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: ExpandablePanel(
        collapsed: const SizedBox(),
        controller: ExpandableController(initialExpanded: initialExpanded),
        theme: const ExpandableThemeData(
          iconSize: 28,
          headerAlignment: ExpandablePanelHeaderAlignment.center,
          iconPadding: EdgeInsets.only(top: 8, right: 10, bottom: 8),
        ),
        header: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
          child: Text(headerName, style: textStyle(context)),
        ),
        expanded: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              ...List.generate(
                contentList.length,
                (index) => Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: .4,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    // bord
                  ),
                  child: Text(
                    contentList[index],
                    style: const TextStyle(letterSpacing: .4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle textStyle(BuildContext context) => TextStyle(
        letterSpacing: 1,
        fontWeight: FontWeight.bold,
        fontSize: MediaQuery.of(context).size.width * 0.038,
      );
}
