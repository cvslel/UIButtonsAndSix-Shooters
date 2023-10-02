//
//  ViewController.swift
//  UIButtonsAndSix-Shooters
//
//  Created by Cenker Soyak on 2.10.2023.
//

import UIKit
import SnapKit
import AVFoundation

class ViewController: UIViewController {

    var listButton = UIButton()
    var specialsButton = UIButton()
    let colourfulButton = UIButton()
    let hiddenButton = UIButton()
    let shakeButton = UIButton()
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        createUI()
        
    }
    
    func createUI(){
        
        view.backgroundColor = .white
        
        listButton.setTitle(" Click For Actions ", for: .normal)
        listButton.setTitleColor(UIColor.darkGray, for: .normal)
        listButton.layer.borderColor = UIColor(named: "black")?.cgColor
        listButton.layer.borderWidth = 1.5
        listButton.layer.cornerRadius = 5
        listButton.backgroundColor = .white
        listButton.addTarget(self, action: #selector(showDropdownActions), for: .touchUpInside)
        view.addSubview(listButton)
        listButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(110)
            make.left.equalTo(view.snp.left).offset(110)
            make.right.equalTo(view.snp.right).offset(-115)
            make.height.equalTo(90)
        }
        
        specialsButton.setImage(UIImage(named: "specials"), for: .normal)
        specialsButton.layer.borderColor = UIColor(named: "blue")?.cgColor
        specialsButton.layer.cornerRadius = 10
        specialsButton.layer.borderWidth = 2
        view.addSubview(specialsButton)
        specialsButton.addTarget(self, action: #selector(showDropdownSpecials), for: .touchUpInside)
        specialsButton.snp.makeConstraints { make in
            make.top.equalTo(listButton.snp.bottom).offset(30)
            make.left.equalTo(view.snp.left).offset(110)
            make.right.equalTo(view.snp.right).offset(-115)
            make.height.equalTo(90)
        }
        
        colourfulButton.setTitle("Change It!", for: .normal)
        colourfulButton.setTitleColor(.white, for: .normal)
        colourfulButton.backgroundColor = .purple
        colourfulButton.layer.cornerRadius = 10
        colourfulButton.layer.borderWidth = 2
        colourfulButton.addTarget(self, action: #selector(changeColor), for: UIControl.Event.touchUpInside)
        colourfulButton.addTarget(self, action: #selector(changeBack), for: UIControl.Event.touchDown)
        view.addSubview(colourfulButton)
        colourfulButton.snp.makeConstraints { make in
            make.top.equalTo(specialsButton.snp.bottom).offset(30)
            make.left.equalTo(view.snp.left).offset(110)
            make.right.equalTo(view.snp.right).offset(-115)
            make.height.equalTo(90)
        }
        
        hiddenButton.setTitle("Hi There :)", for: .normal)
        hiddenButton.setTitleColor(.blue, for: .normal)
        hiddenButton.backgroundColor = .white
        hiddenButton.layer.cornerRadius = 5
        hiddenButton.layer.borderWidth = 3
        hiddenButton.isEnabled = false
        hiddenButton.addTarget(self, action: #selector(enabledTrueFalse), for: .touchUpInside)
        view.addSubview(hiddenButton)
        hiddenButton.snp.makeConstraints { make in
            make.top.equalTo(colourfulButton.snp.bottom).offset(30)
            make.left.equalTo(view.snp.left).offset(110)
            make.right.equalTo(view.snp.right).offset(-115)
            make.height.equalTo(90)
        }
        
        shakeButton.setTitle("Shake it", for: .normal)
        shakeButton.backgroundColor = .black
        shakeButton.layer.cornerRadius = 5
        shakeButton.layer.borderWidth = 3
        view.addSubview(shakeButton)
        shakeButton.snp.makeConstraints { make in
            make.top.equalTo(hiddenButton.snp.bottom).offset(30)
            make.left.equalTo(view.snp.left).offset(110)
            make.right.equalTo(view.snp.right).offset(-115)
            make.height.equalTo(90)
        }
        shakeButton.addTarget(self, action: #selector(shakeButtonTapped), for: UIControl.Event.touchUpInside)
    }
    @objc func showDropdownActions() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
        let callBackupAction = UIAlertAction(title: "Call for Backup", style: .default) { (_) in
                self.callForBackup()
        }
        alert.addAction(callBackupAction)
        
        let issueWarningAction = UIAlertAction(title: "Issue a Warning", style: .default) { (_) in
            self.issueWarning()
        }
        alert.addAction(issueWarningAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc func showDropdownSpecials() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let kebab = UIAlertAction(title: "Kebab", style: .default) { (_) in
            self.food()
        }
        alert.addAction(kebab)
        
        let macncheese = UIAlertAction(title: "Mac&Cheese", style: .default) { (_) in
            self.food()
        }
        alert.addAction(macncheese)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @objc func changeColor() {
        colourfulButton.backgroundColor = .purple
    }
    
    @objc func changeBack() {
        colourfulButton.backgroundColor = .yellow
        colourfulButton.setTitleColor(UIColor.black, for: .normal)
    }
    
    @objc func enabledTrueFalse(){
        if hiddenButton.isEnabled == false {
            hiddenButton.isEnabled = true
        } else {
            hiddenButton.isEnabled = false
        }
    }
    
    @objc func shakeButtonTapped(){
        shakeView(shakeButton)
    }
    func callForBackup(){
        print("Calling for backup!")
    }
    
    func issueWarning(){
        print("Issuing a warning to the people!")
    }
    
    func food(){
        print("Your order has been taken.")
    }
    
    func shakeView(_ sender: UIButton){
        let animation = CABasicAnimation(keyPath: "position")
               animation.duration = 0.1
               animation.repeatCount = 5
               animation.autoreverses = true
               animation.fromValue = NSValue(cgPoint: CGPoint(x: sender.center.x - 10, y: sender.center.y))
               animation.toValue = NSValue(cgPoint: CGPoint(x: sender.center.x + 10, y: sender.center.y))
               sender.layer.add(animation, forKey: "position")
    }
}
