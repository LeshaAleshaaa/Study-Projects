//
//  ViewController.swift
//  UIAnimations
//
//  Created by Алексей Смицкий on 27.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - ViewController

final class ViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var firstLabel = UILabel()
    private lazy var secondLabel = UILabel()
    private lazy var thirdLabel = UILabel()
    private lazy var fourthLabel = UILabel()
    private lazy var selectView = UIView()
    private lazy var animator = UIDynamicAnimator()
    private var snapBehavior: UISnapBehavior?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addViews()
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        createGesture()
        createAnimatorAndBehavior()
    }
    
    // MARK: - Private methods
    
    private func layout() {
        
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstLabel.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.firstLabelTopAncor),
            firstLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.firstLabelLeadingAncor),
            firstLabel.widthAnchor.constraint(
                equalToConstant: Constants.firstLabelWidthAncor),
            firstLabel.heightAnchor.constraint(
                equalToConstant: Constants.firstLabelHeightAncor)])
        
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondLabel.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.secondLabelTopAncor),
            secondLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.secondLabelTrailingAncor),
            secondLabel.widthAnchor.constraint(
                equalToConstant: Constants.secondLabelWidthAncor),
            secondLabel.heightAnchor.constraint(
                equalToConstant: Constants.secondLabelHeightAncor)])
        
        thirdLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            thirdLabel.topAnchor.constraint(
                equalTo: firstLabel.bottomAnchor,
                constant: Constants.thirdLabelTopAncor),
            thirdLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.thirdLabelLeadingAncor),
            thirdLabel.widthAnchor.constraint(
                equalToConstant: Constants.thirdLabelWidthAncor),
            thirdLabel.heightAnchor.constraint(
                equalToConstant: Constants.thirdLabelHeightAncor)])
        
        fourthLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fourthLabel.topAnchor.constraint(
                equalTo: secondLabel.bottomAnchor,
                constant: Constants.fourthLabelTopAncor),
            fourthLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.fourthLabeTrailingAncor),
            fourthLabel.widthAnchor.constraint(
                equalToConstant: Constants.fourthLabelWidthAncor),
            fourthLabel.heightAnchor.constraint(
                equalToConstant: Constants.fourthLabelHeightAncor)])
        
        selectView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            selectView.topAnchor.constraint(
                equalTo: fourthLabel.bottomAnchor,
                constant: Constants.selectViewTopAncor),
            selectView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            selectView.widthAnchor.constraint(
                equalToConstant: Constants.selectViewWidthAncor),
            selectView.heightAnchor.constraint(
                equalToConstant: Constants.selectViewHeightAncor)])
    }
    
    private func createGesture() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(handleTap(paramTap:)))
        view.addGestureRecognizer(tap)
    }
    
    private func createAnimatorAndBehavior() {
        animator = UIDynamicAnimator(referenceView: view)
        
        let collision = UICollisionBehavior(items: [selectView])
        collision.translatesReferenceBoundsIntoBoundary = true
        
        animator.addBehavior(collision)
        
        snapBehavior = UISnapBehavior(
            item: selectView,
            snapTo: selectView.center)
        snapBehavior?.damping = Constants.snapDamping
        
        if let snap = snapBehavior {
            animator.addBehavior(snap)
        }
    }
    
    private func createGravity(item: UIDynamicItem) {
        let gravity = UIGravityBehavior(items: [item])
        animator.addBehavior(gravity)
    }
    
    private func printing(point: CGPoint) {
        
        if firstLabel.frame.contains(point) {
            alert(message: Constants.firstLabelAlert)
            createGravity(item: firstLabel)
        }
        if secondLabel.frame.contains(point) {
            alert(message: Constants.secondLabelAlert)
            createGravity(item: secondLabel)
        }
        if thirdLabel.frame.contains(point) {
            alert(message: Constants.thirdLabelAlert)
            createGravity(item: thirdLabel)
        }
        if fourthLabel.frame.contains(point) {
            alert(message: Constants.fourthLabelAlert)
            createGravity(item: fourthLabel)
        }
    }
    
    // MARK: - Selectors
    
    @objc
    private func handleTap(paramTap: UIGestureRecognizer) {
        
        let tapPoint = paramTap.location(in: view)
        if snapBehavior != nil {
            if let snap = snapBehavior {
                animator.removeBehavior(snap)
            }
        }
        
        snapBehavior = UISnapBehavior(
            item: selectView,
            snapTo: tapPoint)
        snapBehavior?.damping = Constants.snapDamping
        
        if let snap = snapBehavior {
            animator.addBehavior(snap)
            printing(point: tapPoint)
        }
    }
}

