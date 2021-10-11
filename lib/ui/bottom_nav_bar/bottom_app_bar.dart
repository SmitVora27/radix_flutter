import 'package:flutter/material.dart';
import 'package:flutter_radixweb/constant/index.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem(
      {required this.selectedIcon,
      this.text,
      this.index});

  IconData selectedIcon;
  String? text;
  int? index;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar(
      {this.items,
      this.centerItemText,
      this.height: 60.0,
      this.onTabSelected,
      this.modifiedIndex}) {
    assert(this.items?.length == 2 || this.items?.length == 4);
  }

  final List<FABBottomAppBarItem>? items;
  final String? centerItemText;
  final double height;
  final ValueChanged<int>? onTabSelected;
  final int? modifiedIndex;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  void _updateIndex(int index) {
    widget.onTabSelected!(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void didUpdateWidget(covariant FABBottomAppBar oldWidget) {
    if (widget.modifiedIndex != null && widget.modifiedIndex == 0) {
      _selectedIndex = widget.modifiedIndex!;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(
        widget.items!.length,
        (int index) => _buildTabItem(
              item: widget.items![index],
              index: index,
              onPressed: _updateIndex,
            ));
    // items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: AppColors.kWhite,
    );
  }

  Widget _buildTabItem({
    FABBottomAppBarItem? item,
    int? index,
    ValueChanged<int>? onPressed,
  }) {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed!(index ?? 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  item?.selectedIcon,
                  size: AppFontSize.value20,
                  color: _selectedIndex == index? AppColors.kMain : AppColors.kGrey,
                ),
                Text(item?.text ?? "", style: TextStyles.getH5BlackRegular().copyWith(
                  color: _selectedIndex == index? AppColors.kMain : AppColors.kGrey,
                  fontWeight: _selectedIndex == index? FontWeight.bold : FontWeight.w500
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
