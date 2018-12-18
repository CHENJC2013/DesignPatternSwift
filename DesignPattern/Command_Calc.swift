//
//  Command_Calc.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2018/12/18.
//  Copyright © 2018年 CJC. All rights reserved.
//

import Foundation

//请求接收者
class Adder {
    var num = 0
    
    func add(value: Int) -> Int {
        num += value
        return num
    }
}

//抽象命令类
protocol AbstractCommand {
    func execute(value: Int) -> Int
    func undo() -> Int
}
//具体命令类
class ConcreteCommand: AbstractCommand {
    let adder = Adder()
    var value: Int = 0
    
    func execute(value: Int) -> Int {
        self.value = value
        return adder.add(value: value)
    }
    
    func undo() -> Int {
        return adder.add(value: -value)
    }
    
}

////计算器界面类：请求发送者
class CalculatorForm {
    var command: AbstractCommand?
    
    //调用命令对象的execute()方法执行运算
    func compute(value: Int) {
        print("执行运算，运算结果为：\(command?.execute(value: value))")
    }
    
    //调用命令对象的undo()方法执行撤销
    func undo() {
        print("执行撤销，运算结果为：\(command?.undo())")
    }
}
