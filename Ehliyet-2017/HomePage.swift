//
//  HomePage.swift
//  ReçeteA-7-24
//
//  Created by YILMAZ ER on 4.12.2017.
//  Copyright © 2017 YILMAZ. All rights reserved.
//

import UIKit

class HomePage: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var score = 0
    
    let homeTitles = ["Sınavlar (Çıkmış Sınav Soruları)",
                      "İlk Yardım Çıkmış Sınav Soruları",
                      "Trafik ve Çevre Çıkmış Sınav Soruları",
                      "Araç Tekniği (Motor) Çıkmış Sınav Soruları",
                      "Trafik Adabı Çıkmış Sınav Soruları",
                      "Kısa Notlar",
                      "Eğitim Videoları",
                      "Sonuclarım",
                      "Uygulama Hakkında",
                      "Sınava Kalan Süre",
                      "Sınav Hakkında Bilgi",
                      "İletişim, Şikayet"]
    
//    "Reklamsız Versionu"
    
    let homeImages = [UIImage(named:"2")!,
                      UIImage(named:"3")!,
                      UIImage(named:"6")!,
                      UIImage(named:"4")!,
                      UIImage(named:"7")!,
                      UIImage(named:"5")!,
                      UIImage(named:"videoicon")!,
                      UIImage(named:"results-icon")!,
                      UIImage(named:"9")!,
                      UIImage(named:"sure")!,
                      UIImage(named:"8")!,
                      UIImage(named:"iletisim")!]
    
//     UIImage(named:"reklamsiz")!

    @IBOutlet weak var CollectionView: UICollectionView!
    
     var WebAdresi = "https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=1318809913&mt=8"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "val") != nil {
            self.score = UserDefaults.standard.object(forKey: "val") as! Int
        }
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
        
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
        if score == 0 {
            myAlert(title: "HOŞGELDİNİZ", message: "Merhaba Değerli Kullanıcımız.\n\nSizler için bu alanda en iyisini yaptık.\n\nEkibimiz bu uygulama üzerinde uzun zamandır çalışıyor. Umarım uygulamayı beğenirsiniz.\n\nSınavda Başarılar Dilerim.\n\nNOT: Reklam, her yaptığınız yanlış soruda gelir. Çok reklam istemiyorsanız az yanlış yapın. 😉\n\n2.NOT: Reklam sayısını uygulamaya 5 yıldız vererek reklam sayısını ciddi oranda azaltabilirsiniz. 🤫")
        }
        if score >= 1 {
        }
        
    }
    
    func myAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "TAMAM", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            
       
            self.score =  self.score + 1
            
            UserDefaults.standard.set(self.score, forKey: "val")
            UserDefaults.standard.synchronize()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.HomeLabel.text = homeTitles[indexPath.item]
        cell.HomeImage.image = homeImages[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vcName = homeTitles[indexPath.item]
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(viewController!, animated: true)
    }

}
