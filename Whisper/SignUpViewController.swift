//
//  SignUpViewController.swift
//  Whisper
//
//  Created by AgouraAppClub on 10/18/22.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class SignUpViewController: UIViewController {
    let FirstName = UITextField(frame: CGRect(x: 10, y: 400, width: 360, height: 40))
    let Fake = UITextField(frame: CGRect(x: 10, y: 450, width: 360, height: 40))
    let Email = UITextField(frame: CGRect(x: 10, y: 500, width: 360, height: 40))
    let Password = UITextField(frame: CGRect(x: 10, y: 550, width: 360, height: 40))
    let button = UIButton(frame: CGRect(x: 10, y: 600 , width: 360, height: 40))
    let label = UILabel(frame: CGRect(x: 10, y: 650, width: 360, height: 40))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.7425784469, green: 0.8099777102, blue: 0.7107387185, alpha: 1)
        createtextfield(mytextfield: FirstName, placeholder: "First & last Name")
        createtextfield(mytextfield: Fake, placeholder: "Display Name")
        createtextfield(mytextfield: Email, placeholder: "Email")
        createtextfield(mytextfield: Password, placeholder: "Password")
        Createbutton()

    }
    func createtextfield (mytextfield: UITextField, placeholder: String){
            mytextfield.placeholder = placeholder
            mytextfield.backgroundColor = #colorLiteral(red: 0.7546903491, green: 0.9740068316, blue: 0.8199612498, alpha: 0.6048178706)
            mytextfield.textColor = #colorLiteral(red: 0.3632634282, green: 0.4809612036, blue: 0.3195098042, alpha: 1)
            mytextfield.layer.cornerRadius = 9.0
            mytextfield.setleftpadding(10)
            self.view.addSubview(mytextfield)
        }
    func Createbutton(){
            // This creates a button
            button.backgroundColor = #colorLiteral(red: 0.7546903491, green: 0.9740068316, blue: 0.8199612498, alpha: 0.6048178706)
            button.setTitleColor(#colorLiteral(red: 0.3632634282, green: 0.4809612036, blue: 0.3195098042, alpha: 1), for: .normal)
            button.setTitle("SignUp", for: .normal)
            button.layer.cornerRadius = 9.0
            // This adds a action to the button
            button.addTarget(self, action: #selector(ButtonAction), for: .touchUpInside)
            // This is adding the button to the screen
            self.view.addSubview(button)
        }
     func validatefields() -> String? {
         if  FirstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
             Fake.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
             Password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                Email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
             return "Please fill in all fields"
         }
            
        return nil
    }
    
        @objc func ButtonAction (sender: UIButton){
            let error = validatefields()
            if error != nil {
                print(error!)
            }else{
                let name = FirstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let Displayname = Fake.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let email = Email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let passwords = Password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                Auth.auth().createUser(withEmail: email, password: passwords) { authResult, err in
                    /*if err != nil {
                        print(error!)
                    }else{*/
                        let db = Firestore.firestore()
                    db.collection("Users").addDocument(data: ["FirstName": name ,"DisplayName": Displayname ,"Email": email ,"Password": passwords, "uid" : authResult!.user.uid]) { (error) in
                            if error != nil {
                                print("broke")
                            //}
                        }
                        //self.performSegue(withIdentifier: "homeScreen", sender: self)
                    }
                }
            }
            
        }
}

extension UITextField {
    func setleftpadding (_ amount:CGFloat){
        let paddingview = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingview
        self.leftViewMode = .always
    }
}
