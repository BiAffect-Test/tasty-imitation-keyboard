//
//  ViewController.swift
//  TransliteratingKeyboard
//
//  Created by Alexei Baboulevitch on 6/9/14.
//  Copyright (c) 2014 Apple. All rights reserved.
//

import UIKit

class HostingAppViewController: UIViewController {
    
//    var textInput: UITextInput
//    var textInputMode: UITextInputMode
    
    let myTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .lightGray //Just so you can see it
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let myLabel: UILabel = {
        let label = UILabel()
        label.text = "Label text" //You may want to set this to something else to start with
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let myButton: UIButton = {
        let button = UIButton()
        button.setTitle("Press me", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
//    override var scheduledActivityDataSource: SBAScheduledActivityDataSource {
//        return Smart4SUREScheduledActivityManager.sharedManager
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let AlertOnce = UserDefaults.standard
//        if(!AlertOnce.bool(forKey: "oneTimeAlert")){
//
//            let alert = UIAlertController(title: "Install BiAffect keyboard", message: "Please follow the directions listed under 'Keyboard Instructions' to install the BiAffect keyboard on your iPhone.", preferredStyle: UIAlertControllerStyle.alert)
//
//            let DoNotShowAgainAction = UIAlertAction(title: "Do it now", style: UIAlertActionStyle.cancel) { (action:UIAlertAction) in
//
//                AlertOnce.set(true , forKey: "oneTimeAlert")
//                AlertOnce.synchronize()
//                self.performSegue(withIdentifier: "backToSignIn", sender: self)
//
//            }
//
//            let cancelAction = UIAlertAction(title: "Remind me later", style: UIAlertActionStyle.default) {
//                UIAlertAction in
//                alert.removeFromParentViewController()
//            }
//            alert.addAction(cancelAction)
//            alert.addAction(DoNotShowAgainAction)
//
//            self.present(alert, animated: true, completion: nil)
//
//        }
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        Smart4SUREScheduledActivityManager.sharedManager.delegate = self
//    }


//Then add them as subViews in the viewDidLoad method and set some constraints.

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareForKeyboardChangeNotification()

        view.addSubview(myTextField)
        myTextField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        myTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        NSLayoutConstraint(item: myTextField, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: myTextField, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: -100).isActive = true

        view.addSubview(myLabel)
        myLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        myLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        NSLayoutConstraint(item: myLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: myLabel, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true


        view.addSubview(myButton)
        myButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        myButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        NSLayoutConstraint(item: myButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: myButton, attribute: .top, relatedBy: .equal, toItem: myTextField, attribute: .bottom, multiplier: 1, constant: 10).isActive = true

    //This sets the function for when the button is pressed
        myButton.addTarget(self, action: #selector(HostingAppViewController.myButtonPressed), for: .touchUpInside)
    }

    //Add code here to when the button is pressed
        @objc func myButtonPressed() {

        myLabel.text = myTextField.text

    }
    
    func prepareForKeyboardChangeNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(changeInputMode), name: .UITextInputCurrentInputModeDidChange, object: nil)
    }
    
//    override var textInputMode: UITextInputMode? {
//        // Let's force a German keyboard if one exists
//
//        return super.textInputMode
//    }


    @objc
    func changeInputMode(notification: NSNotification) {
        for textInputMode in UITextInputMode.activeInputModes {
                       

          let identifier = textInputMode.perform(NSSelectorFromString("identifier"))?.takeUnretainedValue() as? String
            
            
            let searchString = "edu."
            let predicate = NSPredicate(format: "isDisplayed = YES", searchString)
            let searchDataSource = identifier?.filter { predicate.evaluate(with: $0) }
            
            print(searchDataSource)
        }
    }

                
                
//                .primaryLanguage,
//            primaryLanguage.starts(with: "es-US") {
//            print("Keyboard selected!")
//          }
//          else {
//            print("Keyboard not selected!")
//          }
//        }
//
//    }
    
//    @objc func keyBoardChanged(_ notification: NSNotification){
//      if let identifier = textField.textInputMode?.perform(NSSelectorFromString("identifier"))?.takeUnretainedValue() as? String{
//          if identifier == "YOUR APP IDENTIFIER"{
//              //Do Whatever you required :)
//          }
//      }
//   }




}
