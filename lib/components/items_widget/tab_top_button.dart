import 'package:flutter/material.dart';
import '../../basic_core/pick_theme.dart';
import '../../basic_core/screen_adapter.dart';

class TabTopButton extends StatelessWidget {
  final String _title;
  final void Function(int) callback;
  final int index;
  final bool current;

  const TabTopButton(this._title, this.index, this.callback, {this.current = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: current ? Colors.blue : Colors.white,
      ),
      child: InkWell(
        child: Text(
          _title,
          style: TextStyle(
            color: current ? Colors.white : Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        onTap: () {
          callback.call(index);
        },
      ),
    );
  }
}
