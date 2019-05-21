//
//  trafikAdabi17.swift
//  Ehliyet-2017
//
//  Created by YILMAZ ER on 13.02.2018.
//  Copyright © 2018 YILMAZER. All rights reserved.
//

import UIKit
import CoreData

class sonuclarimList: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var trafik17Table: UITableView!

    @IBOutlet weak var editBtn: RoundButton!
    
    var results = [Sonuclar]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        editBtn.backgroundColor = UIColor(red: 0.4824, green: 0, blue: 0.5373, alpha: 1.0) /* #7b0089 */
       
        relodata()
        
    }
    
    func relodata() {
        
        let fetchRequest: NSFetchRequest<Sonuclar> = Sonuclar.fetchRequest()
        do {
            let results = try  resultService.contex.fetch(fetchRequest)
            self.results = results
            self.trafik17Table.reloadData()
        } catch { }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? SoncularimListCell else {
            return UITableViewCell()
        }
        
        cell.dersAdi.text = results[indexPath.row].dersadi
        cell.puanS.text = String(format: "%.2f", results[indexPath.row].puan)
        cell.dogruS.text = String(results[indexPath.row].dogru)
        cell.yanlisS.text = String(results[indexPath.row].yanlis)
        cell.basariOrani.text = "%" + String(format: "%.0f",(results[indexPath.row].x) * 100)
        cell.tarihS.text = results[indexPath.row].tarih
        cell.saatS.text = results[indexPath.row].saat
        cell.basariProgress.value = results[indexPath.row].x
        
        if results[indexPath.row].puan < 70 {
            cell.dersAdi.textColor = UIColor.red
        } else {
            cell.dersAdi.textColor = UIColor(red: 0, green: 0.549, blue: 0.0549, alpha: 1.0) /* #008c0e */
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let vcName = results[indexPath.row].lessonTitle
//        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName!)
//        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let favoriteToDelete = results[indexPath.row]
            resultService.contex.delete(favoriteToDelete)
            results.remove(at: indexPath.row)
            trafik17Table.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    @IBAction func editBTN(_ sender: Any) {
    
        trafik17Table.isEditing = !trafik17Table.isEditing
        
        if trafik17Table.isEditing {
            editBtn.setTitle("TAMAM", for: .normal)
            editBtn.backgroundColor = UIColor(red: 0, green: 0.549, blue: 0.0549, alpha: 1.0) /* #008c0e */
        } else {
            editBtn.setTitle("DÜZENLE", for: .normal)
            editBtn.backgroundColor = UIColor(red: 0.4824, green: 0, blue: 0.5373, alpha: 1.0) /* #7b0089 */
        }
    }
    
}




