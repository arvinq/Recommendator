//
//  ResultsViewController.swift
//  Recommendator
//
//  Created by Arvin Quiliza on 9/6/18.
//  Copyright © 2018 arvnq. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var headerLabelStackView: UIStackView!
    @IBOutlet weak var bodyLabelStackView: UIStackView!
    @IBOutlet weak var onePixel: NSLayoutConstraint!
    
    //MARK:- Outlets - Watch
    @IBOutlet weak var watchStackView: UIStackView!
    @IBOutlet weak var watchReleaseLabel: UILabel!
    @IBOutlet weak var watchLengthLabel: UILabel!
    @IBOutlet weak var watchGenreLabel: UILabel!
    @IBOutlet weak var watchDistributorLabel: UILabel!
    @IBOutlet weak var watchDirectorLabel: UILabel!
    @IBOutlet weak var watchCastLabel: UILabel!
    @IBOutlet weak var watchRatingLabel: UILabel!
    
    //MARK:- Outlets - Explore
    @IBOutlet weak var exploreStackView: UIStackView!
    @IBOutlet weak var exploreAddressLabel: UILabel!
    @IBOutlet weak var explorePhoneLabel: UILabel!
    @IBOutlet weak var exploreEmailLabel: UILabel!
    @IBOutlet weak var exploreWebsiteLabel: UILabel!
    
    //MARK:- Outlets - Dine
    @IBOutlet weak var dineStackView: UIStackView!
    @IBOutlet weak var dineAddressLabel: UILabel!
    @IBOutlet weak var dinePhoneLabel: UILabel!
    @IBOutlet weak var dineEmailLabel: UILabel!
    @IBOutlet weak var dineWebsiteLabel: UILabel!
    
    //MARK:- Variable
    var recommendations: [AnswerS] = []
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //onePixel.constant = 1 / UIScreen.main.scale
        
        setStackViewUI()
        navigationItem.hidesBackButton = true
        calculateRecommendation()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resultImage?.contentMode = .scaleAspectFill
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Functions
    
    /**
     Sets the textual stack views to have margins.
     */
    fileprivate func setStackViewUI() {
        headerLabelStackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        headerLabelStackView.isLayoutMarginsRelativeArrangement = true
        bodyLabelStackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        bodyLabelStackView.isLayoutMarginsRelativeArrangement = true
    }
    
    /**
     Update the top information and the overview based on the answer calculated
     - Parameter answer: calculated response from the user
     - Parameter percent: generated percentage of the recommendation
     */
    fileprivate func updateUI(with answer: AnswerType, and percent: Double) {
        resultsLabel.text = answer.rawValue
        //detailsLabel.text = answer.otherDetails
        overviewLabel.text = answer.overview
        percentLabel.text = String(percent) + "% of your preference"
        resultImage.image = answer.poster
        
    }
    
    /**
     Calculate the recommendation to display from the Question VC's answers
     */
    func calculateRecommendation() {
        
        watchStackView.isHidden = true
        dineStackView.isHidden = true
        exploreStackView.isHidden = true
        
        var recommendationDictionary:[AnyHashable: Int] = [:]
        let mostCommonAnswer: AnyHashable
        let mostCommonAnswerCount: Int
        let mcaPercentage: Double
        
        //only get the answerType
        let recommendationTypes = recommendations.map{ $0.answerType }
        
        //tally the answers from answer type
        recommendationTypes.forEach {
            recommendationDictionary[$0] = (recommendationDictionary[$0] ?? 0) + 1
        }
        
        mostCommonAnswer = recommendationDictionary.sorted{$0.value > $1.value}.first!.key
        mostCommonAnswerCount = recommendationDictionary.sorted{$0.value > $1.value}.first!.value
        mcaPercentage = Double(mostCommonAnswerCount) / Double(recommendationTypes.count) * 100.0
        
        //update the Result page depending on the answer type
        switch mostCommonAnswer.base {
            case let answer as DineType:  do { updateUI(with: answer, and: mcaPercentage)
                                            updateDineStack(with: answer) }
            case let answer as ExploreType: do { updateUI(with: answer, and: mcaPercentage)
                                            updateExploreStack(with: answer) }
            case let answer as WatchType: do { updateUI(with: answer, and: mcaPercentage)
                                            updateWatchStack(with: answer) }
            default: break
        }
        
    }
    
    /**
     Get the Watch data and update the watch outlets according to the data
     - Parameter answer: Watch data from model
     */
    func updateWatchStack(with answer: WatchType) {
        watchStackView.isHidden = false
        guard let details = Details.detailsDictionary["\(answer)"] as? WatchDetails else { return }
        
        watchReleaseLabel.text = details.release
        watchLengthLabel.text = details.length
        watchGenreLabel.text = details.genre
        watchDistributorLabel.text = details.distributor
        watchDirectorLabel.text = details.director
        watchCastLabel.text = details.cast
        watchRatingLabel.text = details.rating
    }
    
    /**
     Get the dine data and update the dine outlets according to the data
     - Parameter answer: Dine data from model
     */
    func updateDineStack(with answer: DineType) {
        dineStackView.isHidden = false
        guard let details = Details.detailsDictionary["\(answer)"] as? DineDetails else { return }
        
        dineAddressLabel.setIconAndText(image: #imageLiteral(resourceName: "addressIcon"), with: details.address)
        dinePhoneLabel.setIconAndText(image: #imageLiteral(resourceName: "phoneIcon"), with: details.phone)
        dineEmailLabel.setIconAndText(image: #imageLiteral(resourceName: "emailIcon"), with: details.email)
        dineWebsiteLabel.setIconAndText(image: #imageLiteral(resourceName: "webIcon"), with: details.website)
    }
    
    /**
     Get the explore data and update the explore outlets according to the data
     - Parameter answer: Explore data from model
     */
    func updateExploreStack(with answer: ExploreType) {
        exploreStackView.isHidden = false
        guard let details = Details.detailsDictionary["\(answer)"] as? ExploreDetails else { return }
        
        //exploreAddressLabel.text = details.address
        exploreAddressLabel.setIconAndText(image: #imageLiteral(resourceName: "addressIcon"), with: details.address)
        explorePhoneLabel.setIconAndText(image: #imageLiteral(resourceName: "phoneIcon"), with: details.phone)
        exploreEmailLabel.setIconAndText(image: #imageLiteral(resourceName: "emailIcon"), with: details.email)
        exploreWebsiteLabel.setIconAndText(image: #imageLiteral(resourceName: "webIcon"), with: details.website)
    }
    
    

}

//MARK:- Extension
extension UILabel {
    /**
     Prepend an image/icon in a label's text
     - Parameter image: Image to prepend the label
     - Parameter text: Label text
     */
    func setIconAndText (image: UIImage, with text: String) {
        //Create Attachment
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image
        //Set bound to reposition
        imageAttachment.bounds = CGRect(x: 0, y: 0, width: 14, height: 14)
        //Create string with attachment
        let attachmentStrWithImg = NSAttributedString(attachment: imageAttachment)
        
        //Initialize mutable string
        let mutableAttributedString = NSMutableAttributedString()
        //Add image to mutable string
        mutableAttributedString.append(attachmentStrWithImg)
        
        //Add the text to mutable string
        let textString = NSAttributedString(string: " " + text, attributes: [.font: self.font.withSize(14)])
        mutableAttributedString.append(textString)
        
        self.textAlignment = .left;
        self.attributedText = mutableAttributedString
    }
}
