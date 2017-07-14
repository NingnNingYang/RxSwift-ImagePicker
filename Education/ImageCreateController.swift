//
//  ImageCreateController.swift
//  Education
//
//  Created by 杨宁宁 on 2017/7/11.
//  Copyright © 2017年 ynn. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ImageCreateController: UIViewController {

    class func pickerImage(_ sourceType:UIImagePickerControllerSourceType,
                     showImage : UIImageView,
                     parentController:UIViewController,
                     isEditing : Bool) {

        UIImagePickerController.rx.creatWithParent(parentController) {
                picker in
                picker.sourceType = sourceType
                picker.allowsEditing = isEditing
                }
                .flatMap { $0.rx.didFinishPickingMediaWithInfo}
                .take(1)

            .map {
                info in
                return info[UIImagePickerControllerOriginalImage] as? UIImage
            }
            .bind(to: showImage.rx.image)
    }
}

