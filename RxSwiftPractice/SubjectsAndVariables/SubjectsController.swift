//
//  SubjectsController.swift
//  RxSwiftPractice
//
//  Created by GT-iOS on 2018/5/7.
//  Copyright © 2018年 GT-iOS. All rights reserved.
//

import UIKit

class SubjectsController: UIViewController {
    
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        //testPublishSubject()
        //testBehaviorSubject()
        //testReplaySubject()
        testVariable()
    }
    
    
    deinit {
        print("sfsdfafaf")
    }
}

// MARK: - Variable
extension SubjectsController {
    private func testVariable() {
        let disposeBag1 = DisposeBag()
        let variable = BehaviorRelay(value: "1111")
        variable.accept("222")
        
        variable.asObservable().subscribe { (event) in
            print("第1次订阅：", event)
        }.disposed(by: disposeBag1)
        
        variable.accept("333")
        variable.asObservable().subscribe { (event) in
            print("第2次订阅：", event)
        }.disposed(by: disposeBag1)
        variable.accept("444")
    }
}

// MARK: - ReplaySubject
extension SubjectsController {
    private func testReplaySubject() {
        let subject = ReplaySubject<String>.create(bufferSize: 2)
        //连续发送3个next事件
        subject.onNext("111")
        subject.onNext("222")
        subject.onNext("333")
        //第1次订阅subject
        subject.subscribe { event in
            print("第1次订阅：", event)
        }.disposed(by: disposeBag)
        //再发送1个next事件
        subject.onNext("444")
        
        subject.subscribe { (event) in
            print("第2次订阅：", event)
        }.disposed(by: disposeBag)
        
        //让subject结束
        subject.onCompleted()
        
        //第3次订阅subject
        subject.subscribe { event in
            print("第3次订阅：", event)
        }.disposed(by: disposeBag)
    }
}

// MARK: - BehaviorSubject
extension SubjectsController {
    private func testBehaviorSubject() {
        let subject = BehaviorSubject<String>(value: "11111")
        //第一次订阅
        subject.subscribe { (event) in
            print("第1次订阅：", event)
        }.disposed(by: disposeBag)
        
        //发送next事件
        subject.onNext("222")
        //第2次订阅subject
        subject.subscribe { event in
            print("第2次订阅：", event)
        }.disposed(by: disposeBag)
        //发送error事件
        subject.onError(NSError(domain: "local", code: 0, userInfo: nil))
        //第3次订阅subject
        subject.subscribe { event in
            print("第3次订阅：", event)
        }.disposed(by: disposeBag)
    }
}

// MARK: - PublishSubject
extension SubjectsController {
    private func testPublishSubject() {
        
        let subject = PublishSubject<String>()
        subject.onNext("11111")
        
        //第一次订阅
        subject.subscribe(onNext: { (string) in
            print("第1次订阅：", string)
        }, onCompleted: {
            print("第1次订阅：onCompleted")
        }).disposed(by: disposeBag)
        subject.onNext("22222")
        
        //第二次订阅
        subject.subscribe(onNext: { (string) in
            print("第2次订阅：", string)
        }, onCompleted: {
            print("第2次订阅：onCompleted")
        }).disposed(by: disposeBag)
        subject.onNext("33333")
        
        //结束
        subject.onCompleted()
        
        subject.onNext("444")
        //结束之后再订阅会收到结束事件
        subject.subscribe(onNext: { string in
            print("第3次订阅：", string)
        }, onCompleted:{
            print("第3次订阅：onCompleted")
        }).disposed(by: disposeBag)
    }
}
