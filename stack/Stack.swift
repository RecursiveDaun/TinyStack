//
//  Stack.swift
//  stack
//
//  Created by Timur Kuashev on 25.10.2019.
//  2019. OpenSource, so do all what you want
//

import Foundation

public class Stack<T> {
    
    // MARK: - Properties
    private var top: Node<T>? = nil
    public private(set) var counter: Int = 0
    public var topData: T? {
        return top?.data
    }
    
    // MARK: - Public Methods
    public func push(data: T) {
        
        defer { counter += 1 }
        guard top != nil else {
            top = Node(prev: nil, data: data)
            return
        }
        
        let newTail: Node<T> = Node(prev: self.top, data: data)
        self.top?.next = newTail
        self.top = newTail
        
    }
    
    public func pop() {
        
        guard self.top != nil else {
            print("stack is empty")
            return
        }
        counter -= 1
        
        let prevTop = top?.prev
        prevTop?.next = nil
        top = nil
        self.top = prevTop
        
    }
    
}


// MARK: - Node (Element Of The Stack)
fileprivate class Node<T> {
    
    // MARK: - Properties
    fileprivate var next: Node?
    fileprivate var prev: Node?
    fileprivate var data: T?
    
    
    // MARK: - Lifecycle
    init(prev: Node<T>? = nil, data: T? = nil) {
        
        self.prev = prev
        self.next = nil
        self.data = data
        
    }
    
    deinit {
        // Print only for testing of the memory leak
        print("Deinit of the Node")
        data = nil
        self.next = nil
        self.prev = nil
        
    }
    
}
