//
//  AbstractFactory.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2018/12/12.
//  Copyright © 2018年 CJC. All rights reserved.
//

import Foundation
/*
 工厂方法模式通过引入工厂等级结构，解决了简单工厂模式中工厂类职责太重的问题，但由于工厂方法模式中的每个工厂只生产一类产品，可能会导致系统中存在大量的工厂类，势必会增加系统的开销。此时，我们可以考虑将一些相关的产品组成一个“产品族”，由同一个工厂来统一生产,这就是抽象工厂
 
 在抽象工厂模式中，增加新的产品族很方便，但是增加新的产品等级结构很麻烦，抽象工厂模式的这种性质称为“开闭原则”的倾斜性。“开闭原则”要求系统对扩展开放，对修改封闭，通过扩展达到增强其功能的目的，对于涉及到多个产品族与多个产品等级结构的系统，其功能增强包括两方面：
 (1) 增加产品族：对于增加新的产品族，抽象工厂模式很好地支持了“开闭原则”，只需要增加具体产品并对应增加一个新的具体工厂，对已有代码无须做任何修改。
 (2) 增加新的产品等级结构：对于增加新的产品等级结构，需要修改所有的工厂角色，包括抽象工厂类，在所有的工厂类中都需要增加生产新产品的方法，违背了“开闭原则”。
 正因为抽象工厂模式存在“开闭原则”的倾斜性，它以一种倾斜的方式来满足“开闭原则”，为增加新产品族提供方便，但不能为增加新产品结构提供这样的方便，因此要求设计人员在设计之初就能够全面考虑，不会在设计完成之后向系统中增加新的产品等级结构，也不会删除已有的产品等级结构，否则将会导致系统出现较大的修改，为后续维护工作带来诸多麻烦。
 */

//按钮接口：抽象产品
protocol Button {
    func display()
}
//Spring按钮类：具体产品
class SpringButton: Button {
    func display() {
        print("显示浅绿色按钮")
    }
}
//Summer按钮类：具体产品
class SummerButton: Button {
    func display() {
        print("显示浅蓝色按钮")
    }
}
//文本框接口：抽象产品
protocol TextField {
    func display()
}
//Spring文本框类：具体产品
class SpringTextField: TextField {
    func display() {
        print("显示绿色边框文本框")
    }
}
//Summer文本框类：具体产品
class SummerTextField: TextField {
    func display() {
        print("显示蓝色边框文本框")
    }
}

//界面皮肤工厂接口：抽象工厂
protocol SkinFactory {
    func createButton() -> Button
    func createTextField() -> TextField
}
//Spring皮肤工厂：具体工厂
class SpringSkinFactory: SkinFactory {
    func createButton() -> Button {
        return SpringButton()
    }
    
    func createTextField() -> TextField {
        return SpringTextField()
    }
}
//Summer皮肤工厂：具体工厂
class SummerSkinFactory: SkinFactory {
    func createButton() -> Button {
        return SummerButton()
    }
    
    func createTextField() -> TextField {
        return SummerTextField()
    }
}
