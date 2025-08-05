import 'dart:io';

class Node {
  int data;
  Node? next;

  Node(this.data);
}

Node? insertNodeAtPosition(Node? head, int data, int position) {
  Node newNode = Node(data);
  if (position == 0) {
    newNode.next = head;
    return newNode;
  }
  Node? current = head;
  int index = 0;
  while (current != null && index < position - 1) {
    current = current.next;
    index++;
  }
  if (current == null) {
    throw Exception("Position out of bounds");
  }
  newNode.next = current.next;
  current.next = newNode;
  return head;
}

void printList(Node? head) {
  while (head != null) {
    stdout.write('${head.data} ');
    head = head.next;
  }
  print('');
}

void main() async {
  Node? head = Node(1);
  head.next = Node(2);
  head.next!.next = Node(3);

  head = insertNodeAtPosition(head, 4, 2); // Insert 3 at position 2
  printList(head); // Output: 1
}
