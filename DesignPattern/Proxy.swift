//
//  Proxy.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2018/12/14.
//  Copyright © 2018年 CJC. All rights reserved.
//

import Foundation

//抽象主题角色
protocol Searcher {
    func doSearch()
}
//具体查询类，充当真实主题角色
class RealSearcher: Searcher {
    func doSearch() {
        print("查询成功")
    }
}
//Proxy（代理主题角色）:它包含了对真实主题的引用，从而可以在任何时候操作真实主题对象；在代理主题角色中提供一个与真实主题角色相同的接口，以便在任何时候都可以替代真实主题；代理主题角色还可以控制对真实主题的使用，负责在需要的时候创建和删除真实主题对象，并对真实主题对象的使用加以约束。
class ProxySearcher: Searcher {
    private let searcher = RealSearcher()
    private var validator: AccessValidator?
    private var logger: Logger2?
    
    func doSearch() {
        self.validate()
        searcher.doSearch()
        self.log()
    }
    
    func validate() {
        validator = AccessValidator()
        validator?.validate()
    }
    func log(){
        logger = Logger2()
        logger?.log()
    }
}
//身份验证类，业务类
class AccessValidator {
    func validate() {
        print("验证身份")
    }
}
//日志记录类，业务类
class Logger2 {
    func log(){
        print("记录查询日志")
    }
}
