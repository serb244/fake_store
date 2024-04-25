import 'package:flutter/material.dart';

class DropdownWithSearch extends StatefulWidget {
  final Map<int, dynamic> options;
  final int initialValue;
  final String labelText;
  final double builderHeight;
  final bool isNeedSearchInKeys;
  final void Function(int?)? onSelected;
  final void Function(String?)? onTextChanged;

  const DropdownWithSearch({
    required this.options,
    required this.labelText,
    required this.initialValue,
    this.onSelected,
    this.onTextChanged,
    this.builderHeight = 250,
    this.isNeedSearchInKeys = true,
    super.key,
  });

  @override
  DropdownWithSearchState createState() => DropdownWithSearchState();
}

class DropdownWithSearchState extends State<DropdownWithSearch> {
  late String selectedText;

  @override
  void initState() {
    super.initState();
    selectedText = '${widget.initialValue} ${widget.options[widget.initialValue]}';
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<MapEntry<int, dynamic>>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        return widget.options.entries.where((entry) {
          if (widget.isNeedSearchInKeys) {
            return entry.toString().toLowerCase().contains(textEditingValue.text.toLowerCase());
          } else {
            return entry.value.toString().toLowerCase().contains(textEditingValue.text.toLowerCase());
          }
        });
      },
      onSelected: (entry) {
        widget.onSelected?.call(entry.key);
        setState(() {
          selectedText = '${entry.key} ${entry.value}';
        });
      },
      optionsViewBuilder:
          (BuildContext context, AutocompleteOnSelected<MapEntry<int, dynamic>> onSelected, Iterable<MapEntry<int, dynamic>> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            child: SizedBox(
              height: widget.builderHeight,
              child: ListView(
                children: options.map((entry) {
                  return ListTile(
                    title: Text('${entry.key} ${entry.value}'),
                    onTap: () {
                      onSelected(entry);
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
      fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
        return Row(
          children: [
            Flexible(
              child: TextFormField(
                controller: textEditingController..text = selectedText,
                focusNode: focusNode,
                onChanged: widget.onTextChanged,
                decoration: InputDecoration(
                  labelText: widget.labelText,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            Column(
              children: [
                InkWell(
                  child: const Icon(Icons.close),
                  onTap: () {
                    selectedText = '';
                    widget.onSelected?.call(0);
                    setState(() {});
                  },
                ),
                InkWell(
                  child: const Icon(Icons.refresh),
                  onTap: () {
                    widget.onSelected?.call(widget.initialValue);
                    selectedText = '${widget.initialValue} ${widget.options[widget.initialValue]}';
                    setState(() {});
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
