

import UIKit

class ProgessBrTableViewCell: UITableViewCell {

    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var progessView: UIView!
    @IBOutlet weak var progessBr: UIProgressView!
    @IBOutlet weak var progessLbl: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        playBtn.isHidden = true
        progessBr.progressTintColor = UIColor.green
        progessBr.trackTintColor = UIColor.lightGray
        progessBr.layer.cornerRadius = 8
        progessBr.clipsToBounds = true
        progessBr.progress = 0
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        progessView.addGestureRecognizer(tapGesture)
       // let image = UIImage(named: "your_image_name")

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {

        progessView.isUserInteractionEnabled = false
            var progress: Float = 0.0
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [self] timer in
                progress += 0.01
                self.progessBr.progress = progress
                let percentage = Int(progress * 100)
                self.progessLbl.text = "\(percentage)%"

                if progress >= 1.0 {
                    timer.invalidate()
                    self.progessView.isUserInteractionEnabled = true
                    let image = UIImage(named: "YesButton")
                    yesButton.setImage(image, for: .normal)

                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.progessView.isHidden = true
                        self.yesButton.isHidden = true
                        self.playBtn.transform = CGAffineTransform(translationX: 0, y: self.playBtn.frame.height)
                        self.playBtn.isHidden = false
                        UIView.animate(withDuration: 0.5) {
                        self.playBtn.transform = .identity
                            
                        }
                        
                    }
                }
            }
            timer.fire()
      }
    }
    
    
    

