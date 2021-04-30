import Foundation

public class Node<Value> {
  public var value: Value
  public var next: Node?
  public init(value: Value, next: Node? = nil) {
    self.value = value
    self.next = next
} }
extension Node: CustomStringConvertible {
  public var description: String {
    guard let next = next else {
      return "\(value)"
    }
    return "\(value) -> " + String(describing: next) + " "
  }
}

public struct LinkedList<Value> {
  public var head: Node<Value>?
  public var tail: Node<Value>?
  public init() {}
    
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
      tail = head }
    }

    public mutating func append(_ value: Value) {
    // 1
      guard !isEmpty else {
        push(value)
        return
      }
      // 2
        tail!.next = Node(value: value)
      // 3
        tail = tail!.next
      }
    
    public func node(at index: Int) -> Node<Value>? {
      // 1
      var currentNode = head
      var currentIndex = 0
    // 2
      while currentNode != nil && currentIndex < index {
        currentNode = currentNode!.next
        currentIndex += 1
    }
      return currentNode
    }
    
    @discardableResult
    public mutating func insert(_ value: Value, after node: Node<Value>)
    ->Node<Value>{
    // 2
    guard tail !== node else {
      append(value)
      return tail!
    }
    // 3
      node.next = Node(value: value, next: node.next)
      return node.next!
    }
    
  public var isEmpty: Bool {
    return head == nil
  }
    
}
extension LinkedList: CustomStringConvertible {
  public var description: String {
    guard let head = head else {
      return "Empty list"
    }
    return String(describing: head)
  }
}


