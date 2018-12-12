//
//  SimpleFactory.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2018/12/12.
//  Copyright © 2018年 CJC. All rights reserved.
//

import Foundation

/*
 简单工厂模式(Simple Factory Pattern)：定义一个工厂类，它可以根据参数的不同返回不同类的实例，被创建的实例通常都具有共同的父类。因为在简单工厂模式中用于创建实例的方法是静态(static)方法，因此简单工厂模式又被称为静态工厂方法(Static Factory Method)模式，它属于类创建型模式
 问题：
 当系统中需要引入新产品时，由于静态工厂方法通过所传入参数的不同来创建不同的产品，这必定要修改工厂类的源代码，将违背“开闭原则”
 适用场景
 在以下情况下可以考虑使用简单工厂模式：
 (1) 工厂类负责创建的对象比较少，由于创建的对象较少，不会造成工厂方法中的业务逻辑太过复杂。
 (2) 客户端只知道传入工厂类的参数，对于如何创建对象并不关心。
 */

//抽象图表接口：抽象产品类
protocol Chart {
    func display()
}
//柱状图类：具体产品类
class HistogramChart: Chart {
    func display() {
        print("显示柱状图")
    }
}
//饼状图类：具体产品类
class PieChart: Chart {
    func display() {
        print("显示饼状图")
    }
}
//图表工厂类：工厂类
class ChartFactory {
    //静态工厂方法
    static func getChart(type: String) -> Chart {
        var chart: Chart?
        if type == "histogram" {
            chart = HistogramChart()
        } else if type == "pie" {
            chart = PieChart()
        }
        return chart!
    }
}

//有时候，为了简化简单工厂模式，我们可以将抽象产品类和工厂类合并，将静态工厂方法移至抽象产品类中
class Chart2 {
    func display() {

    }
    
    //静态工厂方法
    static func getChart(type: String) -> Chart {
        var chart: Chart?
        if type == "histogram" {
            chart = HistogramChart()
        } else if type == "pie" {
            chart = PieChart()
        }
        return chart!
    }
}
