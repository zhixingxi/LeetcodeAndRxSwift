//
//  MusicListController.swift
//  RxSwiftPractice
//
//  Created by GT-iOS on 2018/5/4.
//  Copyright © 2018年 GT-iOS. All rights reserved.
//

import UIKit

class MusicListController: UIViewController {
    let musicListViewModel = MusicListViewModel()

    private lazy var tableView: UITableView = {
       let tab = UITableView(frame: self.view.bounds, style: .plain)
        tab.register(UITableViewCell.self, forCellReuseIdentifier: "musicCell")
        return tab
    }()
    
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        view.addSubview(self.tableView)
        musicListViewModel.data.bind(to: self.tableView.rx.items(cellIdentifier: "musicCell")) {_, music, cell in
            cell.selectionStyle = .none
            cell.textLabel?.text = music.name
            cell.detailTextLabel?.text = music.singer
        }.disposed(by: disposeBag)


        self.tableView.rx.modelSelected(Music.self).subscribe { (music) in
            print("你选中的歌曲信息【\(music)】")
        }.disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
