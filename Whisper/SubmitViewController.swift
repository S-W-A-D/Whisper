//
//  SubmitViewController.swift
//  Whisper
//
//  Created by AgouraAppClub on 10/19/22.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class SubmitViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var titleView: UITextField!
    @IBOutlet weak var whisperView: UITextField!
    
    func validatefields() -> String? {
        if  (titleView.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "") ||
            (whisperView.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""){
            return "Please fill in all fields"
        }
       return nil
   }
   
    @IBAction func submitResponse(_ sender: Any) {
        let error = validatefields()
        if error != nil {
            print(error!)
        }else{
            let titleText = titleView.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let whisperText = whisperView.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                /*if err != nil {
                    print(error!)
                }else{*/
                    let db = Firestore.firestore()
                db.collection("Responses").addDocument(data: ["Title": titleText ,"Response": whisperText]) { (error) in
                        if error != nil {
                            print("broke")
                        //}
                    }
                    //self.performSegue(withIdentifier: "homeScreen", sender: self)
                }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
