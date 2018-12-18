//
//  Command.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2018/12/14.
//  Copyright © 2018年 CJC. All rights reserved.
//

import Foundation

//每一个具体命令类对应一个请求的处理者（接收者），通过向请求发送者注入不同的具体命令对象可以使得相同的发送者对应不同的接收者，从而实现“将一个请求封装为一个对象，用不同的请求对客户进行参数化”，客户端只需要将具体命令对象作为参数注入请求发送者，无须直接操作请求的接收者。

//功能键类：请求发送者
class FunctionButton {
    var name: String
    var command: Command?
    init(name: String) {
        self.name = name
    }
    func onClick() {
        print("点击功能键：\(self.name)")
        command?.execute()
    }
}

//抽象命令类
class Command {
    func execute() {}
}
//帮助命令类：具体命令类
class HelpCommand: Command {
    let handler = HelpHandler() //维持对请求接收者的引用
    
    override func execute() {
        handler.display()
    }
}
//最小化命令类：具体命令类
class MinimizeCommand: Command {
    let handler = WindowHandler() //维持对请求接收者的引用
    
    override func execute() {
        handler.minimize()
        
    }
}

//窗口处理类：请求接收者
class WindowHandler {
    func minimize() {
        print("将窗口最小化至托盘！")
    }
}
//帮助文档处理类：请求接收者
//窗口处理类：请求接收者
class HelpHandler {
    func display() {
        print("显示帮助文档！")
    }
}

extension Command: Equatable {
    static func ==(comd1: Command, comd2: Command) -> Bool {
        //ObjectIdentifier 取得了对象的引用地址
        return ObjectIdentifier(comd1) == ObjectIdentifier(comd2)
    }
}

//需要将多个请求排队，当一个请求发送者发送一个请求时，将不止一个请求接收者产生响应，这些请求接收者将逐个执行业务方法，完成对请求的处理。此时，我们可以通过命令队列来实现
//命令队列
class CommandQueue {
    var commands = Array<Command>()
    
    func addCommand(comd: Command) {
        commands.append(comd)
    }
    func removeCommand(comd: Command) {
        for (index, item) in commands.enumerated() {
            if item == comd {
                commands.remove(at: index)
            }
        }
        
    }
    func execute() {
        for item in commands {
            item.execute()
        }
    }
}
