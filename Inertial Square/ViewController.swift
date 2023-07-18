//
//  ViewController.swift
//  Inertial Square
//
//  Created by Mikhail Andreev on 18.07.2023.
//

import UIKit

class ViewController: UIViewController
{
	private lazy var square = makeSquare()
	private lazy var dynamicAnimator = UIDynamicAnimator(referenceView: view)
	private lazy var snapBehavior = UISnapBehavior(item: square, snapTo: view.center)

	override func viewDidLoad()
	{
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		view.addSubview(square)
		dynamicAnimator.addBehavior(snapBehavior)
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		guard
			let touchCoordinates = touches.first?.location(in: view)
		else
		{
			return
		}
		snapBehavior.snapPoint = touchCoordinates
	}
}

private extension ViewController
{
	func makeSquare() -> UIView
	{
		let size = CGSize(width: 100, height: 100)
		let square = UIView(frame: .init(origin: view.center, size: size))
		square.layer.cornerRadius = 8
		square.backgroundColor = .systemBlue
		return square
	}
}
