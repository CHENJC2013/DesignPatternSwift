//
//  Visitor.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2019/4/9.
//  Copyright © 2019年 CJC. All rights reserved.
//

import Foundation

/***
 ●Vistor（抽象访问者）：抽象访问者为对象结构中每一个具体元素类ConcreteElement声明一个访问操作，从这个操作的名称或参数类型可以清楚知道需要访问的具体元素的类型，具体访问者需要实现这些操作方法，定义对这些元素的访问操作。
 ●ConcreteVisitor（具体访问者）：具体访问者实现了每个由抽象访问者声明的操作，每一个操作用于访问对象结构中一种类型的元素。
 ●Element（抽象元素）：抽象元素一般是抽象类或者接口，它定义一个accept()方法，该方法通常以一个抽象访问者作为参数。
 ●ConcreteElement（具体元素）：具体元素实现了accept()方法，在accept()方法中调用访问者的访问方法以便完成对一个元素的操作。
 ● ObjectStructure（对象结构）：对象结构是一个元素的集合，它用于存放元素对象，并且提供了遍历其内部元素的方法。它可以结合组合模式来实现，也可以是一个简单的集合对象，如一个List对象或一个Set对象。
 
 **/

//抽象元素类
protocol Employee {
    func accept(handler: Department)
}
//具体元素类
class FulltimeEmplyee: Employee {
    
    var name: String
    var weeklyWage: Double
    var workTime: Int
    
    init(name: String, weeklyWage: Double, workTime: Int) {
        self.name = name
        self.weeklyWage = weeklyWage
        self.workTime = workTime
    }
    
    func accept(handler: Department) {
        handler.visit(emp: self)
    }
}
class ParttimeEmployee: Employee {
    
    var name: String
    var hourWage: Double
    var workTime: Int
    
    init(name: String, hourWage: Double, workTime: Int) {
        self.name = name
        self.hourWage = hourWage
        self.workTime = workTime
    }
    
    func accept(handler: Department) {
        handler.visit(emp: self)
    }
}


//抽象访问者
protocol Department {
    func visit(emp: FulltimeEmplyee)
    func visit(emp: ParttimeEmployee)
}
//具体访问者
class FADepartment: Department {
    //实现对全职员工的访问
    func visit(emp: FulltimeEmplyee) {
        let workTime = Double(emp.workTime)
        var weekWage = emp.weeklyWage
        if workTime > 40 {
            weekWage = weekWage + (workTime - 40.0) * 100.0
        } else if workTime < 40 {
            weekWage = weekWage - (40.0 - workTime) * 80.0
            if weekWage < 0 {
                weekWage = 0
            }
        }
        print("正式员工 \(emp.name) 实际工资为：\(weekWage)")
    }
    
    //实现对兼职员工的访问
    func visit(emp: ParttimeEmployee) {
        let workTime = Double(emp.workTime)
        let hourWage = emp.hourWage
        
        print("临时工 \(emp.name) 实际工资为：\(hourWage * workTime)")
    }
}
class HRDepartment: Department {
    //实现对全职员工的访问
    func visit(emp: FulltimeEmplyee) {
        let workTime = emp.workTime
        print("正式员工 \(emp.name) 实际工作时间为：\(workTime)小时")
        if workTime > 40 {
            print("正式员工 \(emp.name) 实际加班时间为：\(workTime - 40)小时")
        } else if workTime < 40 {
            print("正式员工 \(emp.name) 请假时间为：\(40 - workTime)小时")
        }
        
    }
    
    //实现对兼职员工的访问
    func visit(emp: ParttimeEmployee) {
        let workTime = emp.workTime
        print("临时工 \(emp.name) 实际工作时间为：\(workTime)小时")
    }
}

//对象结构
class EmployeeList {
    var list: Array = Array<Employee>.init()
    
    func addEmployee(emp: Employee) {
        list.append(emp)
    }
    //遍历访问员工集合中的每一个员工对象
    func accept(handler: Department) {
        for obj in list {
            obj.accept(handler: handler)
        }
    }
}
