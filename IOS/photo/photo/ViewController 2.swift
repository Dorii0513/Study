//
//  ViewController.swift
//  photo
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

    @objc fileprivate func onProfileChangeButtonClicked() {
        print("ViewController - onProfilChangeButtonClicked() called")
        //카메라 라이브러리 셋팅
        var config = YPImagePickerConfiguration()
        config.screens = [.library]
        
        // filter 없애기
        config.showsPhotoFilters = false
        //사진이 선택 되었을 때
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
                //프사 이미지 변경
                self.profileImage.image = photo.image
            }
            //사진 선택 창 닫기
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }
    
}
