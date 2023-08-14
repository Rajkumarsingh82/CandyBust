

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        TableView.delegate = self
        TableView.dataSource = self
        TableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
    @IBAction func DownloadAction(sender: Int){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DownloadViewController") as! DownloadViewController
                     vc.modalPresentationStyle = .overCurrentContext
                     vc.providesPresentationContextTransitionStyle = false
                     vc.definesPresentationContext = false
                     vc.modalTransitionStyle = .crossDissolve
                    self.present(vc, animated: true,completion: nil)
      }

}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.DownloadBtn.tag = indexPath.row
        cell.DownloadBtn.addTarget(self, action: #selector(DownloadAction(sender:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 500
    }
    
}
