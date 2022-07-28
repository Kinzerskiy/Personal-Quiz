//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by Anton on 28.07.2022.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var resultDefinnitionLable: UILabel!
    @IBOutlet var resultAnswerLable: UILabel!
    
    
    // MARK: - Public Properties
    var responses: [Answer]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResults()
    }
    private func updateResults() {
        var frequencyOfAnimals: [AnimalType: Int] = [:]
        let animals = responses.map { $0.type }
        
        for animal in animals {
            frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
        }
        
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value}
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequencyAnimal)
        
    }
    
    private func updateUI(with animal: AnimalType) {
        resultAnswerLable.text = "Вы - \(animal.rawValue)"
        resultDefinnitionLable.text = "\(animal.definition)"
    }
}
