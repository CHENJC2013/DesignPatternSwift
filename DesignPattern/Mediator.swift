//
//  Mediator.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2019/1/30.
//  Copyright © 2019年 CJC. All rights reserved.
//

import Foundation

//抽象中介者
protocol Mediator {
    func componentChanged(c: ComponentM)
}
//具体中介者
class ConcreteMediator: Mediator {
    func componentChanged(c: ComponentM) {
        if c is ComboBoxM {
            print("--从组合框选择客户--")
            let item = c as! ComboBoxM
            item.select()
        } else if c is TextBoxM {
            print("--从文本框选择客户--")
            let item = c as! TextBoxM
            item.select()
        }
    }
}


//抽象组件类：它定义各个同事类公有的方法，并声明了一些抽象方法来供子类实现，同时它维持了一个对抽象中介者类的引用，其子类可以通过该引用来与中介者通信。
class ComponentM {
    var mediator: Mediator
    
    init(m: Mediator) {
        self.mediator = m
    }
    //转发调用
    func change() {
        mediator.componentChanged(c: self)
    }
    
    func update() {
        
    }
}
//组合框类：具体同事类
class ComboBoxM: ComponentM {
    override func update() {
        print("组合框增加一项：张无忌。")
    }
    func select() {
        print("组合框选中项：小龙女。")
    }
}
//文本框类：具体同事类
class TextBoxM: ComponentM {
    override func update() {
        print("客户信息增加成功后文本框清空。")
    }
    func select() {
        print("文本框显示：小龙女。")
    }
}