// MARK: - Setups

private extension ViewController {
    
    func setupViews() {
        setFirstLabel()
        setSecondLabel()
        setThirdLabel()
        setFourthLabel()
        setSelectView()
    }
    
    func setFirstLabel() {
        firstLabel.text = Constants.firstLabelText
        firstLabel.contentMode = .center
        firstLabel.backgroundColor = .red
        firstLabel.font = .boldSystemFont(ofSize: Constants.firstLabelFont)
    }
    
    func setSecondLabel() {
        secondLabel.text = Constants.secondLabelText
        secondLabel.contentMode = .center
        secondLabel.backgroundColor = .green
        secondLabel.font = .boldSystemFont(ofSize: Constants.secondLabelFont)
    }
    
    func setThirdLabel() {
        thirdLabel.text = Constants.thirdLabelText
        thirdLabel.contentMode = .center
        thirdLabel.backgroundColor = .brown
        thirdLabel.font = .boldSystemFont(ofSize: Constants.thirdLabelFont)
    }
    
    func setFourthLabel() {
        fourthLabel.text = Constants.fourthLabelText
        fourthLabel.contentMode = .center
        fourthLabel.backgroundColor = .purple
        fourthLabel.font = .boldSystemFont(ofSize: Constants.fourthLabelFont)
    }
    
    func setSelectView() {
        selectView.backgroundColor = .black
        selectView.isUserInteractionEnabled = true
        selectView.layer.cornerRadius = Constants.selectViewCornerRadius
    }
}

// MARK: - Setup Elements

private extension ViewController {
    
    func addViews() {
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        view.addSubview(thirdLabel)
        view.addSubview(fourthLabel)
        view.addSubview(selectView)
    }
}

// MARK: - Constants

private extension ViewController {
    
    enum Constants {
        
        static let firstLabelTopAncor: CGFloat = 50
        static let firstLabelLeadingAncor: CGFloat = 20
        static let firstLabelWidthAncor: CGFloat = 150
        static let firstLabelHeightAncor: CGFloat = 150
        static let firstLabelText: String = "1ая иконка"
        static let firstLabelFont: CGFloat = 20
        static let firstLabelAlert: String = "Это первая иконка"
        
        static let snapDamping: CGFloat = 0.7
        
        static let secondLabelTopAncor: CGFloat = 50
        static let secondLabelTrailingAncor: CGFloat = -20
        static let secondLabelWidthAncor: CGFloat = 150
        static let secondLabelHeightAncor: CGFloat = 150
        static let secondLabelText: String = "2ая иконка"
        static let secondLabelFont: CGFloat = 20
        static let secondLabelAlert: String = "Это вторая иконка"
        
        static let thirdLabelTopAncor: CGFloat = 50
        static let thirdLabelLeadingAncor: CGFloat = 20
        static let thirdLabelWidthAncor: CGFloat = 150
        static let thirdLabelHeightAncor: CGFloat = 150
        static let thirdLabelText: String = "3ая иконка"
        static let thirdLabelFont: CGFloat = 20
        static let thirdLabelAlert: String = "Это третья иконка"
        
        static let fourthLabelTopAncor: CGFloat = 50
        static let fourthLabeTrailingAncor: CGFloat = -20
        static let fourthLabelWidthAncor: CGFloat = 150
        static let fourthLabelHeightAncor: CGFloat = 150
        static let fourthLabelText: String = "4ая иконка"
        static let fourthLabelFont: CGFloat = 20
        static let fourthLabelAlert: String = "Это четвертая иконка"
        
        static let selectViewTopAncor: CGFloat = 50
        static let selectViewWidthAncor: CGFloat = 50
        static let selectViewHeightAncor: CGFloat = 50
        static let selectViewCornerRadius: CGFloat = 25
        
    }
}
