//
//  DemoModel.swift
//  RxSwiftPractice
//
//  Created by GT-iOS on 2018/5/4.
//  Copyright © 2018年 GT-iOS. All rights reserved.
//

import Foundation
import RxSwift

struct DemoModel {
    let title: String
    let desController: String
    init(title: String, desController: String) {
        self.title = title
        self.desController = desController
    }
}

extension DemoModel: CustomStringConvertible {
    var description: String {
        return "title：\(title), desVC: \(desController)"
    }
}

struct DemoViewModel {
    let demoData = Observable.just([
        DemoModel(title: "音乐列表", desController: NSStringFromClass(MusicListController.self))
        ])
}