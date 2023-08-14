

import UIKit

class DownloadCollectionCell: UITableViewCell {

    @IBOutlet weak var mcollectionView: UICollectionView!
    let layout = UICollectionViewFlowLayout()
    let bannerImages = [UIImage(named: "Image 2.jpg"),UIImage(named: "Image 1.jpg"),UIImage(named: "Image.jpg")]
    override func awakeFromNib() {
        super.awakeFromNib()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 10
        mcollectionView.setCollectionViewLayout(layout, animated: true)
        self.mcollectionView.delegate = self
        self.mcollectionView.dataSource = self
        mcollectionView.register(UINib(nibName: "DownloadSliderCollectionCell", bundle: nil), forCellWithReuseIdentifier: "DownloadSliderCollectionCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
extension DownloadCollectionCell: UICollectionViewDataSource,UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mcollectionView.dequeueReusableCell(withReuseIdentifier: "DownloadSliderCollectionCell", for: indexPath) as! DownloadSliderCollectionCell
        cell.BannerImg.image = bannerImages[indexPath.row]
        
        
        return cell
    }

}
extension DownloadCollectionCell:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          
          let widthPerItem = mcollectionView.frame.width  - layout.minimumInteritemSpacing
        print("widthPerItem--\(widthPerItem)")
          return CGSize(width:widthPerItem - 70, height: 400)
      }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         return 1
       }

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top:5,left:5,bottom: 5,right: 5)
       
       
       }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 1
       }
    
}
