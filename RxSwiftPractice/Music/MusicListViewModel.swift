//
//  MusicListViewModel.swift
//  RxSwiftPractice
//
//  Created by GT-iOS on 2018/5/4.
//  Copyright © 2018年 GT-iOS. All rights reserved.
//

import Foundation
import RxSwift

struct MusicListViewModel {
    let data = Observable.just([
        Music(name: "无条件", singer: "陈奕迅"),
        Music(name: "你曾是少年", singer: "S.H.E"),
        Music(name: "从前的我", singer: "陈洁仪"),
        Music(name: "在木星", singer: "朴树"),
        ])
}
