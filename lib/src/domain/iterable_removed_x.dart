import 'dart:collection';

/// An extension on [Iterable] that provides a method to get the indices of the
/// elements that were removed from this iterable in order.
extension IterableRemovedX<T> on Iterable<T> {
  /// Returns the indices of the elements that were removed from this iterable
  /// in order.
  Iterable<int> removedIndices(Iterable<T> other) sync* {
    assert(other.length <= length, "The 'after' iterable can't be longer");
    assert(
      other.every(contains),
      "The 'after iterable can't contain elements "
      "that are not in this iterable",
    );

    final before = Queue<T>.from(this);
    final after = Queue<T>.from(other);

    while (before.isNotEmpty) {
      if (after.isNotEmpty && before.first == after.first) {
        before.removeFirst();
        after.removeFirst();
      } else {
        yield length - before.length;
        before.removeFirst();
      }
    }
  }

  /// Returns an iterable without the elements at the given [indices].
  Iterable<T> withRemovedIndices(Set<int> indices) sync* {
    for (var i = 0; i < length; i++) {
      if (indices.contains(i) == false) {
        yield elementAt(i);
      }
    }
  }
}
