//
//  MyToDo.swift
//  todo
//
//  Created by 胡秉诚 on 12/16/20.
//

import Foundation

class ToDoItem {
    var title: String
    var done: Bool
    
    public init(title: String) {
        self.title = title
        self.done = false
    }
}

extension ToDoItem {
    public class func getMockData() -> [ToDoItem] {
        return [
            ToDoItem(title: "Buy mile"),
            ToDoItem(title: "fill gas"),
            ToDoItem(title: "do homework"),
            ToDoItem(title: "do leetcode"),
        ]
    }
}
