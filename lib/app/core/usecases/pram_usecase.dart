// ignore: avoid_types_as_parameter_names
abstract class ParamUseCase<Type, Params> {
  Future<Type> execute(Params params);
}
