//
//  UIImagePickerController+Rx.swift
//  Education
//
//  Created by 杨宁宁 on 2017/7/12.
//  Copyright © 2017年 ynn. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


func dismissViewController(_ viewController:UIViewController,animated : Bool)  {
    if  viewController.isBeingDismissed || viewController.isBeingPresented {
        DispatchQueue.main.async {
            dismissViewController(viewController, animated: true)
        }
        return
    }
    if viewController.presentingViewController != nil {
        viewController.dismiss(animated: animated, completion: nil)
    }
}

fileprivate func castOrThrow<T>(_ resultType: T.Type, _ object: Any) throws -> T {
    guard let returnValue = object as? T else {
        throw RxCocoaError.castingError(object: object, targetType: resultType)
    }

    return returnValue
}

extension Reactive where Base:UIImagePickerController{

    public var didFinishPickingMediaWithInfo: Observable<[String : AnyObject]>{
        return delegate
            //methodInvoked ：Rx-回调无返回值的代理方法

            .methodInvoked(#selector(UIImagePickerControllerDelegate.imagePickerController(_:didFinishPickingMediaWithInfo:)))
            .map({ (a) in
                return try castOrThrow(Dictionary<String,AnyObject>.self, a[1])
            })
    }


    public var didCancel: Observable<()> {
        return delegate
            .methodInvoked(#selector(UIImagePickerControllerDelegate.imagePickerControllerDidCancel(_:)))
            .map{_ in ()}
    }

    static func creatWithParent(_ parent: UIViewController?,animated : Bool = true, configureImagePicker: @escaping(UIImagePickerController) throws ->() = {x in}) -> Observable<UIImagePickerController>{
        return Observable.create{ [weak parent] observer in
            let imagePicker = UIImagePickerController()
            let dismissDisposeable = imagePicker.rx
            .didCancel
            .subscribe(onNext:{ [weak imagePicker] in
                    guard let imagePicker = imagePicker else{
                    return
                }
                    dismissViewController(imagePicker, animated: true)
                })
            do{
                try configureImagePicker(imagePicker)
            }
            catch let error {
                observer.on(.error(error))
                return Disposables.create()
            }
            guard let parent = parent else {
                observer.on(.completed)
                return Disposables.create()
            }

            parent.present(imagePicker,animated: animated,completion: nil)
            observer.on(.next(imagePicker))
            return Disposables.create(dismissDisposeable,Disposables.create {
                dismissViewController(imagePicker, animated: animated)
            })
        }
    }
}


