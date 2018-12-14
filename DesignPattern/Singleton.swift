//
//  Singleton.swift
//  DesignMode
//
//  Created by ChenJiCai on 2018/12/10.
//  Copyright © 2018年 CJC. All rights reserved.
//

import Foundation

//  单件模式属于工厂模式的特例，只是它不需要输入参数并且始终返回同一对象的引用。
//1、饿汉式：在程序启动或单例模式类被加载的时候，单例模式实例就已经被创建。
//2、懒汉式：当程序第一次访问单例模式实例时才进行创建。懒汉式在多线程有出问题的可能，需要用synchronized双重检查锁定
/*
 单例：
 1、禁止类的外部直接使用new来创建对象，所以将构造函数设为private
 2、构造函数设为private后，外部无法创建对象，所以需要添加一个静态成员变量
 3、static：程序一运行时就会分配内存，而不是等到执行到变量代码时再分配。
    static变量或方法：在外部可以使用类名来访问，不用先创建对象
 */
class Signleton {  //饿汉式
    
    static let shareInstance = Signleton()
    
    private init() {
        //Private保证有只有一个实例可以创建
    }
    
}

class LazySingleton { //懒汉式
    private static var shareInstance: LazySingleton?
    
    private init() {
        
    }
    
    static func getInstance() -> LazySingleton {
        if shareInstance == nil {
            shareInstance = LazySingleton()
        }
        return shareInstance!
    }
    
}
