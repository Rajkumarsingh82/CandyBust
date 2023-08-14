//
//  DownloadCollectionViewCell.swift
//  TotalityApp
//
//  Created by Futuretek on 10/08/23.
//

import UIKit

class DownloadCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
      
        self.mCollectionView.delegate = self
        self.mCollectionView.dataSource = self
        mCollectionView.register(UINib(nibName: "DownloadSliderCollectionCell", bundle: nil), forCellWithReuseIdentifier: "DownloadSliderCollectionCell")
    }

}
extension DownloadCollectionViewCell: UICollectionViewDataSource,UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mCollectionView.dequeueReusableCell(withReuseIdentifier: "DownloadSliderCollectionCell", for: indexPath) as! DownloadSliderCollectionCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:200, height: 500)
        
     
    }
   
}

