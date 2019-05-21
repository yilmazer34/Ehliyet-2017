//
//  iletisim.swift
//  Ehliyet-2017
//
//  Created by YILMAZ ER on 30.03.2018.
//  Copyright © 2018 YILMAZER. All rights reserved.
//

import UIKit
import Foundation
import MessageUI

class iletisim: UIViewController, MFMailComposeViewControllerDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        print("mesaj gönder")
        let mailComposerViewController = configureMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposerViewController, animated: true, completion: nil)
        } else {
            self.showsendMailErrorAlert()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*@IBAction func website(_ sender: Any) {
        
        UIApplication.shared.open(URL(string: "https://developeryilmazer.azurewebsites.net")! as URL, options: [:], completionHandler: nil)
        
    } */
    
    @IBAction func sendeMail(_ sender: Any) {
       
        print("mesaj gönder")
        let mailComposerViewController = configureMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposerViewController, animated: true, completion: nil)
        } else {
            self.showsendMailErrorAlert()
        }
        
    }
    
    func configureMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["developeryilmazer@gmail.com"])
        mailComposerVC.setSubject("şikayet, öneri")
        mailComposerVC.setMessageBody("Değerli müşterimiz bu alana öneri veya şikayetinizi yazabilir veya website yada mobile uygulama yaptırmak istediğinizi belirtebilirsiniz.", isHTML: false)
        return mailComposerVC
    }
    
    func showsendMailErrorAlert() {
        let alertController = UIAlertController(title: "Mail Gönderilemedi", message: "Telefonunuz bir maile kayıtlı olmadığı için mail yollanamıyor.", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "HATA", style: UIAlertAction.Style.default, handler: {(action) -> Void in
            
        })
        
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
