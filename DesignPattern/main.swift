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

