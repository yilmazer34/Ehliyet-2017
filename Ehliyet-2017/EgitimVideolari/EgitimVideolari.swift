//
//  EgitimVideolari.swift
//  Ehliyet-2017
//
//  Created by YILMAZ ER on 8.03.2018.
//  Copyright © 2018 YILMAZER. All rights reserved.
//

import UIKit

class EgitimVideolari: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var segmentController: UISegmentedControl!
    
    @IBOutlet weak var hukukTable: UITableView!
    
    var diagnosticArray = [Diagnostic]()
    var currentDiagnoticArray = [Diagnostic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDiagnostics()
        
    }
    
    private func setupDiagnostics() {
        
        diagnosticArray.append(Diagnostic(name: "Trafik ve Çevre Bilgisi-1",Cname:"Bu alan internet kullanır.",image:"1", Dimg:"videoicon"))
        diagnosticArray.append(Diagnostic(name: "Trafik ve Çevre Bilgisi-2",Cname:"Bu alan internet kullanır.",image:"1", Dimg:"videoicon"))
        diagnosticArray.append(Diagnostic(name: "Araç Tekniği (Motor)-1",Cname:"Bu alan internet kullanır.",image:"1", Dimg:"videoicon"))
        diagnosticArray.append(Diagnostic(name: "Araç Tekniği (Motor)-2",Cname:"Bu alan internet kullanır.",image:"1", Dimg:"videoicon"))
        diagnosticArray.append(Diagnostic(name: "İlk Yardım",Cname:"Bu alan internet kullanır.",image:"1", Dimg:"videoicon"))
        diagnosticArray.append(Diagnostic(name: "Direksiyon Eğitimi",Cname:"Bu alan internet kullanır.",image:"1", Dimg:"videoicon"))
        
        currentDiagnoticArray = diagnosticArray
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDiagnoticArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? EgitimVideolariCell else {
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


