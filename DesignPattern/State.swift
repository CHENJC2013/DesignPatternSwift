//
//  State.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2019/1/31.
//  Copyright © 2019年 CJC. All rights reserved.
//

import Foundation


//银行账户：环境类，环境类又称为上下文类，它是拥有多种状态的对象。在环境类中维护一个抽象状态类State的实例
class Account {
    var state: AccountState? //维持一个对抽象状态对象的引用
    var owner: String
    var balance: Double = 0
    
    init(owner: String, initial: Double) {
        self.owner = owner
        self.state = NormalState.init(acc: self)
        print("\(self.owner)开户，初始金额为\(initial)");
        print("-------------------")
    }
    func deposit(amout: Double) {
        self.state?.deposit(amount: amout)
        print("现在余额为\(self.balance),账户状态为：\(String(describing: self.state!))")
        print("-------------------")
    }
    func withdraw(amout: Double) {
        self.state?.withdraw(amount: amout)
        print("现在余额为\(self.balance),账户状态为：\(String(describing: self.state!))")
        print("-------------------")
    }
    func computeInterest() {
        self.state?.computeInterest()
    }
}

//抽象状态类
class AccountState {
    weak var acc: Account?
    
    init(acc: Account) {
        self.acc = acc
    }
    
    func deposit(amount: Double) {
        self.acc?.balance += amount
        self.stateCheck()
    }
    func withdraw(amount: Double) {
        self.acc?.balance -= amount
        self.stateCheck()
    }
    func computeInterest() {
        print("正常状态，无须支付利息！")
    }
    //状态转换
    func stateCheck() {
        guard let account = self.acc else {
            return
        }
        if account.balance > 0.0 {
            account.state = NormalState.init(acc: account)
        } else if  account.balance > -2000.0 && account.balance <= 0.0 {
            account.state = OverdraftState.init(acc: account)
        } else if account.balance == -2000.0 {
            account.state = RestrictedState.init(acc: account)
        } else if account.balance < -2000.0 {
            print("操作受限！")
        }
        
    }
}

class NormalState: AccountState {
    
    
  
}
//透支状态：具体状态类
class OverdraftState: AccountState {
    override func computeInterest() {
        print("计算利息！")
    }
}
//受限状态：具体状态类
class RestrictedState: AccountState {
    override func withdraw(amount: Double) {
        print("帐号受限，取款失败")
    }
    override func computeInterest() {
        print("计算利息！")
    }
}






class Switch {
    static var state: State = OnState.init()
    var name: String
    
    init(name: String) {
        self.name = name
        Switch.state = OnState.init()
    }
    
    func on() {
        print("\(self.name)")
        Switch.state.on(s: self)
    }
    
    func off() {
        print("\(self.name)")
        Switch.state.off(s: self)
    }
}

protocol State {
    func on(s: Switch)
    func off(s: Switch)
}

class OnState: State {
    func on(s: Switch) {
        print("已经打开！")
    }
    
    func off(s: Switch) {
        print("关闭！")
        Switch.state = OffState.init()
    }
    
    
}

class OffState: State {
    func on(s: Switch) {
        print("打开！")
        Switch.state = OnState.init()
    }
    
    func off(s: Switch) {
        print("已经关闭！")
    }
    
}
