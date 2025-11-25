//
//  ViewController.swift
//  Counter
//
//  Created by Katya on 23.11.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var historyTextView: UITextView!
    
    private var counter = 0
    
   private let date = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.text = "История изменений: \n"
        historyTextView.isScrollEnabled = true
        date.dateFormat = "dd.MM.yyyy HH:mm:ss"
    }
  
    private func textUpdate(text: String) {
        let dateString = date.string(from: Date())
        historyTextView.text += "\(dateString): \(text) \n"
    }

    @IBAction private func plusButtonTap(_ sender: Any) {
        counter += 1
        counterLabel.text = "Значение счётчика: \(counter)"
        textUpdate(text: "значение изменено на +1")
    }
    
    @IBAction private func minusButtonTap(_ sender: Any) {
       if counter > 0 {
           counter -= 1
           textUpdate(text: "значение изменено на -1")
       } else {
           textUpdate(text: "попытка уменьшить значение счётчика ниже 0")
       }
        counterLabel.text = "Значение счётчика: \(counter)"
    }
    
    @IBAction private func resetButtonTap(_ sender: Any) {
        counter = 0
        counterLabel.text = "Значение счётчика: \(counter)"
        textUpdate(text: "значение счётчика сброшено")
    }
    
}
