abstract class FutureUseCase<Input, Output> {
  Future<Output> run(Input input);
}

abstract class FutureOutputUseCase<Output> {
  Future<Output> run();
}
