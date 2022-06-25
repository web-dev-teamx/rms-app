import 'package:flutter/material.dart';
import 'package:sv_rms_mobile/utils/app_theme.dart';

class CustomTabBarItem {
  final String label;
  final IconData iconData;

  CustomTabBarItem(
    Key? key, {
    required this.label,
    required this.iconData,
  });
}

class CustomTabBar extends StatefulWidget {
  final List<CustomTabBarItem> items;
  final Function(CustomTabBarItem item, int index) onChanged;
  const CustomTabBar({
    Key? key,
    required this.onChanged,
    required this.items,
  }) : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  late Object initialValue;

  @override
  void initState() {
    initialValue = widget.items.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.items
          .mapIndex(
            (item, index) => InkWell(
              onTap: () {
                widget.onChanged;
              },
              child: SizedBox(
                height: 40,
                width: (MediaQuery.of(context).size.width / 3) - (40 / 3),
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOutCirc,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: item == widget.items[index] ? 16 : 14,
                    color: item == widget.items[index]
                        ? AppTheme.primaryColor
                        : Colors.grey,
                  ),
                  child: Center(
                    child: Text(
                      item.label,
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

extension ExtendedIterable<E> on Iterable<E> {
  /// Like Iterable<T>.map but callback have index as second argument
  Iterable<T> mapIndex<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }

  void forEachIndex(void Function(E e, int i) f) {
    var i = 0;
    for (var e in this) {
      f(e, i++);
    }
  }
}
