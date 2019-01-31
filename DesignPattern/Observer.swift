//
//  Observer.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2019/1/30.
//  Copyright © 2019年 CJC. All rights reserved.
//

import Foundation

//Observer（观察者）：观察者将对观察目标的改变做出反应，观察者一般定义为接口，该接口声明了更新数据的方法update()，因此又称为抽象观察者
protocol PropertyObserver : class {
    func willChange(propertyName: String, newPropertyValue: Any?)
    func didChange(propertyName: String, oldPropertyValue: Any?)
}

//ConcreteSubject（具体目标）：通常它包含有经常发生改变的数据，当它的状态发生改变时，向它的各个观察者发出通知；
final class TestChambers {
    
    weak var observer:PropertyObserver?
    
    private let testChamberNumberName = "testChamberNumber"
    
    var testChamberNumber: Int = 0 {
        willSet(newValue) {
            observer?.willChange(propertyName: testChamberNumberName, newPropertyValue: newValue)
        }
        didSet {
            observer?.didChange(propertyName: testChamberNumberName, oldPropertyValue: oldValue)
        }
    }
}

//ConcreteObserver（具体观察者）：通常在实现时，可以调用具体目标类的 attach() 方法将自己添加到目标类的集合中或通过 detach() 方法将自己从目标类的集合中删除。
final class Observer : PropertyObserver {
    func willChange(propertyName: String, newPropertyValue: Any?) {
        if newPropertyValue as? Int == 1 {
            print("Okay. Look. We both said a lot of things that you're going to regret.")
        }
    }
    
    func didChange(propertyName: String, oldPropertyValue: Any?) {
        if oldPropertyValue as? Int == 0 {
            print("Sorry about the mess. I've really let the place go since you killed me.")
        }
    }
}
