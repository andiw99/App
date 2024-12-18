List<T> getFilteredList<T>(List<T> list, List<bool> bools) {
  return List<T?>.generate(
    list.length,
    (index) => bools[index] ? list[index] : null,
  ).whereType<T>().toList();
}