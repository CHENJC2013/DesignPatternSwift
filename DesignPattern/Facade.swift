//
//  Facade.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2018/12/14.
//  Copyright © 2018年 CJC. All rights reserved.
//

import Foundation

/*
 在以下情况下可以考虑使用外观模式：
 (1) 当要为访问一系列复杂的子系统提供一个简单入口时可以使用外观模式。
 (2) 客户端程序与多个子系统之间存在很大的依赖性。引入外观类可以将子系统与客户端解耦，从而提高子系统的独立性和可移植性。
 (3) 在层次化结构中，可以使用外观模式定义系统中每一层的入口，层与层之间不直接产生联系，而通过外观类建立联系，降低层之间的耦合度。
 */

//文件读取类，充当子系统类
class FileReader {
    func read() {
        print("读取文件中...")
    }
}
//数据加密类，充当子系统类。
class CipherMachine {
    func encrypt() {
        print("加密中...")
    }
}
//文件保存类，充当子系统类。
class FileWriter {
    func write() {
        print("文件加密完成")
    }
}

//外观类
class EncryptFacade {
    //维持对其他对象的引用
    let reader = FileReader()
    let cipher = CipherMachine()
    let wirter = FileWriter()
    
    func fileEncrypt() {
        reader.read()
        cipher.encrypt()
        wirter.write()
    }
}
