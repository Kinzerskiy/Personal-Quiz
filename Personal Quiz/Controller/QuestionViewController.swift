//
//  QuestionViewController.swift
//  Personal Quiz
//
//  Created by Anton on 28.07.2022.
//

import UIKit

class QuestionViewController: UIViewController {
    
    //MARK: - IB Outlets
    
    @IBOutlet var quesationLable: UILabel!
    
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLables: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLables: [UILabel]!
    @IBOutlet var rangedSlider: UISlider!
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    
    
    
    // MARK: - Private Properties
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var answersChoosen: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    // MARK: - IB Actions
    
    @IBAction func singleAnwerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        guard let currentIndex = singleButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[currentIndex]
        answersChoosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answersChoosen.append(answer)
            }
        }
            nextQuestion()
    }
    
    @IBAction func rangedButtonAnswersPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChoosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    // MARK: - Private Methods
    
    // Update user interface
    private func updateUI() {
        // Hide everething
        for stackview in [singleStackView, multipleStackView, rangedStackView] {
            stackview?.isHidden = true
        }
        
        // Get current question
        let currentQuestion = questions[questionIndex]
        
        // Set current question for question lable
        quesationLable.text = currentQuestion.text
        
        
        // Calculate progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // Set progress for question progress view
        questionProgressView.setProgress(totalProgress, animated: true)
        
        // Set navigation title
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        let currentAnswers = currentQuestion.answers
        
        // Show stack view corresponding to question type
        
        switch currentQuestion.type {
        case .single:
            updateSingleStackView(using: currentAnswers)
        case .multiple:
            updateMultipleStackView(using: currentAnswers)
        case .ranged:
            updateRangedStackView(using: currentAnswers)
        }
    }
    
    
    /// Set single stack view
    /// - Parameter answers: array with answers
    ///
    /// Description of method
    private func updateSingleStackView(using answers: [Answer]) {
        // Show single stack view
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    /// Setup multiple stack view
    /// - Parameter answers: Array with answers
    private func updateMultipleStackView(using answers: [Answer]) {
        //Show multiple stack view
        multipleStackView.isHidden = false
        
        for (lable, answer) in zip(multipleLables, answers) {
            lable.text = answer.text
        }
        
    }
    
    /// Setup ranged stack view
    /// - Parameter answers: Array with answers
    private func updateRangedStackView(using answers: [Answer]) {
        //Show ranged stack view
        rangedStackView.isHidden = false
        
        rangedLables.first?.text = answers.first?.text
        rangedLables.last?.text = answers.last?.text
        
    }
    
    // MARK: - Navigation
    // Show next question or go to the next screen
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "resultSegue" else { return }
        let resultVC = segue.destination as! ResultsViewController
        resultVC.responses = answersChoosen
    }
}
