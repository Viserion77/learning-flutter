import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required TextEditingController controller,
    String? labelText,
    String? hintText,
    IconData? icon,
    String? errorText,
    Function? onTap,
    Function? onChanged,
  })  : _controller = controller,
        _labelText = labelText,
        _hintText = hintText,
        _icon = icon,
        _errorText = errorText,
        _onTap = onTap,
        _onChanged = onChanged,
        super(key: key);

  final TextEditingController _controller;
  final String? _labelText;
  final String? _hintText;
  final IconData? _icon;
  final String? _errorText;
  final Function? _onTap;
  final Function? _onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        onTap: () => _onTap!(),
        onChanged: (value) => _onChanged!(value),
        decoration: InputDecoration(
          icon: _icon != null ? Icon(_icon) : null,
          labelText: _labelText,
          hintText: _hintText,
          errorText: _errorText,
        ),
        style: const TextStyle(
          fontSize: 24.0,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
