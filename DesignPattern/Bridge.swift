//
//  Bridge.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2018/12/13.
//  Copyright © 2018年 CJC. All rights reserved.
//

import Foundation
/*
 桥接模式(Bridge Pattern)：将抽象部分与它的实现部分分离，使它们都可以独立地变化。它是一种对象结构型模式，又称为柄体(Handle and Body)模式或接口(Interface)模式。
 如果软件系统中某个类存在两个独立变化的维度，通过该模式可以将这两个维度分离出来，使两者可以独立扩展，让系统更加符合“单一职责原则”。与多层继承方案不同，它将两个独立变化的维度设计为两个独立的继承等级结构，并且在抽象层建立一个抽象关联，该关联关系类似一条连接两个独立继承结构的桥，故名桥接模式。
 */

//抽象图像类：抽象类
class Image {
    var imp: ImageImp = ImageImp()
    func parseFile(fileName: String) {}
}
//JPG格式图像：扩充抽象类
class JPGImage: Image {
    
    override func parseFile(fileName: String) {
        imp.doPaint()
        print("\(fileName)的格式为jpg")
    }
}
//PNG格式图像：扩充抽象类
class PNGImage: Image {
    override func parseFile(fileName: String) {
        imp.doPaint()
        print("\(fileName)的格式为png")
    }
}

//抽象操作系统实现类：实现类接口
class ImageImp {
    func doPaint() {}
}
//Windows操作系统实现类：具体实现类
class WindowsImp: ImageImp {
    override func doPaint() {
        print("在Windows操作系统中显示图像：")
    }
}
//Linux操作系统实现类：具体实现类
class LinuxImp: ImageImp {
    override func doPaint() {
        print("在Linux操作系统中显示图像：")
    }
}
