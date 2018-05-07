//
//  ViewController.swift
//  RxSwiftPractice
//
//  Created by GT-iOS on 2018/5/4.
//  Copyright © 2018年 GT-iOS. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    private let cellId = "HomeCell"
    private let listViewModel = DemoViewModel()
    private let disposeBag = DisposeBag()
    private lazy var tableView: UITableView = {
        let tab = UITableView(frame: self.view.bounds, style: .plain)
        tab.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        return tab
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "RxSwift Demo列表"
        view.addSubview(tableView)
        
        listViewModel.demoData
            .bind(to: tableView.rx.items(cellIdentifier: cellId)) {_, model, cell in
                cell.selectionStyle = .none
                cell.textLabel?.text = model.title
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(DemoModel.self).subscribe(onNext: { (demoModel) in
            guard let cls = NSClassFromString(demoModel.desController) as? UIViewController.Type else {return}
            let vc = cls.init()
            self.navigationController?.pushViewController(vc, animated: true)
        }).disposed(by: disposeBag)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}


extension Bundle {
    
    //    func nameSpace() -> String {
    //        return infoDictionary?["CFBundleName"] as? String ?? ""
    //    }
    //计算型属性,类似于函数,没有参数有返回值
    var nameSpace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
}

