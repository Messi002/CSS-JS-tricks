import 'package:flutter/material.dart';

extension ToListView<T> on Iterable<T> {
  Widget toListView() => IterableListView(iterable: this);
}

class IterableListView<T> extends StatelessWidget {
  final Iterable<T> iterable;
  const IterableListView({super.key, required this.iterable});

  }
}
