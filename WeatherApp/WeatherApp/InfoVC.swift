//
//  InfoVC.swift
//  WeatherApp
//
//  Created by Den4ikLvivUA on 02.07.2019.
//  Copyright © 2019 Den4ikLvivUA. All rights reserved.
//

import UIKit
import SafariServices

class InfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func TelegramClicked(_ sender: Any) {
        showSafariVC(for: "https://t.me/denchiklvivua")
    }
    
    @IBAction func gitHubClicked(_ sender: Any) {
        showSafariVC(for: "https://github.com/Den4ikLvivUA")
    }
    func showSafariVC(for urlS: String){
        guard let url = URL(string: urlS) else{
            //ERROR
            print("Error, there is no URL")
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    
}
