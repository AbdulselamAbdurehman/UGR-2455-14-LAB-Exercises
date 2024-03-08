Future<List<String>> SimulateLoading() async {
  var duration = Duration(seconds: 2);
  return await Future.delayed(duration, () => ['row1', 'row2']);
}

main() async {
  print(await SimulateLoading());
}
