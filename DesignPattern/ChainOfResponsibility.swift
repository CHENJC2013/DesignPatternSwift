//
//  ChainOfResponsibility.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2018/12/10.
//  Copyright © 2018年 CJC. All rights reserved.
//

import Foundation

//采购单：请求类
class PurchaseRequest {
    var amount: Double?
    
    init() {
        
    }
}

//审批者类：抽象处理者
class Approver {
    var successor: Approver? //定义后继者
    
    //抽象请求处理方法
    func processRequest(request: PurchaseRequest){
        
    }
}

//主任类：具体处理类
class Director: Approver {
    override func processRequest(request: PurchaseRequest) {
        if request.amount! < 5000 {
            print("主任审批采购单：\(request.amount)元")
        } else {
            self.successor?.processRequest(request: request);
        }
    }
}

//副董事长类：具体处理类
class VicePresident: Approver {
    override func processRequest(request: PurchaseRequest) {
        if request.amount! < 10000 {
            print("副董事长审批采购单：\(request.amount)元")
        } else {
            self.successor?.processRequest(request: request);
        }
    }
}

//董事长类：具体处理类
class President: Approver {
    override func processRequest(request: PurchaseRequest) {
        if request.amount! < 50000 {
            print("董事长审批采购单：\(request.amount)元")
        } else {
            self.successor?.processRequest(request: request);
        }
    }
}

//董事会类：具体处理类
class Congress: Approver {
    override func processRequest(request: PurchaseRequest) {
        print("董事会审批采购单：\(request.amount)元")
    }
}
