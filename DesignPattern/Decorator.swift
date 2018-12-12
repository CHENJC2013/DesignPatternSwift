//
//  Decorator.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2018/12/11.
//  Copyright © 2018年 CJC. All rights reserved.
//

import Foundation

//装饰模式是一种用于替代继承的技术，它通过一种无须定义子类的方式来给对象动态增加职责，使用对象之间的关联关系取代类之间的继承关系

//抽象构件
protocol Component {
    func operation()
}

//抽象装饰类
class Decorator: Component {
    private var component: Component
    init(comp: Component) {
        self.component = comp
    }
    func operation() {
        self.component.operation()
    }
}

//窗体类：具体构件类
class Window: Component {
    func operation() {
        print("显示窗体")
    }
}
//文本框类：具体构件类
class TextBox: Component {
    func operation() {
        print("显示文本框")
    }
}
//滚动条装饰类：具体装饰类
class ScrollBarDecorator: Decorator {
    override func operation() {
        addBehavior()       //调用新增业务方法
        super.operation()   //调用原有业务方法
    }
    
    func addBehavior() {
        print("为构件增加滚动条")
    }
}
//黑色边框装饰类：具体装饰类
class BlackBorderDecorator: Decorator {
    override func operation() {
        addBehavior()       //调用新增业务方法
        super.operation()   //调用原有业务方法
    }
    
    func addBehavior() {
        print("为构件增加黑色边框")
    }
}
