//
//  KisaNotlar.swift
//  Ehliyet
//
//  Created by YILMAZ ER on 20.12.2017.
//  Copyright © 2017 YILMAZ ER. All rights reserved.
//

import UIKit

class KisaNotlar: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var hukukTable: UITableView!
    
    var diagnosticArray = [Diagnostic]()
    var currentDiagnoticArray = [Diagnostic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDiagnostics()
        
    }
    
    private func setupDiagnostics() {
        
        diagnosticArray.append(Diagnostic(name: "İlkyardım Bilgisi",Cname:"Konu Anlatımı",image:"1", Dimg:"desen"))
        diagnosticArray.append(Diagnostic(name: "Trafik ve Çevre Bilgisi",Cname:"Konu Anlatımı",image:"1", Dimg:"desen"))
        diagnosticArray.append(Diagnostic(name: "Motor Bilgisi",Cname:"Konu Anlatımı",image:"1", Dimg:"desen"))
 
        currentDiagnoticArray = diagnosticArray
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDiagnoticArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? KisaNotlarCell else {
            return UITableViewCell()
        }
        
        cell.name.text = currentDiagnoticArray[indexPath.row].name
        cell.Cname.text = currentDiagnoticArray[indexPath.row].Cname
        cell.imageDesen.image = UIImage(named:currentDiagnoticArray[indexPath.row].image)
        cell.imageDesen.image = UIImage(named:currentDiagnoticArray[indexPath.row].Dimg)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcName = currentDiagnoticArray[indexPath.row].name
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    
    
    class Diagnostic {
        
        let name:String
        let image:String
        let Dimg:String
        let Cname:String
        
        init(name: String,Cname:String,image: String, Dimg:String) {
            self.name = name
            self.image = image
            self.Dimg = Dimg
            self.Cname = Cname
        }
        
    }
}

