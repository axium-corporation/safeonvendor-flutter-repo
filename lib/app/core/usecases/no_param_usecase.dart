// ignore: avoid_types_as_parameter_names
abstract class NoParamUseCase<Type> {
  Future<Type> execute();
}
