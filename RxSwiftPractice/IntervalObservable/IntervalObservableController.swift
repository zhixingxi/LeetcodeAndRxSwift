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
        
        let observer: Binder<String> = Binder(myLabel) { (label, text) in
            label.text = text
        }
        let observable = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
        
        observable.map {"新版当前索引数：\($0)"}.bind(to: observer).disposed(by: disposeBag)

        
//        observable.map{"当前索引数：\($0)"}
//            .bind {[weak self] (text) in
//                self?.myLabel.text = text
//        }.disposed(by: disposeBag)
    }
    
    deinit {
        print("12345678")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
