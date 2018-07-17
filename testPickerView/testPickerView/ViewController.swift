//
//  ViewController.swift
//  testPickerView
//
//  Created by CampbellQi on 2018/7/16.
//  Copyright © 2018年 CampbellQi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func showPickerAction(_ sender: Any) {
        self.show()
    }
    
    func show() {
        
        let vc = WQPickerViewController()
        let data = [[["dt_name": "上海"], ["dt_name": "北京"], ["dt_name": "深圳"]], [["dt_name": "大兴"], ["dt_name": "朝阳"], ["dt_name": "海淀"]]]
        vc.dataArray = data
        vc.titleBindingBlock = {(component, row) in
            return data[component][row]["dt_name"]!
        }
        vc.confirmBlock = {(selectedData) in
            print(selectedData)
        }
        vc.itemSelectedBlock = {(component, row) in
            let item = data[component][row]
            print(item)
        }
        vc.controllerHeight = 269
        self.presentBotoom(vc)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

