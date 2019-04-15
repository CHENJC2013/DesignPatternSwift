//
//  Prototype.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2018/12/11.
//  Copyright © 2018年 CJC. All rights reserved.
//

import Foundation

/*
 使用原型模式将对象复制一份并将其状态保存起来，以便在需要的时候使用（如恢复到某一历史状态），可辅助实现撤销操作。比如 周报
 */

//抽象原型类：它是声明克隆方法的接口，是所有具体原型类的公共父类，可以是抽象类也可以是接口，甚至还可以是具体实现类
protocol OfficialDocument {
    var attachment: Attachment? { get set }
    func clone() -> OfficialDocument
    
    func display()
}

//附件类
/*Swift中实现对象拷贝有两种方法:
    1、继承自NSObject，遵守NSCopying协议，在Foundation框架内
    2、自定义一个Copyable协议，用一个纯Swift类去遵守这个协议
 **** 结构体Struct默认深拷贝，建议使用结构体！！！
 */
//struct Attachment {
//    var name: String
//}
class Attachment: NSObject, NSCopying {
    var name: String
    init(name:String) {
        self.name = name
    }

    //  NSCopy深拷贝
    func copy(with zone: NSZone? = nil) -> Any {
        return Attachment(name: self.name)
    }
}

//具体原型类：它实现在抽象原型类中声明的克隆方法，在克隆方法中返回自己的一个克隆对象。
class FAR: OfficialDocument {
//    var attachment: Attachment?
    
    @NSCopying var attachment: Attachment?  //遵循NSCopying协议的属性需要用@NSCopying修饰
    
    func clone() -> OfficialDocument {
        let copy = FAR()
        copy.attachment = self.attachment
        return copy
    }
    
    func display() {
        print("可行性分析报告")
    }
    
}

//具体原型类
class SRS: OfficialDocument {
    var attachment: Attachment?
    
    func clone() -> OfficialDocument {
        let copy = SRS()
        copy.attachment = self.attachment
        return copy
    }
    
    func display() {
        print("软件需求规格说明书")
    }
}

//原型管理器（使用饿汉式单例实现）
//原型管理器(Prototype Manager)是将多个原型对象存储在一个集合中供客户端使用，它是一个专门负责克隆对象的工厂，其中定义了一个集合用于存储原型对象，如果需要某个原型对象的一个克隆，可以通过复制集合中对应的原型对象来获得。在原型管理器中针对抽象原型类进行编程，以便扩展。
class PrototypeManager {
    var ht = Dictionary<String, OfficialDocument>()
    static let instance = PrototypeManager()
    private init() {
        let far = FAR()
        far.attachment = Attachment(name: "far附件")
        ht["far"] = far
        ht["srs"] = SRS()
    }
    
    func offcialDocument(key: String) -> OfficialDocument {
        return ht[key]!.clone()   //关键在此，返回的是clone对象
//        return ht[key]!
    }
}
