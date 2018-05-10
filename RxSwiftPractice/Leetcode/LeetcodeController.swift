
//
//  LeetcodeController.swift
//  RxSwiftPractice
//
//  Created by GT-iOS on 2018/5/9.
//  Copyright © 2018年 GT-iOS. All rights reserved.
//

import UIKit

public func DLog<T>(message: T,
                    file: String = #file,
                    method: String = #function,
                    line: Int = #line,
                    time: Date = Date())
{
    #if DEBUG
    print("MQLLog: [\(time)], \((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}

class LeetcodeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        let _ = Solution.share
    }
    
    deinit {
        DLog(message: "tuichu")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
