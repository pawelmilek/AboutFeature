//
//  AboutViewController.swift
//  AboutFeature
//
//  Created by Pawel Milek on 12/21/23.
//  Copyright © 2023 Pawel Milek. All rights reserved.
//

import UIKit
import SwiftUI

public final class AboutViewController: UIViewController {
    private var hostingViewController: UIHostingController<AboutView>!
    private let viewModel: AboutViewModel
    private let tintColor: Color
    private let accentColor: Color

    public init(
        viewModel: AboutViewModel,
        tintColor: Color,
        accentColor: Color
    ) {
        self.viewModel = viewModel
        self.tintColor = tintColor
        self.accentColor = accentColor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("Invalid way of decoding this class")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        let informationView = AboutView(
            viewModel: self.viewModel,
            tintColor: self.tintColor,
            accentColor: self.accentColor
        )
        hostingViewController = UIHostingController(rootView: informationView)
        hostingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        add(hostingViewController)
        setupAutolayoutConstraints()
        setupSheetPresentation()
    }

    private func setupSheetPresentation() {
        if let presentationController = presentationController as? UISheetPresentationController {
            presentationController.detents = [.large()]
            presentationController.prefersGrabberVisible = false
        }
        isModalInPresentation = true
    }

    private func setupAutolayoutConstraints() {
        NSLayoutConstraint.activate([
            hostingViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    deinit {
        debugPrint("File: \(#file), Function: \(#function), line: \(#line)")
    }
}

extension UIViewController {

  func add(_ child: UIViewController) {
    addChild(child)
    view.addSubview(child.view)
    child.didMove(toParent: self)
  }

  func remove() {
    guard parent != nil else {
      return
    }

    willMove(toParent: nil)
    view.removeFromSuperview()
    removeFromParent()
  }

}
