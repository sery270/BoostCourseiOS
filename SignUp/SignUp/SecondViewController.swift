//
//  SecondViewController.swift
//  SignUp
//
//  Created by 박세란 on 2020/10/09.
//  Copyright © 2020 박세란. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.edgesForExtendedLayout = UIRectEdge.bottom
        
        self.navigationController?.extendedLayoutIncludesOpaqueBars = true
//        self.navigationController?.navigationBar.isTranslucent = false
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func popToPrev() {
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    @IBAction func dismissModal(){
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
