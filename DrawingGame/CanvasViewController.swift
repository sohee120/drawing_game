//
//  CanvasViewController.swift
//  DrawingGame
//
//  Created by 윤소희 on 2024/01/18.
//

import UIKit
import Combine
import SwiftUI

final class CanvasViewController: UIViewController {
    private let viewModel = CanvasViewModel(pathColor: .blackColor)
    private var cancellables = Set<AnyCancellable>()
    private let elementsLayer = CAShapeLayer()
    
    @IBOutlet var DrawingView: UIView!
    @IBOutlet var whiteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bind()
    }
    
    private func setupViews() {
        whiteButton.layer.borderWidth = 1.0
        whiteButton.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        DrawingView.layer.addSublayer(elementsLayer)
        DrawingView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(didPanned)))
    }
    
    private func bind() {
        func shapeLayer(for element: some Drawable) -> CAShapeLayer {
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = element.path.cgPath
            shapeLayer.fillColor = element.fillColor?.cgColor
            shapeLayer.strokeColor = element.foregroundColor?.cgColor
            shapeLayer.lineWidth = 3.0
            return shapeLayer
        }
        
        viewModel.elements
            .sink { [weak self] elements in
                self?.elementsLayer.sublayers?.forEach { $0.removeFromSuperlayer() }
                for element in elements {
                    let shapeLayer = shapeLayer(for: element)
                    self?.elementsLayer.addSublayer(shapeLayer)
                }
            }
            .store(in: &cancellables)
    }
    
    @IBAction func touchColor(_ sender: UIButton) {
        guard let color = sender.titleLabel!.text else {return}
        
        switch color {
        case "red": viewModel.pathColor = Color.redColor
        case "orange": viewModel.pathColor = Color.orangeColor
        case "yellow": viewModel.pathColor = Color.yellowColor
        case "green": viewModel.pathColor = Color.greenColor
        case "blue": viewModel.pathColor = Color.blueColor
        case "purple": viewModel.pathColor = Color.purpleColor
        case "pink": viewModel.pathColor = Color.pinkColor
        case "brown": viewModel.pathColor = Color.brownColor
        case "gray": viewModel.pathColor = Color.grayColor
        case "white": viewModel.pathColor = Color.whiteColor
            print(viewModel.pathColor)
        case "black": viewModel.pathColor = Color.blackColor
        default:
            viewModel.pathColor = Color.blackColor
        }
    }
    
    @objc
    private func didPanned(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            viewModel.didDrawBegan()
        case .changed:
            let point = sender.location(in: view)
            viewModel.didDraw(point: point)
        case .ended, .failed, .cancelled:
            break
        default:
            break
        }
    }
}
