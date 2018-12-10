//
//  Singleton.swift
//  DesignMode
//
//  Created by ChenJiCai on 2018/12/10.
//  Copyright © 2018年 CJC. All rights reserved.
//

import Foundation

/*
 单例：
 1、禁止类的外部直接使用new来创建对象，所以将构造函数设为private
 2、构造函数设为private后，外部无法创建对象，所以需要添加一个静态成员变量
 3、static：程序一运行时就会分配内存，而不是等到执行到变量代码时再分配。
    static变量或方法：在外部可以使用类名来访问，不用先创建对象
 */
class Signleton: NSObject {
    
    static let ShareInstance = Signleton();
    
    override private init() {
        
    }
    
    
}
