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

print("/*********** 原型模式 Prototype ***********/")
let pm = PrototypeManager.instance
let doc1,doc2,doc3, doc4: OfficialDocument
doc1 = pm.offcialDocument(key: "far")
doc2 = pm.offcialDocument(key: "far")
doc3 = pm.offcialDocument(key: "srs")
doc4 = pm.offcialDocument(key: "srs")

print("\( unsafeBitCast(doc1.attachment, to: Int.self)) --- \( unsafeBitCast(doc2.attachment, to: Int.self))")
print("\( unsafeBitCast(doc3.attachment, to: Int.self)) --- \( unsafeBitCast(doc4.attachment, to: Int.self))")

print("/*********** 装饰器模式 Decorator ***********/")
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
let folder2 = Folder()
folder2.add(file: imageFile.init(name: "文件1"))
folder2.add(file: imageFile.init(name: "文件2"))
folder2.name = "文件夹2"
folder.add(file: folder2)

folder.killVirus()
/*********** 外观模式 Facade ***********/
print("/*********** 外观模式 Facade ***********/")
let facade = EncryptFacade()
facade.fileEncrypt()
/*********** 享元模式 Flyweight ***********/
print("/*********** 享元模式 Flyweight ***********/")
let black1,black2,white1,white2: IgoChessman
let factory = IgoChessmanFactory.instance
black1 = factory.getIgoChessman(key: "b")
black2 = factory.getIgoChessman(key: "b")
white1 = factory.getIgoChessman(key: "w")
white2 = factory.getIgoChessman(key: "w")
black1.display(coord: Coordinates(x: 2, y: 5))
white1.display(coord: Coordinates(x: 22, y: 52))
/*********** 代理模式 Proxy ***********/
print("/*********** 代理模式 Proxy ***********/")
let searcher: Searcher = ProxySearcher()
searcher.doSearch()
/*********** 命令模式 Command ***********/
print("/*********** 命令模式 Command ***********/")
let fb1 = FunctionButton(name: "功能键1")
let fb2 = FunctionButton(name: "功能键2")
fb1.command = MinimizeCommand()
fb2.command = HelpCommand()
fb1.onClick()
fb2.onClick()
print("/*********** 命令模式2 Command2 ***********/")
let calc = CalculatorForm()
calc.command = ConcreteCommand()
calc.compute(value: 10)
calc.compute(value: 5)
calc.undo()
calc.undo()
print("/*********** 解释器模式2 Interpreter2 ***********/")
let handler = InstructionHandler.init()
handler.handle(instruction: "up move 5 and down run 10 and left move 5")
handler.output()
print("/*********** 迭代器模式 iTerator ***********/")
let products = ["倚天剑","屠龙刀","断肠草","葵花宝典","四十二章经"]
let list = ProductList.init(objects: products)
let iterator = list.abstractIterator()
while !iterator.isLast() {
    print(iterator.getNextItem())
    iterator.next()
}

list.removeObject(index: 2)

while !iterator.isFirst() {
    print(iterator.getPreviousItem())
    iterator.previous()
}
print("/*********** 中介者模式 Mediator ***********/")
let mediator = ConcreteMediator.init()
let comboboxM = ComboBoxM.init(m: mediator)
let textM = TextBoxM.init(m: mediator)

comboboxM.change()
print("/*********** 备忘录模式 Memento ***********/")
let chess = Chessman.init(label: "车", x: 1, y: 1)
let mc = MementoCaretaker.init()
let util = Util.init(care: mc, chess: chess)
util.play()

chess.y = 4
util.play()
util.play()
chess.x = 5
util.play()
util.undo()
util.undo()
util.redo()
util.redo()
print("/*********** 观察者模式 Observer ***********/")
var observerInstance = Observer()
var testChambers = TestChambers()
testChambers.observer = observerInstance
testChambers.testChamberNumber += 1
print("/*********** 状态模式 State ***********/")
let acc = Account.init(owner: "段誉", initial: 0.0)
let state = NormalState.init(acc: acc)
acc.state = state
acc.deposit(amout: 1000)
acc.withdraw(amout: 2000)
acc.deposit(amout: 3000)
acc.withdraw(amout: 4000)
acc.withdraw(amout: 1000)
acc.computeInterest()

let s1 = Switch.init(name: "开关1")
let s2 = Switch.init(name: "开关2")
s1.on()
s2.on()
s1.off();
s2.off();
s2.on();
s1.on();

print("/*********** 访问者模式 Visitor ***********/")
var employeeList = EmployeeList.init()
var fte1, fte2, fte3, pte1, pte2: Employee
fte1 = FulltimeEmplyee.init(name: "张无忌", weeklyWage: 3200, workTime: 45)
fte2 = FulltimeEmplyee.init(name: "杨过", weeklyWage: 2000, workTime: 40)
fte3 = FulltimeEmplyee.init(name: "段誉", weeklyWage: 2800, workTime: 38)
pte1 = ParttimeEmployee.init(name: "洪七公", hourWage: 80, workTime: 20)
pte2 = ParttimeEmployee.init(name: "郭靖", hourWage: 60, workTime: 18)
employeeList.addEmployee(emp: fte1)
employeeList.addEmployee(emp: fte2)
employeeList.addEmployee(emp: fte3)
employeeList.addEmployee(emp: pte1)
employeeList.addEmployee(emp: pte2)

var dep = FADepartment.init()
employeeList.accept(handler: dep)
print("---------")
var dep2 = HRDepartment.init()
employeeList.accept(handler: dep2)


