//
//  Composite.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2018/12/13.
//  Copyright © 2018年 CJC. All rights reserved.
//

import Foundation
/*
 1.组合模式为处理树形结构提供了一种较为完美的解决方案，它描述了如何将容器和叶子进行递归组合，使得用户在使用时无须对它们进行区分，可以一致地对待容器和叶子
 2.组合模式(Composite Pattern)：组合多个对象形成树形结构以表示具有“整体—部分”关系的层次结构。组合模式对单个对象（即叶子对象）和组合对象（即容器对象）的使用具有一致性，组合模式又可以称为“整体—部分”(Part-Whole)模式，它是一种对象结构型模式。
 3.组合模式的关键是定义了一个抽象构件类，它既可以代表叶子，又可以代表容器，而客户端针对该抽象构件类进行编程，无须知道它到底表示的是叶子还是容器，可以对其进行统一处理。
 */

//Component（抽象构件）：它可以是接口或抽象类，为叶子构件和容器构件对象声明接口，在该角色中可以包含所有子类共有行为的声明和实现。在抽象构件中定义了访问及管理它的子构件的方法，如增加子构件、删除子构件、获取子构件等。
protocol AbstractFile {
    var name: String { get set }
    func add(file: AbstractFile)
    func remove(file: AbstractFile)
    func getChild(i:Int) -> AbstractFile?
    func killVirus()
}

//图像文件类：叶子构件
class imageFile: AbstractFile {
    var name: String = "叶子"
    init(name:String) {
        self.name = name
    }
    func add(file: AbstractFile) {
        print("叶子节点，不支持此方法")
    }
    
    func remove(file: AbstractFile) {
        print("叶子节点，不支持此方法")
    }
    
    func getChild(i: Int) -> AbstractFile? {
        print("叶子节点，不支持此方法")
        return nil
    }
    
    func killVirus() {
        print("对图像文件（\(name)）进行杀毒")
    }
    
}
//文件夹类：容器构件
class Folder: AbstractFile {
    var name: String = "容器"
    var fileList = Array<AbstractFile>()
    func add(file: AbstractFile) {
        fileList.append(file)
    }
    
    func remove(file: AbstractFile) {
        for (index,vFile) in fileList.enumerated() {
            if vFile.name == file.name {
                fileList.remove(at: index)
            }
        }
        
    }
    
    func getChild(i: Int) -> AbstractFile? {
        return fileList[i]
    }
    
    func killVirus() {
        print("对文件夹（\(name)）进行杀毒")
        for file in fileList {
            file.killVirus()
        }
    }
    
}
