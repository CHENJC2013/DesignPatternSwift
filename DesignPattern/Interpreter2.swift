//
//  Interpreter2.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2019/1/2.
//  Copyright © 2019年 CJC. All rights reserved.
//

import Foundation

//抽象表达式
protocol AbstractNode {
    func interpret() -> String
}
//And解释：非终结符表达式
class AndNode: AbstractNode {
    var left: AbstractNode
    var right: AbstractNode
    
    init(left: AbstractNode, right: AbstractNode) {
        self.left = left
        self.right = right
    }
    
    func interpret() -> String {
        return "\(left.interpret())再\(right.interpret())"
    }
}
//简单句子解释：非终结符表达式
class SentenceNode: AbstractNode {
    var direction: AbstractNode
    var action: AbstractNode
    var distance: AbstractNode
    
    init(direction: AbstractNode, action: AbstractNode, distance: AbstractNode) {
        self.direction = direction
        self.action = action
        self.distance = distance
    }
    func interpret() -> String {
        return "\(direction.interpret())\(action.interpret())\(distance.interpret())"
    }
}
//方向解释：终结符表达式
class DirectionNode: AbstractNode {
    var direction: String
    
    init(direction: String) {
        self.direction = direction
    }
    func interpret() -> String {
        if direction == "up" {
            return "向上"
        } else if direction == "down" {
            return "向下"
        } else if direction == "left" {
            return "向左"
        } else if direction == "right" {
            return "向右"
        } else {
            return "无效指令"
        }
    }
}
//动作解释：终结符表达式
class ActionNode: AbstractNode {
    var action: String
    
    init(action: String) {
        self.action = action
    }
    func interpret() -> String {
        if action == "move" {
            return "移动"
        } else if action == "run" {
            return "跑动"
        } else {
            return "无效指令"
        }
    }
}
//动作解释：终结符表达式
class DistanceNode: AbstractNode {
    var distance: String
    
    init(distance: String) {
        self.distance = distance
    }
    func interpret() -> String {
        return self.distance
    }
}
//指令处理类：工具类
class InstructionHandler {
    private var instruction: String = ""
    private var node: AbstractNode?
    
    
    func handle(instruction: String) {
        var left, right, direction, action, distance: AbstractNode
        var stack = Stack<AbstractNode>()
        
        let words = instruction.split(separator: " ")
        var index = 0
        while words.count > index {
            //本实例采用栈的方式来处理指令，如果遇到“and”，则将其后的三个单词作为三个终结符表达式连成一个简单句子SentenceNode作为“and”的右表达式，而将从栈顶弹出的表达式作为“and”的左表达式，最后将新的“and”表达式压入栈中。
            let node = words[index]
            if node.lowercased() == "and" {
                left = stack.pop()!
                direction = DirectionNode.init(direction: String(words[index+1]))
                action = ActionNode.init(action: String(words[index + 2]))
                distance = DistanceNode.init(distance: String(words[index + 3]))
                right = SentenceNode.init(direction: direction, action: action, distance: distance)
                stack.push(item: AndNode.init(left: left, right: right))
                index = index + 4
                
            } else { //如果是从头开始进行解释，则将前三个单词组成一个简单句子SentenceNode并将该句子压入栈中
                direction = DirectionNode.init(direction: String(words[index]))
                action = ActionNode.init(action: String(words[index + 1]))
                distance = DistanceNode.init(distance: String(words[index + 2]))
                left = SentenceNode.init(direction: direction, action: action, distance: distance)
                stack.push(item: left)
                
                index = index + 3
            }
        }
        
        self.node = stack.pop()!
    }
    
    func output(){
        print(self.node?.interpret())
    }
}


//栈
struct Stack<Element> {
    private var items = [Element]()
    
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element? {
        return items.removeLast()
    }
    func empty() -> Bool {
        return items.isEmpty
    }
    func peek() -> Element? {
        return items.last
    }
}
