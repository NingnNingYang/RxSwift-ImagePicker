//
//  ViewController.swift
//  Education
//
//  Created by 杨宁宁 on 2017/7/11.
//  Copyright © 2017年 ynn. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

let kDevicesW = UIScreen.main.bounds.width
let kDevicesH = UIScreen.main.bounds.height


class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    var imageView = UIImageView.init(frame: CGRect.init(x: 50, y: 100, width: kDevicesW - 100, height: 300))
    var actionBtn = UIButton.init(frame: CGRect.init(x: 50, y: 410, width: 150, height: 50))
    var actionBtn2:UIButton! = UIButton.init(frame: CGRect.init(x: 50, y: 480, width: 150, height: 50))

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.backgroundColor = UIColor.gray
        actionBtn.setTitle("open the album", for: UIControlState.normal)
        actionBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        actionBtn2.backgroundColor = UIColor.orange
        self.view.addSubview(imageView)
        self.view.addSubview(actionBtn)
//        self.view.addSubview(actionBtn2)

        actionBtn2.rx.tap
            .subscribe(onNext:{ [weak self] x in
                self?.debug("UIButton Tapped")
            })
            .disposed(by:disposeBag)

        actionBtn.rx.tap
            .subscribe(onNext:{ [weak self] x in
               ImageCreateController.pickerImage(.photoLibrary, showImage: (self?.imageView)!, parentController: self!, isEditing: true)
            })
            .disposed(by:disposeBag)
    }

    func debug(_ string: String) {
        print(string)
    }
}

