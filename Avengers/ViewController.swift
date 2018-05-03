//
//  ViewController.swift
//  Avengers
//
//  Created by Khoa Pham on 03.05.2018.
//  Copyright © 2018 Fantageek. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

  private lazy var selectButton: UIButton = {
    let button = UIButton()
    button.setTitle("Select image", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.setTitleColor(.gray, for: .highlighted)
    return button
  }()

  private lazy var imageView: UIImageView = {
    let view = UIImageView()
    view.contentMode = .scaleAspectFill
    return view
  }()

  private lazy var resultLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.textColor = .black

    return label
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    setupControls()
  }

  private func setupControls() {
    view.addSubview(selectButton)
    view.addSubview(imageView)
    view.addSubview(resultLabel)

    selectButton.addTarget(self, action: #selector(selectedButtonTouched), for: .touchUpInside)

    NSLayoutConstraint.on(constraints: [
      imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
      imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1),
      imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
      imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

      resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      resultLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),

      selectButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      selectButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20)
    ])
  }

  @objc private func selectedButtonTouched() {
    showPicker()
  }

  private func showPicker() {
    let controller = UIImagePickerController()
    controller.delegate = self
    present(controller, animated: true, completion: nil)
  }
}

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
      return
    }

    imageView.image = image
  }
}
