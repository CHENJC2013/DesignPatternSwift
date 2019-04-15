//
//  FactoryMethod.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2018/12/12.
//  Copyright © 2018年 CJC. All rights reserved.
//

import Foundation
/*
 工厂方法模式(Factory Method Pattern)：定义一个用于创建对象的接口，让子类决定将哪一个类实例化。工厂方法模式让一个类的实例化延迟到其子类。工厂方法模式又简称为工厂模式(Factory Pattern)，又可称作虚拟构造器模式(Virtual Constructor Pattern)或多态工厂模式(Polymorphic Factory Pattern)。工厂方法模式是一种类创建型模式。
 */

//抽象产品
protocol Logger {
    func writeLog()
}

//数据库日志记录器：具体产品
class DatabaseLogger: Logger {
    func writeLog() {
        print("数据库日志记录")
    }
}
//文件日志记录器：具体产品
class FileLogger: Logger {
    func writeLog() {
        print("文件日志记录")
    }
}

//抽象工厂
protocol LoggerFactory {
    func createLogger() -> Logger
}
//数据库日志记录器工厂类：具体工厂
class DatabaseLoggerFactory: LoggerFactory {
    func createLogger() -> Logger {
        let logger = DatabaseLogger()
        return logger
    }
}
//文件日志记录器工厂类：具体工厂
class FileLoggerFactory: LoggerFactory {
    func createLogger() -> Logger {
        let logger = FileLogger()
        return logger
    }
}


