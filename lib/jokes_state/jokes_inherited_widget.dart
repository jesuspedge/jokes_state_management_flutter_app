import 'package:flutter/material.dart';
import 'package:jokes_repository/jokes_repository.dart';

part 'jokes_inherited_state.dart';
part 'jokes_states.dart';
part 'jokes_inherited_provider.dart';

// InheritedWidget to provide state throughout the widget tree
class JokesInheritedWidget extends InheritedWidget {
  const JokesInheritedWidget({
    required this.inheritedState,
    required super.child,
    super.key,
  });

  final JokesInheritedState inheritedState;

  // Method to access the state from any descendant widget
  static JokesInheritedState of(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<JokesInheritedWidget>();
    if (widget == null) {
      throw FlutterError('JokesInheritedWidget not found in context');
    }
    return widget.inheritedState;
  }

  @override
  bool updateShouldNotify(JokesInheritedWidget oldWidget) => true;
      
}
