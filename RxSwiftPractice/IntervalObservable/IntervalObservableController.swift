//
//  IntervalObservableController.swift
//  RxSwiftPractice
//
//  Created by GT-iOS on 2018/5/4.
//  Copyright © 2018年 GT-iOS. All rights reserved.
//

import UIKit

class IntervalObservableController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purple
        /*
        let observer: AnyObserver<String> = AnyObserver {[weak self] (event) in
            switch event {
            case .next(let text):
                self?.myLabel.text = text
            default:
                break
            }
        }
        */
        /*
        let observer: Binder<String> = Binder(myLabel) { (label, text) in
            label.text = text
        }
        */
        let observable = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
        
//        observable.map {"新版当前索引数：\($0)"}.bind(to: observer).disposed(by: disposeBag)

        observable.map {Int($0)}.bind(to: myLabel.rx.randomColor).disposed(by: disposeBag)
        observable.map({"新版当前索引数：\($0)"}).bind(to: myLabel.rx.text).disposed(by: disposeBag)
    }
    
    deinit {
        print("12345678")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
/*
extension UILabel {
    var randomColor: Binder<Int> {
        return Binder(self, binding: { (label, index) in
            label.textColor = UIColor.init(red: CGFloat(Double(arc4random_uniform(255)) / 255.0), green: CGFloat(Double(arc4random_uniform(255)) / 255.0), blue: CGFloat(Double(arc4random_uniform(255)) / 255.0), alpha: 1.0)
        })
    }
}
*/
extension Reactive where Base: UILabel {
    public var randomColor: Binder<Int> {
        return Binder(self.base, binding: { (label, index) in
            label.textColor = UIColor.init(red: CGFloat(Double(arc4random_uniform(255)) / 255.0), green: CGFloat(Double(arc4random_uniform(255)) / 255.0), blue: CGFloat(Double(arc4random_uniform(255)) / 255.0), alpha: 1.0)
        })
    }
}
