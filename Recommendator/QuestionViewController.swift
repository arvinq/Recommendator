//
//  QuestionViewController.swift
//  Recommendator
//
//  Created by Arvin Quiliza on 9/6/18.
//  Copyright © 2018 arvnq. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var progressView: UIProgressView!
    
    //MARK:- Variables
    //var choice: String = ""
    var choice = RecommendationSurvey.dine
    
    var questionIndex = 0
    var questions: [QuestionS] = []
    var randomQuestions: [QuestionS] = []
    var currentQuestion: QuestionS?
    var currentAnswers: [AnswerS] = []
    var recommendations: [AnswerS] = []
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        selectAndRandomizeQuestion()
        updateUI()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Functions
    /**
     Shuffles the questions. Questions are based on the selected activty from the menu
     */
    fileprivate func selectAndRandomizeQuestion() {
        switch choice {
            case RecommendationSurvey.watch: questions = QandA.watchQuestions
            case RecommendationSurvey.dine: questions = QandA.dineQuestions
            case RecommendationSurvey.explore: questions = QandA.exploreQuestions
            //default: break
        }
        
        randomQuestions = shuffleItems(in: questions)
    }
    
    /**
     Updates the Question Page
     */
    func updateUI() {
        singleStackView.isHidden = true
        
        // removes the views in the stack view before creating a new one
        for aView in singleStackView.arrangedSubviews {
            singleStackView.removeArrangedSubview(aView)
            aView.removeFromSuperview()
        }
        
        currentQuestion = randomQuestions[questionIndex]
        guard let currentQuestion = currentQuestion else { return }
        
        // if the question has budget, don't shuffle because budget's selection is linear
        if !currentQuestion.questionText.contains("budget") {
            currentAnswers = shuffleItems(in: currentQuestion.answersToQuestion)
        } else {
            currentAnswers = currentQuestion.answersToQuestion
        }
        
        //sets up the progress view for each questions asked.
        let totalProgress = Float(questionIndex+1) / Float(questions.count)
        
        questionLabel.text = currentQuestion.questionText
        navigationItem.title = "Question#\(questionIndex+1)"
        progressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.responseType {
            case .single: singleRespTypeQuestion(using: currentAnswers)
            case .multiple: multipleRespTypeQuestion(using: currentAnswers)
            case .ranged: rangedRespTypeQuestion(using: currentAnswers)
        }
        
    }
    
    /**
     Generates a custom RecommendationButton.
     - Parameter title: button's text
     - Parameter buttonTag: button's ID
     - Returns: button generated
     */
    func generateButton(with title: String, and buttonTag: Int) -> UIButton {
        let answerButton = RecommendationButton(type: .system)
        answerButton.setTitle(title, for: .normal)
        
        answerButton.layer.borderWidth = 2.0
        answerButton.layer.borderColor = UIColor.black.cgColor
        answerButton.backgroundColor = UIColor.white
        answerButton.setTitleColor(UIColor.black, for: .normal)
        answerButton.setTitleColor(UIColor.white, for: .highlighted)
        
        answerButton.tag = buttonTag
        answerButton.addTarget(self, action: #selector(singleAnswerButtonPress(sender:)), for: .touchUpInside)
        
        return answerButton
    }
    
    /**
     Appends the selected answer to recommendations and calls nextQuestion()
     - Parameter sender: type UIButton pressed by the user.
     */
    @objc func singleAnswerButtonPress(sender: UIButton) {
        recommendations.append(currentAnswers[sender.tag])
        nextQuestion()
    }
    
    /**
     Sets up stack view and call generate button for each answer. It loops through each answer
     and add the generated button in the stack view
     - Parameter currentAnswers: array of answers to be generated
     */
    func singleRespTypeQuestion (using currentAnswers: [AnswerS]) {
        var buttonTag = 0
        singleStackView.isHidden = false
        singleStackView.spacing = 10.0
        
        
        currentAnswers.forEach { currAnswer in
            singleStackView.addArrangedSubview(generateButton(with: currAnswer.answerText, and: buttonTag))
            buttonTag += 1
        }
    }
    
    
    func multipleRespTypeQuestion(using currentAnswers: [AnswerS]) {
        //do nothing. MultipleResponse Type Question not implemented
    }
    
    func rangedRespTypeQuestion(using currentAnswers: [AnswerS]) {
        //do nothing. Ranged Response Type Question not implemented
    }
    
    /**
     Checks whether the questions has been exhausted. If it has, go to results page
     else updates current page for next question.
     */
    func nextQuestion() {
        questionIndex += 1
        if questionIndex == questions.count {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        } else {
            updateUI()
            
        }
    }
    
    /**
     Shuffles a generic array. It loops through the array, select a new random item
     from it and put it in a new shuffled array.
     - Parameter anyArr: the array to be shuffled
     - Returns: A shuffled array with generic type
     */
    func shuffleItems<T>(in anyArr: [T]) -> [T] {
        var randomArray: [T] = []
        var arrOriginal = anyArr
        
        while !arrOriginal.isEmpty {
            let randomNum = Int(arc4random_uniform(UInt32(arrOriginal.count)))
            randomArray.append(arrOriginal.remove(at: randomNum))
        }
        
        return randomArray
        
    }
    
    //MARK:- Segue Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultsViewController
        destinationVC.recommendations = recommendations
    }
    

}

//MARK:- Custom Views
/**
 Custom button for Answers. Overrode isHighlighted to change background color per state
 */
class RecommendationButton: UIButton {
    override var isHighlighted: Bool {
        didSet {
            self.backgroundColor = isHighlighted ? UIColor.black : UIColor.white
        }
    }
}
