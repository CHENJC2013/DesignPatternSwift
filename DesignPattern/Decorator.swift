//
//  Decorator.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2018/12/11.
//  Copyright © 2018年 CJC. All rights reserved.
//

import Foundation

//装饰模式是一种用于替代继承的技术，它通过一种无须定义子类的方式来给对象动态增加职责，使用对象之间的关联关系取代类之间的继承关系

//抽象构件,它是具体构件和抽象装饰类的共同父类,声明了在具体构件中实现的业务方法，它的引入可以使客户端以一致的方式处理未被装饰的对象以及装饰之后的对象，实现客户端的透明操作。
protocol Component {
    func operation()
}

//抽象装饰类:它也是抽象构件类的子类，用于给具体构件增加职责，但是具体职责在其子类中实现。它维护一个指向抽象构件对象的引用，通过该引用可以调用装饰之前构件对象的方法，并通过其子类扩展该方法，以达到装饰的目的。
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
