import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  final String filter;
  final ValueChanged<String> onFilterChanged;

  const FilterWidget(
      {super.key, required this.filter, required this.onFilterChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Filtrar por título',
          border: OutlineInputBorder(),
        ),
        onChanged: onFilterChanged,
      ),
    );
  }
}
