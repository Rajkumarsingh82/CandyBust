

import UIKit

class DownloadViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var indexPath = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DownloadUpperCell", bundle: nil), forCellReuseIdentifier: "DownloadUpperCell")
        tableView.register(UINib(nibName: "DownloadCollectionCell", bundle: nil), forCellReuseIdentifier: "DownloadCollectionCell")
        tableView.register(UINib(nibName: "ProgessBrTableViewCell", bundle: nil), forCellReuseIdentifier: "ProgessBrTableViewCell")
    
       
    }
    
    @IBAction func dismissAction(sender: Int){
        self.dismiss(animated: true,completion: nil)
    }
    
    @IBAction func playAction(sender: Int){
                let moveVC = self.storyboard?.instantiateViewController(withIdentifier: "PopUPViewController") as! PopUPViewController
                          if let sheet  = moveVC.sheetPresentationController{
                              sheet.detents = [._detent(withIdentifier: "Test1", constant: 300)]
                              sheet.preferredCornerRadius = 35
                        }
                    present(moveVC, animated: true,completion: nil)

    }

}
extension DownloadViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DownloadUpperCell", for: indexPath) as! DownloadUpperCell
            cell.dismiss.addTarget(self, action: #selector(dismissAction(sender:)), for: .touchUpInside)
            return cell
            
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DownloadCollectionCell", for: indexPath) as! DownloadCollectionCell
           
           return cell
            
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProgessBrTableViewCell", for: indexPath) as! ProgessBrTableViewCell
            cell.playBtn.addTarget(self, action: #selector(playAction(sender:)), for: .touchUpInside)
           return cell
            
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 210
        } else if indexPath.section == 1 {
            return 450
        } else if indexPath.section == 2{
            return 70
        }
      
        return CGFloat()
    }

    
    }

