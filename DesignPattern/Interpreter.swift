//
//  Interpreter.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2018/12/19.
//  Copyright © 2018年 CJC. All rights reserved.
//

import Foundation

//AbstractExpression（抽象表达式）：在抽象表达式中声明了抽象的解释操作，它是所有终结符表达式和非终结符表达式的公共父类。
protocol AbstractExpression {
    func interpret(ctx: Context)
}
//TerminalExpression（终结符表达式）：终结符表达式是抽象表达式的子类，它实现了与文法中的终结符相关联的解释操作，在句子中的每一个终结符都是该类的一个实例。通常在一个解释器模式中只有少数几个终结符表达式类，它们的实例可以通过非终结符表达式组成较为复杂的句子。
class TerminalExpression: AbstractExpression {
    func interpret(ctx: Context) {
        //终结符表达式的解释操作
    }
}
//NonterminalExpression（非终结符表达式）：非终结符表达式也是抽象表达式的子类，它实现了文法中非终结符的解释操作，由于在非终结符表达式中可以包含终结符表达式，也可以继续包含非终结符表达式，因此其解释操作一般通过递归的方式来完成。
class NonterminalExpression: AbstractExpression {
    var letf: AbstractExpression?
    var right: AbstractExpression?
    
    func interpret(ctx: Context) {
        //递归调用每一个组成部分的interpret()方法
        //在递归调用时指定组成部分的连接方式，即非终结符的功能
    }
}

// Context（环境类）：环境类又称为上下文类，它用于存储解释器之外的一些全局信息，通常它临时存储了需要解释的语句。
// 当系统无须提供全局公共信息时可以省略环境类，可根据实际情况决定是否需要环境类。
class Context {
    let dic = Dictionary<String, Any>()
    
    func assign(key: String, value: String) {
        //往环境类中设值
    }
    func lookup(key: String) -> String {
        //获取存储在环境类中的值
        return ""
    }
    
}
