import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomDropDownSearch extends StatefulWidget {
  final String? title;
  final List<SelectedListItem>? listData;
  final TextEditingController? dropDownSelectedName;
  final TextEditingController? dropDownSelectedId;
  final bool? isMultiple;
  const CustomDropDownSearch({super.key, this.title, this.listData, this.dropDownSelectedName, this.dropDownSelectedId, this.isMultiple});

  @override
  State<CustomDropDownSearch> createState() => _CustomDropDownSearchState();
}

class _CustomDropDownSearchState extends State<CustomDropDownSearch> {

  void showDropDownState(){
    DropDownState(
      DropDown(
        bottomSheetTitle: Text(
          widget.title!,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'تم',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listData ?? [],
        selectedItems: (List<dynamic> selectedList) {
          if (widget.isMultiple!) {
            List<String> selectedNames = [];
            List<String> selectedIds = [];

            for (var item in selectedList) {
              SelectedListItem selectedListItem = item;
              selectedNames.add(selectedListItem.name);
              selectedIds.add(selectedListItem.value!);
            }

            widget.dropDownSelectedName!.text = selectedNames.join('');
            widget.dropDownSelectedId!.text = selectedIds.join('');
          } else {
            SelectedListItem selectedListItem = selectedList[0];
            widget.dropDownSelectedName!.text = selectedListItem.name;
            widget.dropDownSelectedId!.text = selectedListItem.value!;
          }
        },
        enableMultipleSelection: widget.isMultiple!,
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: TextFormField(
        controller: widget.dropDownSelectedName,
        cursorColor: Colors.black,
        onTap:() {
          FocusScope.of(context).unfocus();
          showDropDownState();
        },
        decoration: InputDecoration(
          hintText: widget.dropDownSelectedName!.text == '' ? widget.title : widget.dropDownSelectedName!.text,
          hintStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(widget.dropDownSelectedName!.text == ''
                ? widget.title!
                : widget.dropDownSelectedName!.text),
          ),
          hintTextDirection: TextDirection.rtl,
          suffixIcon: InkWell(child: const Icon(Icons.arrow_drop_down),onTap: (){},),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
        ),
      ),
    );
  }
}
