//
//  main.swift
//  DesignPattern
//
//  Created by ChenJiCai on 2018/12/10.
//  Copyright © 2018年 CJC. All rights reserved.
//

import Foundation

//Singleton
let sig = Signleton.ShareInstance;
let sig2 = Signleton.ShareInstance;
print("对象地址：\(sig)\n\(sig2)");

