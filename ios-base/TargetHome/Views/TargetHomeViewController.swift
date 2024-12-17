//
//  TargetHomeViewController.swift
//  ios-base
//
//  Created by Lucas Miotti on 27/07/2022.
//  Copyright © 2022 Rootstrap Inc. All rights reserved.
//

import Foundation
import UIKit

class TargetHomeViewController: UIViewController {
  
  private var viewModel: TargetHomeViewModel
  
  private var commentNavButton: UIBarButtonItem = {
    let button = UIBarButtonItem(
      image: UIImage(named: "Comment"),
      style: UIBarButtonItem.Style.done,
      target: self,
      action: #selector(tapOnButton)
    )
    button.tintColor = UIColor.black
    return button
  }()
  
  private var profileNavButton: UIBarButtonItem = {
    let button = UIBarButtonItem(
      image: UIImage(named: "User"),
      style: UIBarButtonItem.Style.done,
      target: self,
      action: #selector(tapOnButton)
    )
    button.tintColor = UIColor.black
    return button
  }()
  
  private var navBar = UINavigationBar()
    
  init(viewModel: TargetHomeViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setUpNavController()
    view.addSubviews(subviews: [
      navBar
    ])
    configureConstraints()
  }
  
  private func setUpNavController() {
    navBar.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 64)
    let navItem = UINavigationItem(title: "Target Points")
    navItem.rightBarButtonItem = commentNavButton
    navItem.leftBarButtonItem = profileNavButton
    navBar.setItems([navItem], animated: false)
  }
  
  private func configureConstraints() {
    navBar.topAnchor.constraint(
      equalTo: view.safeAreaLayoutGuide.topAnchor
    ).isActive = true
  }
  
  @objc
  func tapOnButton(_ sender: UIButton) {
    switch sender {
    case commentNavButton:
      navigationController?.pushViewController(
        ChatViewController(viewModel: ChatViewModel()),
        animated: true
      )
    case profileNavButton:
      print("User")
    default:
      return
    }
  }
}
