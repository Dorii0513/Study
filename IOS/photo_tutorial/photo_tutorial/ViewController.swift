//
//  ViewController.swift
//  photo_tutorial
//
//  Created by 김예림 on 2022/07/22.
//

import UIKit
import YPImagePicker

class ViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var profileChangeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.profileImage.layer.cornerRadius = profileImage.frame.height / 2
        self.profileChangeButton.layer.cornerRadius = 10
        
        // 버튼 클릭 액션 설정
        self.profileChangeButton.addTarget(self, action: #selector(onProfileChangeButtonClicked), for: .touchUpInside)
    }
     //프사 변경 버튼이 클릭 되었을 때
    @objc fileprivate func onProfileChangeButtonClicked() {
        print("ViewController - onProfilChangeButtonClicked() called")
        
        let picker = YPImagePicker()
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage as Any) // Transformed image, can be nil
                print(photo.exifMeta as Any) // Print exif meta data of original image.
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }
    
}

