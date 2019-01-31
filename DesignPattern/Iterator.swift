//
//  Iterator.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2019/1/28.
//  Copyright © 2019年 CJC. All rights reserved.
//

import Foundation

//抽象聚合类:它用于存储和管理元素对象，声明一个createIterator()方法用于创建一个迭代器对象，充当抽象迭代器工厂角色。
class AbstractObjectList {
    
    private var objects: Array<Any>
    
    init(objects: Array<Any>) {
        self.objects = objects
    }
    
    func addObject(obj: Any) {
        self.objects.append(obj)
    }
    func removeObject(index: Int) {
        self.objects.remove(at: index)
    }
    func getObjects() -> Array<Any> {
        return self.objects
    }
    
    //声明创建迭代器对象的抽象工厂方法
    func abstractIterator() -> AbstractIterator {
        return abstractIterator()
    }
}
//商品数据类：具体聚合类
class ProductList: AbstractObjectList {
    override func abstractIterator() -> AbstractIterator {
        return ProductIterator(list: self)
    }
}

//抽象迭代器:它定义了访问和遍历元素的接口，声明了用于遍历数据元素的方法
protocol AbstractIterator {
    func next() //移至下一个元素
    func isLast() -> Bool //判断是否为最后一个元素
    func previous() //移至上一个元素
    func isFirst() -> Bool //判断是否为第一个元素
    func getNextItem() -> Any //获取下一个元素
    func getPreviousItem() -> Any //获取上一个元素
}

//商品迭代器：具体迭代器
class ProductIterator: AbstractIterator {
    var productList: ProductList
    var products: Array<Any>
    var cursor1, cursor2: Int
    
    init(list: ProductList) {
        self.productList = list
        self.products = list.getObjects()
        cursor1 = 0 //设置正向遍历游标的初始值
        cursor2 = self.products.count - 1 //设置逆向遍历游标的初始值
    }
    func next() {
        if cursor1 < self.products.count {
            cursor1 += 1
        }
    }
    
    func isLast() -> Bool {
        return cursor1 == products.count
    }
    
    func previous() {
        if cursor2 > -1 {
            cursor2 -= 1
        }
    }
    
    func isFirst() -> Bool {
        return cursor2 == -1
    }
    
    func getNextItem() -> Any {
        return products[cursor1]
    }
    
    func getPreviousItem() -> Any {
        return products[cursor2]
    }
    
}
