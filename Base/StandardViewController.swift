//
//  StandardViewController.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 09/05/2022.
//

import Foundation
import UIKit


class StandardViewController<VM: ViewModel>: UIViewController, MVVM {
    var viewModel: VM?
    
    typealias ViewModelType = VM

    
    override func viewDidLoad() {
        addLeftNavigationBarItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //check if kind of class standrad
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
    }
    
    func addLeftNavigationBarItem() {
//        let backImage = UIImage(named: Images.navigationBarImages.backButtonIcon)?.withRenderingMode(.alwaysOriginal)
//        self.navigationItem.leftBarButtonItem =
//        UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(backButtonPressed(sender:)))
    }
    
    
    @objc func backButtonPressed(sender:UIButton) {
        print(">>>>>>>>>>back")
        navigationController?.popViewController(animated: true)
    }
    

}



extension StandardViewController {
   class func instanceFromStoryboard<T>(withViewModel viewModel: VM, fromStoryboard storyboard: String) -> T where T : StandardViewController<VM> {
        let storyboard = UIStoryboard(name: storyboard, bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "\(Self.self)") as! T
        viewController.viewModel = viewModel
        
        return viewController
    }
    
   class func instanceFromNib<T: StandardViewController<VM>>(withViewModel viewModel: VM) -> T {
        let nibName = "\(Self.self)"
        let viewController = Bundle.main.loadNibNamed(nibName, owner: nil)!.first! as! T
        viewController.viewModel = viewModel
        
        return viewController
    }
}
