//
//  Builder.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2018/12/12.
//  Copyright © 2018年 CJC. All rights reserved.
//

import Foundation

/*
 在以下情况下可以考虑使用建造者模式：
 (1)  需要生成的产品对象有复杂的内部结构，这些产品对象通常包含多个成员属性。
 (2)  需要生成的产品对象的属性相互依赖，需要指定其生成顺序。
 (3)  对象的创建过程独立于创建该对象的类。在建造者模式中通过引入了指挥者类，将创建过程封装在指挥者类中，而不在建造者类和客户类中。
 (4)  隔离复杂对象的创建和使用，并使得相同的创建过程可以创建不同的产品。
 */

//Actor角色类：复杂产品类，它是被构建的复杂对象，包含多个组成部件，具体建造者创建该产品的内部表示并定义它的装配过程。
class Actor {
    var type: String?
    var sex: String?
    var face: String?
    
    init() {
        
    }
    
    init(type:String, sex: String, face: String) {
        self.type = type
        self.sex = sex
        self.face = face
    }
}

//角色建造器：抽象建造者，它为创建一个产品Product对象的各个部件指定抽象接口，在该接口中一般声明两类方法，一类方法是buildPartX()，它们用于创建复杂对象的各个部件；另一类方法是getResult()，它们用于返回复杂对象。Builder既可以是抽象类，也可以是接口。
class ActorBuilder {
    var actor = Actor();
    
    func buildType() {}
    func buildSex() {}
    func buildFace() {}
    
    func createActor() -> Actor  {
        return actor
    }
}

//游戏角色创建控制器：指挥者,指挥者又称为导演类，它负责安排复杂对象的建造次序，指挥者与抽象建造者之间存在关联关系，可以在其construct()建造方法中调用建造者对象的部件构造与装配方法，完成复杂对象的建造。
//客户端一般只需要与指挥者进行交互，在客户端确定具体建造者的类型，并实例化具体建造者对象（也可以通过配置文件和反射机制），然后通过指挥者类的构造函数或者Setter方法将该对象传入指挥者类中。
class ActorController {
    //逐步构建复杂产品对象
    func construct(ab: ActorBuilder) -> Actor {
        ab.buildType()
        ab.buildSex()
        ab.buildFace()
        
        return ab.createActor()
    }
}
//英雄角色建造器：具体建造者
class HeroBuilder: ActorBuilder {
    
    override func buildType() {
        actor.type = "英雄"
    }
    
    override func buildSex() {
        actor.sex = "男"
    }
    
    override func buildFace() {
        actor.face = "英俊"
    }
}
//天使角色建造器：具体建造者
class AngelBuilder: ActorBuilder {
    
    override func buildType() {
        actor.type = "天使"
    }
    
    override func buildSex() {
        actor.sex = "女"
    }
    
    override func buildFace() {
        actor.face = "漂亮"
    }
}
