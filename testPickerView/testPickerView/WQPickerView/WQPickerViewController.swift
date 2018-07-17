//
//  WQPickerViewController.swift
//  SJKY
//
//  Created by 冯万琦 on 2018/1/29.
//  Copyright © 2018年 sjky. All rights reserved.
//

import UIKit

class WQPickerViewController: WQPresentBottomController {
    @IBOutlet weak var bottomCon: NSLayoutConstraint!
    @IBOutlet weak var pickerView: UIPickerView!
    
    @objc var titleBindingBlock: ((_ component :Int, _ row :Int) -> String)!
    //数组里面放数组
    @objc var confirmBlock: ((_ selectedArray: [Any]) -> Void)!
    @objc var itemSelectedBlock: ((_ component :Int, _ row :Int) -> Void)!
    
    @objc var dataArray: [[Any]]!
    
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func confirm(_ sender: Any) {
        var selectedArray: [Any] = []
        
        for i in 0 ..< dataArray.count {
            let obj = dataArray[i][pickerView.selectedRow(inComponent: i)]
            selectedArray.append(obj)
        }
        
        self.dismiss(animated: true) {
            self.confirmBlock?(selectedArray)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let _ = dataArray {
            self.pickerView.reloadAllComponents()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //执行动画
//        UIView.animate(withDuration: 2) {
//            self.bottomCon.constant = 0
//        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func show(from vc: UIViewController) {
//        vc.view.endEditing(true)
//        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//        vc.present(self, animated: true, completion: nil)
//    }

}

extension WQPickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //计算列数
        return dataArray.count
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let array = dataArray[component] as! [Any]
        return array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.titleBindingBlock?(component, row)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.itemSelectedBlock?(component, row)
        //位置还原位初始
        for component in component+1 ..< pickerView.numberOfComponents {
            pickerView.selectRow(0, inComponent: component, animated: false)
        }
        pickerView.reloadAllComponents()
    }
}
