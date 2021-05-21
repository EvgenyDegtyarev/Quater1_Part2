//
//  NavigationControllerAnimator.swift
//  weatherApp
//
//  Created by Юрий Султанов on 26.04.2021.
//

import UIKit


class PushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private let animateTime = 1.5
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        animateTime
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let source = transitionContext.viewController(forKey: .from),
            let destination = transitionContext.viewController(forKey: .to)
        else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        
//        source.view.frame = transitionContext.containerView.frame
        destination.view.frame = transitionContext.containerView.frame
        
        destination.view.transform = CGAffineTransform(
            translationX: source.view.bounds.width,
            y: source.view.bounds.height)
        
        UIView.animate(withDuration: animateTime) {
            destination.view.transform = .identity
        } completion: { complete in
            transitionContext.completeTransition(complete)
        }

    }
}

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private let animateTime = 1.5
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        animateTime
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let source = transitionContext.viewController(forKey: .from),
            let destination = transitionContext.viewController(forKey: .to)
        else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        
//        source.view.frame = transitionContext.containerView.frame
        destination.view.frame = transitionContext.containerView.frame
        
        destination.view.transform = CGAffineTransform(
            translationX: -source.view.bounds.width,
            y: -source.view.bounds.height)
        
        UIView.animate(withDuration: animateTime) {
            destination.view.transform = .identity
        } completion: { complete in
            transitionContext.completeTransition(complete)
        }

    }
}

