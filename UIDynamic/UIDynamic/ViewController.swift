//
//  ViewController.swift
//  UIDynamic
//
//  Created by Алексей Смицкий on 27.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var squareView = UIView()
    var animator = UIDynamicAnimator()
    var pushBehavior = UIPushBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        createGesture()
        createSmallSquaeView()
        createAnimation()
//
//        let numberOfView = 2
//        squareViews.reserveCapacity(numberOfView)
//        let colors = [UIColor.red, UIColor.green]
//        var currentPoint: CGPoint = view.center
//        let ezchViewSizr = CGSize(width: 50, height: 50)
//
//        for counter in 0..<numberOfView {
//            let newView = UIView(frame: CGRect(x: 0, y: 0, width: ezchViewSizr.width, height: ezchViewSizr.height))
//            newView.backgroundColor = colors[counter]
//            newView.center = currentPoint
//            currentPoint.y += ezchViewSizr.height + 10
//            view.addSubview(newView)
//            squareViews.append(newView)
//        }
//        animator = UIDynamicAnimator(referenceView: view)
//
//        //тяготение
//        let gravity = UIGravityBehavior(items: squareViews)
//        animator.addBehavior(gravity)
////  столкновение
//        let collission = UICollisionBehavior(items: squareViews)
//        collission.translatesReferenceBoundsIntoBoundary = true
//
//        collission.addBoundary(withIdentifier: "bottom" as NSCopying, from: CGPoint(x: 0, y: view.bounds.size.height - 100), to: CGPoint(x: view.bounds.size.width, y: view.bounds.size.height - 100))
//        animator.addBehavior(collission)
//
//        squareView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        squareView.backgroundColor = .green
//        squareView.center = view.center
//        view.addSubview(squareView)
//        animator = UIDynamicAnimator(referenceView: view)
//        let gravity = UIGravityBehavior(items: [squareView])
//        animator.addBehavior(gravity)
//        collission.collisionDelegate = self
    }
    
    func createSmallSquaeView() {
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.backgroundColor = .green
        squareView.center = view.center
        view.addSubview(squareView)
    }
    
    func createGesture() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handle))
        view.addGestureRecognizer(tap)
        squareView.isUserInteractionEnabled = true
    }
    
    func createAnimation() {
        animator = UIDynamicAnimator(referenceView: view)
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        pushBehavior = UIPushBehavior(items: [squareView], mode: .continuous)
        animator.addBehavior(collision)
        animator.addBehavior(pushBehavior)
    }
    @objc func handle(paramTap: UITapGestureRecognizer) {
        // получаем угол view
        
        let tapPOint: CGPoint = paramTap.location(in: view)
        let square: CGPoint = squareView.center
        
        let deltaX: CGFloat = tapPOint.x - square.x
        let deltaY: CGFloat = tapPOint.y - square.y
        let angle: CGFloat = atan2(deltaY, deltaX)
        pushBehavior.angle = angle
        
        let distanse: CGFloat = sqrt(pow(tapPOint.x - square.x, 2.0) + pow(tapPOint.y - square.y, 2.0))
        pushBehavior.magnitude = distanse / 200
    }
}

extension ViewController: UICollisionBehaviorDelegate {
//
//    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
//        let identifier = identifier as? String
//        let bottom = "bottom"
//        if identifier == bottom {
//            UIView.animate(withDuration: 1.0, animations: {
//                let view = item as? UIView
//                view?.backgroundColor = .red
//                view?.alpha = 0.0
//                view?.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
//            }, completion: { (finished) in
//                let view = item as? UIView
//                behavior.removeItem(item)
//                view?.removeFromSuperview()
//            })
//        }
//    }
}
