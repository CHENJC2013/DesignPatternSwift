//
//  Prototype.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2018/12/11.
//  Copyright © 2018年 CJC. All rights reserved.
//

import Foundation

//抽象公文接口，也可以定义为抽象类，提供clone方法的实现，将业务方法声明为抽象方法
protocol OfficialDocument {
    var attachment: Attachment? { get set }
    func clone() -> OfficialDocument
    
    func display()
}

//附件类
/*Swift中实现对象拷贝有两种方法:
    继承自NSObject，遵守NSCopying协议，在Foundation框架内
    自定义一个Copyable协议，用一个纯Swift类去遵守这个协议
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

//可行性分析报告(Feasibility Analysis Report)类
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

//软件需求规格说明书(Software Requirements Specification)类
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
        return ht[key]!.clone()
    }
}
