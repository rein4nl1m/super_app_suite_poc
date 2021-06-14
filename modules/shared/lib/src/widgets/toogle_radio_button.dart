import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class ToogleRadioButton extends StatefulWidget {
  final List<String> optionsList;
  final Function(String) onTap;
  final bool expanded;
  final bool isMargem;

  const ToogleRadioButton({
    Key? key,
    required this.optionsList,
    required this.onTap,
    this.expanded = true,
    this.isMargem = true,
  }) : super(key: key);

  @override
  _ToogleRadioButtonState createState() => _ToogleRadioButtonState(
        this.isMargem,
        this.optionsList,
        this.onTap,
        this.expanded,
      );
}

class _ToogleRadioButtonState extends State<ToogleRadioButton> {
  final List<String> optionsList;
  final Function(String) onTap;
  final bool expanded;
  final bool isMargem;

  _ToogleRadioButtonState(
    this.isMargem,
    this.optionsList,
    this.onTap,
    this.expanded,
  );

  String? _option;
  int lastPosition = 0;

  TextStyle selectedOptionStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 13,
  );
  TextStyle unselectedMargemOptionStyle = TextStyle(
    color: margemPrimaryColor,
    fontWeight: FontWeight.normal,
    fontSize: 13,
  );
  TextStyle unselectedOffertaOptionStyle = TextStyle(
    color: offertaPrimaryColor,
    fontWeight: FontWeight.normal,
    fontSize: 13,
  );

  BorderSide defaultBorderSide = BorderSide(
    color: margemPrimaryColor,
    width: 1,
  );

  List<Widget> get generateOptions {
    final customBorderRadius = (int item) {
      if (item == 0) {
        return const BorderRadius.only(
          topLeft: const Radius.circular(20),
          bottomLeft: const Radius.circular(20),
        );
      }
      if (item == lastPosition) {
        return const BorderRadius.only(
          topRight: const Radius.circular(20),
          bottomRight: const Radius.circular(20),
        );
      }
    };

    var optionSize =
        (MediaQuery.of(context).size.width / widget.optionsList.length) * .85;

    var mediumOptionSize =
        (MediaQuery.of(context).size.width / widget.optionsList.length) * .4;

    List<Widget> options = [];
    for (var i = 0; i < widget.optionsList.length; i++) {
      bool selected = _option == widget.optionsList[i];
      options.add(
        GestureDetector(
          child: Container(
            width: widget.expanded ? optionSize : mediumOptionSize,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: selected
                  ? isMargem
                      ? margemPrimaryColor
                      : offertaPrimaryColor
                  : Colors.grey[200],
              borderRadius: customBorderRadius(i),
              border: Border.fromBorderSide(defaultBorderSide),
            ),
            alignment: Alignment.center,
            child: Text(
              widget.optionsList[i],
              style: selected
                  ? selectedOptionStyle
                  : isMargem
                      ? unselectedMargemOptionStyle
                      : unselectedOffertaOptionStyle,
            ),
          ),
          onTap: () {
            setState(() {
              _option = widget.optionsList[i];
            });
            widget.onTap(_option ?? "");
          },
        ),
      );
    }

    return options;
  }

  @override
  void initState() {
    super.initState();
    lastPosition = widget.optionsList.length - 1;
    _option = widget.optionsList.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: generateOptions,
      ),
    );
  }
}
