//
//  ViewController.swift
//  Contacts
//
//  Created by Michael G. Wallin on 10/2/17.
//  Copyright © 2017 Rock Valley College. All rights reserved.
//



import UIKit

class ViewController: UIViewController {
    //Outlets
    @IBOutlet weak var txtContacts: UITextView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var txtFirst: UITextField!
    @IBOutlet weak var txtLast: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtZip: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    
    func MsgBox(_ message:String)
    {
        let alert = UIAlertView()
        alert.title = "Alert"
        alert.message = message
        alert.addButton(withTitle: "OK")
        alert.show()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtFirst.endEditing(true)
        txtLast.endEditing(true)
        txtEmail.endEditing(true)
        txtAddress.endEditing(true)
        txtCity.endEditing(true)
        txtState.endEditing(true)
        txtZip.endEditing(true)
        txtPhone.endEditing(true)
    }
    
    func DismissKeyboard(){
        txtFirst.endEditing(true)
        txtLast.endEditing(true)
        txtEmail.endEditing(true)
        txtAddress.endEditing(true)
        txtCity.endEditing(true)
        txtState.endEditing(true)
        txtZip.endEditing(true)
        txtPhone.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField!) -> Bool     {
        textField.resignFirstResponder()
        return true;
    }
    
    func textFieldDidBeginEditing(_ textField:UITextField){
        var scrollPoint:CGPoint
        scrollPoint = CGPoint(x:0, y:textField.frame.origin.y)
        ScrollView.setContentOffset(scrollPoint, animated: true)
    }
    
    func textFieldDidEndEditing(_ textField:UITextField){
        ScrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    func textViewDidBeginEditing(_ textField:UITextView){
        var scrollPoint:CGPoint
        scrollPoint = CGPoint(x:0, y:textField.frame.origin.y)
        ScrollView.setContentOffset(scrollPoint, animated: true)
    }
    
    func textViewDidEndEditing(_ textField:UITextView){
        ScrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        ScrollView.addGestureRecognizer(tap)
        let size: CGRect = UIScreen.main.bounds
        ScrollView.frame = CGRect(x:0, y:50, width:size.width, height:size.height)
        txtFirst.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        ScrollView.setContentOffset(CGPoint.zero, animated: true)
        txtFirst.becomeFirstResponder()
    }
    
    @IBAction func btnView(_ sender: UIButton) {
        DismissKeyboard()
        var scrollPoint:CGPoint
        scrollPoint = CGPoint(x: 0, y: btnBack.frame.origin.y)
        ScrollView.setContentOffset(scrollPoint, animated: true)
    }
    
    @IBAction func btnSave(_ sender: UIButton) {

        DismissKeyboard()
        
        if (txtFirst.text=="" || txtLast.text=="" || txtEmail.text=="" || txtAddress.text=="" || txtCity.text==""
            || txtState.text=="" || txtZip.text=="" || txtPhone.text=="")
        {
            MsgBox("All fields required, please correct")
        }
        else
        {
            
            if (txtContacts.text=="")
            {
                txtContacts.text = "MyContacts \n"
            }
            txtContacts.text = "\(txtContacts.text!) \n\(txtFirst.text!) \n\(txtLast.text!) \n\(txtEmail.text!) \n\(txtAddress.text!)\n\(txtCity.text!)\n\(txtState.text!)\n\(txtZip.text!)\n\(txtPhone.text!)\n"
            txtFirst.text = ""
            txtLast.text = ""
            txtEmail.text = ""
            txtAddress.text = ""
            txtCity.text = ""
            txtState.text = ""
            txtZip.text = ""
            txtPhone.text = ""
            
            var scrollPoint:CGPoint

            scrollPoint = CGPoint(x:0, y:btnBack.frame.origin.y)
            ScrollView.setContentOffset(scrollPoint, animated: true)
        }
    }
}
