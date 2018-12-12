//
//  Builder.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2018/12/12.
//  Copyright © 2018年 CJC. All rights reserved.
//

import Foundation

/*
1、在有些情况下，为了简化系统结构，可以将Director和抽象建造者Builder进行合并，在Builder中提供逐步构建复杂产品对象的construct()方法。由于Builder类通常为抽象类，因此可以将construct()方法定义为静态(static)方法。
2、省略方式不影响系统的灵活性和可扩展性，同时还简化了系统结构，但加重了抽象建造者类的职责，如果construct()方法较为复杂，待构建产品的组成部分较多，建议还是将construct()方法单独封装在Director中，这样做更符合“单一职责原则”。
 
 */
class ActorBuilder2 {
    var actor = Actor();
    
    func buildType() {}
    func buildSex() {}
    func buildFace() {}
    
    func construct() -> Actor {
        self.buildType()
        self.buildSex()
        self.buildFace()
        return actor
    }
}

//英雄角色建造器：具体建造者
class HeroBuilder2: ActorBuilder2 {
    
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
class AngelBuilder2: ActorBuilder2 {
    
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
