//
//  Flyweight.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2018/12/14.
//  Copyright © 2018年 CJC. All rights reserved.
//

import Foundation

/*
 享元模式(Flyweight Pattern)：运用共享技术有效地支持大量细粒度对象的复用。系统只使用少量的对象，而这些对象都很相似，状态变化很小，可以实现对象的多次复用。由于享元模式要求能够共享的对象必须是细粒度对象，因此它又称为轻量级模式，它是一种对象结构型模式。

享元模式通常需要和其他模式一起联用，几种常见的联用方式如下：
(1)在享元模式的享元工厂类中通常提供一个静态的工厂方法用于返回享元对象，使用简单工厂模式来生成享元对象。
(2)在一个系统中，通常只有唯一一个享元工厂，因此可以使用单例模式进行享元工厂类的设计。
(3)享元模式可以结合组合模式形成复合享元模式，统一对多个享元对象设置外部状态。
 
 在以下情况下可以考虑使用享元模式：
 (1) 一个系统有大量相同或者相似的对象，造成内存的大量耗费。
 (2) 对象的大部分状态都可以外部化，可以将这些外部状态传入对象中。
 (3) 在使用享元模式时需要维护一个存储享元对象的享元池，而这需要耗费一定的系统资源，因此，应当在需要多次重复使用享元对象时才值得使用享元模式。
 */

//Flyweight（抽象享元类）：通常是一个接口或抽象类，在抽象享元类中声明了具体享元类公共的方法，这些方法可以向外界提供享元对象的内部数据（内部状态），同时也可以通过这些方法来设置外部数据（外部状态）。
//享元类的设计是享元模式的要点之一，在享元类中要将内部状态和外部状态分开处理，通常将内部状态作为享元类的成员变量，而外部状态通过注入的方式添加到享元类中
protocol IgoChessman {
    func getColor() -> String
}
extension IgoChessman {
    func display(coord: Coordinates) {
        print("棋子颜色：\(getColor()),棋子位置：\(coord.x),\(coord.y)")
    }
}
//ConcreteFlyweight（具体享元类）：它实现了抽象享元类，其实例称为享元对象；在具体享元类中为内部状态提供了存储空间。通常我们可以结合单例模式来设计具体享元类，为每一个具体享元类提供唯一的享元对象。
//黑色棋子类：具体享元类(内部状态)
class BlackIgoChessman: IgoChessman {
    func getColor() -> String {
        return "黑色"
    }
}
//白色棋子类：具体享元类(内部状态)
class WhiteIgoChessman: IgoChessman {
    func getColor() -> String {
        return "白色"
    }
}
//坐标类：外部状态类
//UnsharedConcreteFlyweight（非共享具体享元类）：并不是所有的抽象享元类的子类都需要被共享，不能被共享的子类可设计为非共享具体享元类；当需要一个非共享具体享元类的对象时可以直接通过实例化创建。
class Coordinates {
    let x,y: Int
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

//围棋棋子工厂类：享元工厂类，使用单例模式进行设计
//FlyweightFactory（享元工厂类）：享元工厂类用于创建并管理享元对象，它针对抽象享元类编程，将各种类型的具体享元对象存储在一个享元池中，享元池一般设计为一个存储“键值对”的集合（也可以是其他类型的集合），可以结合工厂模式进行设计；当用户请求一个具体享元对象时，享元工厂提供一个存储在享元池中已创建的实例或者创建一个新的实例（如果不存在的话），返回新创建的实例并将其存储在享元池中。
class IgoChessmanFactory {
    static let instance = IgoChessmanFactory()
    private var ht = Dictionary<String, IgoChessman>()
    
    private init() {
        var black,white: IgoChessman
        black = BlackIgoChessman()
        white = WhiteIgoChessman()
        ht["b"] = black
        ht["w"] = white
        
    }
    func getIgoChessman(key: String) -> IgoChessman {
        return ht[key]!
    }
}
