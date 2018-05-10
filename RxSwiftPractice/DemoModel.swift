//
//  DemoModel.swift
//  RxSwiftPractice
//
//  Created by GT-iOS on 2018/5/4.
//  Copyright © 2018年 GT-iOS. All rights reserved.
//

import Foundation

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
        DemoModel(title: "leetcode刷题", desController: NSStringFromClass(LeetcodeController.self)),
        DemoModel(title: "音乐列表", desController: NSStringFromClass(MusicListController.self)),
        DemoModel(title: "interval()创建Observable方法", desController: NSStringFromClass(IntervalObservableController.self)),
        DemoModel(title: "Subjects、Variables", desController: NSStringFromClass(SubjectsController.self))
        ])
}
