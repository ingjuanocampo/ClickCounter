//
//  BreedSelectorViewController.swift
//  ClickCounter
//
//  Created by juan ocampo on 5/3/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import UIKit

class BreedSelectorViewController: UIViewController {
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var imageView: UIImageView!
    var breeds: [String] = []
    
    override func viewDidLoad() {
        pickerView.delegate = self
        pickerView.dataSource = self
        loadBreedList()
    }
    
    private func loadBreedList() {
        DogAPI.getAllBreeds(completionHanlder: handleBreedLoad(breeds:error:))
    }
    
    private func handleBreedLoad(breeds: [String]?, error: Error?) {
        guard let breeds = breeds else { return }
          self.breeds = breeds
          DispatchQueue.main.async {
              self.pickerView.reloadAllComponents()
          }
    }
    
}


extension BreedSelectorViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return breeds.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return breeds[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        DogAPI.requestBreedImage(breed: breeds[row]) { (dogImage, error) in
                   guard let dogImage = dogImage else {
                       print(error?.localizedDescription ?? "Error accessing service" )
                       return
                   }
            self.imageView.showUrlImage(url: dogImage.message?[0] ?? "")
            }
    }
    
    
    
    
}
