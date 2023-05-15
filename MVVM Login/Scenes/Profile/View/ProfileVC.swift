//
//  ProfileVC.swift
//  MVVM Login
//
//  Created by 2B on 07/05/2023.
//

import UIKit
import Kingfisher


class ProfileVC: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var emaillBL: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    //MARK: - Variables
    var viewModel : ProfileViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configeView()
    }
    
    
    init(_ viewModel : ProfileViewModel){
        self.viewModel = viewModel
        super.init(nibName: "ProfileVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Functions
    func configeView(){
        userImage.kf.indicatorType = .activity
        userImage.kf.setImage(with: URL(string:viewModel.userProfileImage))
        userNameLbl.text = viewModel.userName
        emaillBL.text = viewModel.userEmail
        phoneLbl.text = viewModel.userPhone
    }
}
