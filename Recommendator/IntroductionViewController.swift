//
//  ViewController.swift
//  Recommendator
//
//  Created by Arvin Quiliza on 9/6/18.
//  Copyright © 2018 arvnq. All rights reserved.
//

import UIKit

enum RecommendationSurvey {
    case dine, watch, explore
}

class IntroductionViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var dine: UIButton!
    @IBOutlet weak var watch: UIButton!
    @IBOutlet weak var explore: UIButton!
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupMenuButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:- Functions
    /**
     Lays out the menu buttons
    */
    func setupMenuButtons() {
        dine.setBackgroundImage(#imageLiteral(resourceName: "dineHome"), for: .normal)
        watch.setBackgroundImage(#imageLiteral(resourceName: "watchHome"), for: .normal)
        explore.setBackgroundImage(#imageLiteral(resourceName: "exploreHome"), for: .normal)
        
        dine.setTitle(buttonText(for: survey(represendetBy: dine)), for: .normal)
        watch.setTitle(buttonText(for: survey(represendetBy: watch)), for: .normal)
        explore.setTitle(buttonText(for: survey(represendetBy: explore)), for: .normal)
        
        dine.layoutIfNeeded()
        watch.layoutIfNeeded()
        explore.layoutIfNeeded()
        
        dine.subviews.first?.contentMode = .scaleAspectFill
        watch.subviews.first?.contentMode = .scaleAspectFill
        explore.subviews.first?.contentMode = .scaleAspectFill
    }
    
    private func survey(represendetBy button: UIButton) -> RecommendationSurvey! {
        switch button {
            case dine: return .dine
            case watch: return .watch
            case explore: return .explore
            default: return nil
        }
    }
    
    private func buttonText(for survey: RecommendationSurvey) -> String{
        switch survey {
            case .dine: return "Dine Locally"
            case .explore: return "Explore like a Local"
            case .watch: return "Watch a Movie"
        }
    }
    
    //MARK:- Actions
    @IBAction func selectFromChoices(_ sender: Any) {
        performSegue(withIdentifier: "questionsSegue", sender: sender)
    }
    
    @IBAction func unwindToIntro(segue: UIStoryboardSegue) { }
    
    //MARK:- Segue Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationVC = segue.destination as! UINavigationController
        let questionsVC = navigationVC.topViewController as! QuestionViewController
        
        guard let senderButton = sender as? UIButton else { return }
        
//        switch senderButton {
//            case dine: questionsVC.choice = survey(represendetBy: senderButton)
//            case watch: questionsVC.choice = survey(represendetBy: watch)
//            case explore: questionsVC.choice = survey(represendetBy: explore)
//            default: break
//        }
        
        questionsVC.choice = survey(represendetBy: senderButton)
    }
    
}

