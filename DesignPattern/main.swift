//
//  main.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2018/12/10.
//  Copyright © 2018年 CJC. All rights reserved.
//

import Foundation

/*********** Singleton ***********/
let sig = Signleton.shareInstance
let sig2 = Signleton.shareInstance
print("对象地址：\(sig)\n\(sig2)")

let sig3 = LazySingleton.getInstance()
let sig4 = LazySingleton.getInstance()
print("对象地址：\(sig3)\n\(sig4)")

/*********** 职责链 Chain of Responsibility ***********/
let 主任,副董事长,董事长,董事会: Approver
主任 = Director()
副董事长 = VicePresident()
董事长 = President()
董事会 = Congress()
主任.successor = 副董事长
副董事长.successor = 董事长
董事长.successor = 董事会
let request = PurchaseRequest()
request.amount = 35000
主任.processRequest(request: request)

/*********** 职责链2 Chain of Responsibility ***********/
// Create piles of money and link them together 10 < 20 < 50 < 100.** 总额为300
let ten = MoneyPile(value: 10, quantity: 6, nextPile: nil)
let twenty = MoneyPile(value: 20, quantity: 2, nextPile: ten)
let fifty = MoneyPile(value: 50, quantity: 2, nextPile: twenty)
let hundred = MoneyPile(value: 100, quantity: 1, nextPile: fifty)

// Build ATM.
var atm = ATM(hundred: hundred, fifty: fifty, twenty: twenty, ten: ten)
atm.canWithdraw(amount: 310) // Cannot because ATM has only 300
atm.canWithdraw(amount: 100) // Can withdraw - 1x100
atm.canWithdraw(amount: 165) // Cannot withdraw because ATM doesn't has bill with value of 5
atm.canWithdraw(amount: 30)  // Can withdraw - 1x20, 2x10

/*********** 原型模式 Prototype ***********/
let pm = PrototypeManager.instance
let doc1,doc2,doc3: OfficialDocument
doc1 = pm.offcialDocument(key: "far")
doc2 = pm.offcialDocument(key: "far")

print("\( unsafeBitCast(doc1.attachment, to: Int.self)) --- \( unsafeBitCast(doc2.attachment, to: Int.self))")

/*********** 装饰器模式 Decorator ***********/
let component,componentSB,componentBB: Component
component = Window()
componentSB = ScrollBarDecorator(comp: component)
componentBB = BlackBorderDecorator(comp: componentSB)
componentBB.operation()

/*********** 建造者模式 Builder ***********/
print("/*********** 建造者模式 Builder ***********/")
var ab:ActorBuilder //针对抽象建造者编程
ab = AngelBuilder()
let ac = ActorController()
let actor = ac.construct(ab: ab) //通过指挥者创建完整的建造者对象
print("当前角色是：\(actor.face!)的\(actor.sex!)\(actor.type!)")
/*********** 建造者模式 Builder2 ***********/
print("/*********** 建造者模式 Builder2  ***********/")
var ab2:ActorBuilder2 //针对抽象建造者编程
ab2 = HeroBuilder2()
let actor2 = ab2.construct() //通过指挥者创建完整的建造者对象
print("当前角色是：\(actor2.face!)的\(actor2.sex!)\(actor2.type!)")

/*********** 简单工厂模式 Simple Factory ***********/
print("/*********** 简单工厂模式 Simple Factory ***********/")
let chart: Chart = Chart2.getChart(type: "pie")
chart.display()
/*********** 工厂方法模式 Factory Method ***********/
print("/*********** 工厂方法模式 Factory Method ***********/")
let logger = DatabaseLoggerFactory().createLogger()
logger.writeLog()
/*********** 抽象工厂模式 Abstract Factory ***********/
print("/*********** 抽象工厂模式 Abstract Factory ***********/")
let spring: SkinFactory = SpringSkinFactory()
let btn: Button = spring.createButton()
let text: TextField = spring.createTextField()
btn.display()
text.display()
/*********** 适配器模式 Adapter ***********/
print("/*********** 适配器模式 Adapter ***********/")
let target = DeathStarSuperlaserTarget(angleHorizontal: 14.0, angleVertical: 12.0)
let oldFormat = OldDeathStarSuperlaserTarget(target)
print("\(oldFormat.angleH)-----\(oldFormat.angleV)")
/*********** 桥接模式 Bridge ***********/
print("/*********** 桥接模式 Bridge ***********/")
let image = PNGImage()
let imp = WindowsImp()
image.imp = imp
image.parseFile(fileName: "美女")
/*********** 组合模式 Composite ***********/
print("/*********** 组合模式 Composite ***********/")
let folder = Folder()
let file1 = imageFile(name: "图片1"), file2 = imageFile(name: "图片2")
folder.add(file: file1)
folder.add(file: file2)
folder.killVirus()



