//
//  SimplePushAnimator.swift
//  SimplePushAnimator
//
//  Created by Kosuke Kito on 2015/06/22.
//  Copyright (c) 2015年 Kosuke Kito. All rights reserved.
//

import UIKit

class SimplePushAnimator: NSObject {
    private let duration: TimeInterval
    private let distance: CGFloat
    
    init(duration: TimeInterval = 0.3, distance: CGFloat = 70) {
        self.duration = duration
        self.distance = distance
    }    
}

extension SimplePushAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from),
              let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else {
            return
        }
        
        containerView.insertSubview(toView, aboveSubview: fromView)
        toView.frame = CGRectOffset(toView.frame, containerView.frame.size.width, 0)
        
        let animationHandler: () -> Void = {
            fromView.frame = CGRectOffset(fromView.frame, -self.distance, 0)
            fromView.alpha = 0.7
            toView.frame = containerView.frame
        }
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.05, options: .curveEaseInOut, animations: animationHandler) { _ in
            fromView.frame = CGRectOffset(fromView.frame, self.distance, 0)
            transitionContext.completeTransition(true)
        }
    }
}


class SimplePopAnimator: NSObject {
    private let duration: TimeInterval
    private let distance: CGFloat
    
    init(duration: TimeInterval = 0.3, distance: CGFloat = 70) {
        self.duration = duration
        self.distance = distance
    }
}

extension SimplePopAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from),
              let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else {
                return
        }
        
        containerView.insertSubview(toView, belowSubview: fromView)
        toView.frame = CGRectOffset(toView.frame, -distance, 0)
        
        let animationHandler: () -> Void = {
            fromView.frame = CGRectOffset(fromView.frame, containerView.frame.size.width, 0)
            toView.frame = CGRectOffset(toView.frame, self.distance, 0)
            toView.alpha = 1.0
        }
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseInOut, animations: animationHandler) { _ in
            transitionContext.completeTransition(true)
        }
    }
}
