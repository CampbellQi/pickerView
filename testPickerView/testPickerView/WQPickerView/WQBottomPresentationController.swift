//
//  WQBottomPresentationController.swift
//  testAlphaPre
//
//  Created by 冯万琦 on 2018/3/16.
//  Copyright © 2018年 SJKY. All rights reserved.
//

import UIKit

class WQBottomPresentationController: UIPresentationController {
    private var controllerHeight: CGFloat = 0
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        if case let vc as WQPresentBottomController = presentedViewController {
            controllerHeight = vc.controllerHeight ?? UIScreen.main.bounds.height
        }else {
            controllerHeight = UIScreen.main.bounds.height
        }
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        return CGRect.init(x: 0, y: UIScreen.main.bounds.height-controllerHeight, width: UIScreen.main.bounds.width, height: controllerHeight)
    }
    override func presentationTransitionWillBegin() {
        blackView.alpha = 0
        containerView?.addSubview(blackView)
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 1
        }
    }
    
    override func dismissalTransitionWillBegin() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
        }
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            blackView.removeFromSuperview()
        }
    }
    lazy var blackView: UIView = {
        let view = UIView()
        if let frame = self.containerView?.bounds {
            view.frame = frame
        }
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        return view
    }()
    
    
}

public class WQPresentBottomController: UIViewController {
    public var controllerHeight: CGFloat?
}

extension UIViewController: UIViewControllerTransitioningDelegate {
    public func presentBotoom(_ vc: WQPresentBottomController) {
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        self.present(vc, animated: true, completion: nil)
    }
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return WQBottomPresentationController.init(presentedViewController: presented, presenting: presenting)
    }
}
