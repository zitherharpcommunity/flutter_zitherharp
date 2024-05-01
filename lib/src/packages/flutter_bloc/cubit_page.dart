import 'package:flutter_zitherharp/flutter_zitherharp.dart';

abstract base class CubitPage<C extends BaseCubit<S>, S extends BaseState>
    extends StatelessWidget {
  const CubitPage({super.key});

  C get cubit;

  bool get listen => false;

  @override
  @nonVirtual
  Widget build(BuildContext context) {
    return CubitBuilder(
      cubit: cubit,
      listen: listen,
      builder: buildState,
      listener: listenState,
    );
  }

  Widget buildState(BuildContext context, C cubit, S state);

  void listenState(BuildContext context, C cubit, S state) {}
}
