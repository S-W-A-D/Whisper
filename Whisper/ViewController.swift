//
//  ViewController.swift
//  Whisper
//
//  Created by AgouraAppClub on 10/18/22.
//

import UIKit

class ViewController: UIViewController {
        
        let loginbutton = UIButton(frame: CGRect(x: 10, y: 500, width: 360, height: 40))
        let signbutton = UIButton(frame: CGRect(x: 10, y: 550, width: 360, height: 40))

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = #colorLiteral(red: 0.7425784469, green: 0.8099777102, blue: 0.7107387185, alpha: 1)
            Createbutton(button: loginbutton, Text: "Log in",Action: "Login")
            Createbutton(button: signbutton, Text: "Sign up",Action: "Signup")

        }
    
    func Createbutton(button: UIButton, Text: String , Action: String){
           // This creates a button
        button.backgroundColor = #colorLiteral(red: 0.7546903491, green: 0.9740068316, blue: 0.8199612498, alpha: 0.6048178706)
        button.setTitleColor(#colorLiteral(red: 0.3632634282, green: 0.4809612036, blue: 0.3195098042, alpha: 1), for: .normal)
        button.setTitle(Text, for: .normal)
        button.layer.cornerRadius = 15.0
           // This adds a action to the button
        if (Action == "Login") {
            button.addTarget(self, action: #selector(Login), for: .touchUpInside)

        }else{
            button.addTarget(self, action: #selector(signup), for: .touchUpInside)
        }
           // This is adding the button to the screen
           self.view.addSubview(button)
       }
    
    @objc func Login (sender: UIButton){
        performSegue(withIdentifier: "login", sender: self)
    }
    @objc func signup (sender: UIButton){
        performSegue(withIdentifier: "SignUP", sender: self)
    }
}

