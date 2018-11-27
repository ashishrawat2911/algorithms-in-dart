import "package:algorithms_in_dart/lists/singly_linked_list.dart" show Node;

/// This circular linked list is based off of [SinglyLinkedList]
class CircularSinglyLinkedList<T> {
  /// Head of [this]
  Node<T> head;

  /// Size of [this]
  int size;

  CircularSinglyLinkedList() : size = 0;

  /// Create and prepopulate [this] from a [List]
  CircularSinglyLinkedList.fromList(List<T> list) : size = 0 {
    for (var item in list) {
      append(item);
    }
  }

  /// Converts [this] into a [List]
  List<T> get toList {
    var list = [];
    var currentNode = head;

    while (currentNode.next != head) {
      list.add(currentNode);
      currentNode = currentNode.next;
    }
    return list;
  }

  /// Checks if [this] is empty
  bool get isEmpty => this.size == 0;

  /// Adds data to the end of the list
  void append(T data) {
    var newNode = Node(data: data);

    if (isEmpty) {
      head = newNode;
      newNode.next = head;
    } else {
      var currentNode = head;
      while (currentNode.next != head) {
        currentNode = currentNode.next;
      }

      currentNode.next = newNode;
      newNode.next = head;
    }

    size++;
  }

  /// Adds data to the beginning of the list.
  void prepend(T data) {
    var newNode = Node(data: data);

    if (isEmpty) {
      head = newNode;
      newNode.next = head;
    } else {
      newNode.next = head;

      var currentNode = head;
      while (currentNode.next != head) {
        currentNode = currentNode.next;
      }

      currentNode.next = newNode;
    }

    size++;
  }

  /// Remove from the end of the list
  Node<T> pop() {
    if (isEmpty) throw "Cannot remove from an empty list";

    var currentNode = head;
    var beforeLastNode = currentNode;

    do {
      beforeLastNode = currentNode;
      currentNode = currentNode.next;
    } while (currentNode.next != head);

    beforeLastNode.next = head;

    size--;
    return currentNode;
  }

  /// Remove from the beginning of the list
  Node<T> shift() {
    if (isEmpty) throw "Cannot remove from an empty list";

    var removeMe = head;
    var currentNode = head;

    while (currentNode.next != head) {
      currentNode = currentNode.next;
    }

    head = head.next;
    currentNode.next = head;

    size--;
    return removeMe;
  }
}