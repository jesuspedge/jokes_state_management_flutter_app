part of 'jokes_inherited_widget.dart';

// StatefulWidget wrapper to provide the InheritedWidget
class JokesInheritedStateProvider extends StatefulWidget {
  const JokesInheritedStateProvider({
    required this.child,
    required this.jokesRepository,
    super.key,
  });

  final Widget child;
  final JokesRepository jokesRepository;

  @override
  State<JokesInheritedStateProvider> createState() =>
      _JokesInheritedStateProviderState();
}

class _JokesInheritedStateProviderState
    extends State<JokesInheritedStateProvider> {
  late JokesInheritedState _inheritedState;

  @override
  void initState() {
    super.initState();
    _inheritedState =
        JokesInheritedState(jokesRepository: widget.jokesRepository);
    _inheritedState.addListener(_handleStateChange);
  }

  @override
  void dispose() {
    _inheritedState.removeListener(_handleStateChange);
    super.dispose();
  }

  void _handleStateChange() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return JokesInheritedWidget(
      inheritedState: _inheritedState,
      child: widget.child,
    );
  }
}
