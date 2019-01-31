//
//  Memento.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2019/1/30.
//  Copyright © 2019年 CJC. All rights reserved.
//

import Foundation
//备忘录模式

//象棋棋子类：原发器，它是一个普通类，可以创建一个备忘录，并存储它的当前内部状态，也可以使用备忘录来恢复其内部状态，一般将需要保存内部状态的类设计为原发器。
class Chessman {
    var x,y: Int
    var label: String
    
    init(label: String, x: Int, y: Int) {
        self.label = label
        self.x = x
        self.y = y
    }
    
    func display() {
        print("棋子\(self.label)当前位置为：第\(self.x)行第\(self.y)列")
    }
    
    //保存状态
    func save() -> ChessmanMemento {
        return ChessmanMemento.init(label: self.label, x: self.x, y: self.y)
    }
    //恢复状态
    func restore(memento: ChessmanMemento) {
        self.label = memento.label
        self.x = memento.x
        self.y = memento.y
    }
}

//象棋棋子备忘录类：备忘录，除了原发器本身与负责人类之外，备忘录对象不能直接供其他类使用
class ChessmanMemento {
    let x,y: Int
    let label: String
    init(label: String, x: Int, y: Int) {
        self.label = label
        self.x = x
        self.y = y
    }
}
//象棋棋子备忘录管理类：负责人
class MementoCaretaker {
    var mementoList = Array<ChessmanMemento>()
    
    func getMemento(i: Int) -> ChessmanMemento {
        return self.mementoList[i]
    }
    func setMemento(memento: ChessmanMemento) {
        self.mementoList.append(memento)
    }
}

class Util {
    var caretaker: MementoCaretaker
    var chess: Chessman
    var index = -1 //定义一个索引来记录当前状态所在位置
    init(care: MementoCaretaker, chess: Chessman) {
        self.caretaker = care
        self.chess = chess
    }
    func play() {
        caretaker.setMemento(memento: chess.save())
        index += 1
        chess.display()
    }
    //悔棋
    func undo() {
        print("******悔棋******")
        index -= 1
        if index < 0 {
            index = -1
            return
        } else {
            chess.restore(memento: caretaker.getMemento(i: index))
        }
        chess.display()
    }
    //撤销悔棋
    func redo() {
        print("******撤销悔棋******")
        index += 1
        chess.restore(memento: caretaker.getMemento(i: index))
        chess.display()
    }
}
