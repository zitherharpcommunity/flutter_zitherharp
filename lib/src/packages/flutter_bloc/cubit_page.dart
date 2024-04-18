import 'package:flutter_zitherharp/flutter_zitherharp.dart';

abstract base class CubitPage<C extends BaseCubit<S>, S extends BaseState>
    extends StatelessWidget {
  const CubitPage({super.key});

  C get cubit;

  bool get listen => false;

  @override
  @nonVirtual
  Widget build(BuildContext context) {
    return RepositoryBuilder(
      cubit: cubit,
      listen: listen,
      builder: buildState,
    );
  }

  Widget buildState(BuildContext context, C cubit, S state);
}
