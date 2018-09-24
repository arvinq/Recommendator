//
//  RecommendSModel.swift
//  Recommendator
//
//  Created by Arvin Quiliza on 9/7/18.
//  Copyright © 2018 arvnq. All rights reserved.
//

import Foundation
import UIKit

/**
 ResponseType Enum
 */
enum ResponseTypeS {
    case single, multiple, ranged
}

/**
 Struct Question for the question data below
 */
struct QuestionS {
    let questionText: String
    let responseType: ResponseTypeS
    let answersToQuestion: [AnswerS]
    
    
}

/**
 Struct Answer for the answer data below
 */
struct AnswerS {
    let answerText: String
    let answerType: AnyHashable
    
    
}

/**
 Protocol to give all of the AnswerTypes something to conform to.
 */
protocol AnswerType {
    var overview: String { get }
    var otherDetails: String { get }
    var rawValue: String { get }
    var poster: UIImage { get }
}

/**
 Dine type enum containing the overview and the posted of the dineTypes
 */
enum DineType: String, AnswerType{
    
    case makan = "Alice's Makan"
    case BNB = "Berry 'N' Beans"
    case pyrmont = "Pyrmont Bridge Hotel"
    case appBar = "Appetito Pizza.Pasta.Bar"
    
    var overview: String {
        switch self {
            case .makan: return "Better shape up, because you need this menu of hawker food, including dishes like spicy mee rebus – hokkien noodles in gravy-thick curry sauce with succulent chicken – and fragrant nasi goreng. To your sweet tooth you must be true, so grab Alice’s signature kuih (Malaysian sweets) like rainbow-layered kuih lapis, or sticky rice and coconut custard kuih serimuka. This is the one you want."
            case .BNB: return "I had tried lots of acai bowls in Sydney , the one I tried at Berry N Beans Cafe is the best ! I ordered classic original acai bowl and it never melted till I finished ~ Heaps Strawberries and Bananas and Granola is chruchy and nutty ～ I added Lychee ball which taste really tropical ～ I will definitely come back and try other bowls like pink pitaya bowl ～ yummy ！"
            case .pyrmont: return "After a day of Sydney City sightseeing nothing beats a lovely cold brew at this historic looking hotel at the end of Pyrmont Bridge in Darling Harbour. Friendly staff and reasonably priced food and drink make this a desired spot after the hard yards of Sydney touristing."
            case .appBar: return " Head to Appetito Pizza.Pasta.Bar for the very best Italian cuisine. They have been serving traditional Italian favourites in The Rocks since 2011, sharing our passion for fresh quality produce with thousands of local and international guests. Inspired by the fresh and vibrant colours of Italy, you'll love their authentic menu of traditional pastas and wood fired pizzas. And with their warm, inviting venue, coupled with excellent service, you're sure to have a memorable dining experience."
        }
    }
    
    var otherDetails: String {
        return ""
    }
    
    var poster: UIImage {
        switch self {
        case .makan: return #imageLiteral(resourceName: "makan")
        case .BNB: return #imageLiteral(resourceName: "bnb")
        case .pyrmont: return #imageLiteral(resourceName: "pyrmont")
        case .appBar: return #imageLiteral(resourceName: "appBar")
        }
    }
}

/**
 Explore type enum containing the overview and the posted of the exploreTypes
 */
enum ExploreType: String, AnswerType {
    case blueMt = "Blue Mountain Tour"
    case taronga = "Taronga Zoo"
    case walkTour = "Sydney Free Walking Tour"
    case bondi = "Bondi Beach Tour and Coastal Walk"
    
    var overview: String {
        switch self {
        case .blueMt: return "Escape Sydney’s urban bustle for a day to explore the World Heritage-listed wilderness of the Blue Mountains. Soak up panoramic views of eucalyptus forests, and learn the Aboriginal legends behind ancient rock formations. Explore the charming mountain town of Leura, and catch sight of koalas and kangaroos at Featherdale Wildlife Park. Plus, you can upgrade to include a ride on a cableway or railway at Scenic World."
        case .taronga: return "Located on shoreline of Sydney Harbour, Sydney Taronga Zoo is home to thousands of fascinating animals, including Australian natives such as the koala, kangaroo and platypus. With your admission ticket, you gain entrance to the zoo along with the Sky Safari cable car, which gives you the chance to look down into the animal enclosures and enjoy sweeping views of Sydney Harbour Bridge and the city skyline. Check the schedule for daily keeper presentations, or book an animal encounter or guided tour (own expense) for a more in-depth experience."
        case .walkTour: return "Explore Sydney’s sights with your friendly and knowledgeable I’m Free Tours Sydney local tour guide. Experience the culture and lifestyle as we delve into the history, stories and secrets of Australia’s most popular city on our daily Sydney Free Tours. Rain, Hail or Shine, I’m Free Tours walk EVERY DAY. No need to book, just turn up and look for your local guide in a bright green T-shirt."
        case .bondi: return "Experience the sun, sand and surf at Australia’s most iconic beach, with this 1.5-hour walking tour of Bondi Beach. Learn about the area’s Aboriginal heritage, see where the famous ‘Bondi Rescue’ TV show is filmed and learn how Bondi Beach became a hotspot for tourists, celebrities and surfers. Along the way, admire the Bondi Aboriginal rock art sites; pose for photos by the Bondi Pavilion and take a peek at celebrity residences located nearby."
        }
    }
    
    var otherDetails: String {
        return ""
    }
    
    var poster: UIImage {
        switch self {
        case .blueMt: return #imageLiteral(resourceName: "blueMt")
        case .bondi: return #imageLiteral(resourceName: "bondi")
        case .taronga: return #imageLiteral(resourceName: "taronga")
        case .walkTour: return #imageLiteral(resourceName: "walkTour")
        }
    }
    
}

/**
 Watch type enum containing the overview and the posted of the watchTypes
 */
enum WatchType: String, AnswerType {
    case christopherRobin = "Christopher Robin"
    case crazyRichAsian = "Crazy Rich Asians"
    case missionImpossible = "Mission Impossible: Fallout"
    case slenderMan = "Slender Man"
    
    var overview: String {
        switch self {
            case .christopherRobin: return "Christopher Robin -- now a family man living in London -- receives a surprise visit from his old childhood pal, Winnie-the-Pooh. With Christopher's help, Pooh embarks on a journey to find his friends -- Tigger, Eeyore, Owl, Piglet, Rabbit, Kanga and Roo. Once reunited, the lovable bear and the gang travel to the big city to help Christopher rediscover the joy of life."
            case .crazyRichAsian: return "Rachel Chu is happy to accompany her longtime boyfriend, Nick, to his best friend's wedding in Singapore. She's also surprised to learn that Nick's family is extremely wealthy and he's considered one of the country's most eligible bachelors. Thrust into the spotlight, Rachel must now contend with jealous socialites, quirky relatives and something far, far worse -- Nick's disapproving mother."
            case .missionImpossible: return "Ethan Hunt and the IMF team join forces with CIA assassin August Walker to prevent a disaster of epic proportions. Arms dealer John Lark and a group of terrorists known as the Apostles plan to use three plutonium cores for a simultaneous nuclear attack on the Vatican, Jerusalem and Mecca, Saudi Arabia. When the weapons go missing, Ethan and his crew find themselves in a desperate race against time to prevent them from falling into the wrong hands."
            case .slenderMan: return "Small-town best friends Hallie, Chloe, Wren and Katie go online to try and conjure up the Slender Man -- a tall, thin, horrifying figure whose face has no discernible features. Two weeks later, Katie mysteriously disappears during a class trip to a historic graveyard. Determined to find her, the girls soon suspect that the legend of the Slender Man may be all too real."
        }
    }
    
    var otherDetails: String {
        return ""
    }
    
    var poster: UIImage {
        switch self {
            case .crazyRichAsian: return #imageLiteral(resourceName: "crazyRichAsian")
            case .christopherRobin: return #imageLiteral(resourceName: "christopherRobin")
            case .slenderMan: return #imageLiteral(resourceName: "slenderMan")
            case .missionImpossible: return #imageLiteral(resourceName: "missionImpossible")
        }
    }
}

/**
 Structs model for the details used in the detail's class
 */
struct DineDetails {
    let detailsType: DineType
    let address: String
    let phone: String
    let email: String
    let website: String
}

struct ExploreDetails {
    let detailsType: ExploreType
    let address: String
    let phone: String
    let email: String
    let website: String
}

struct WatchDetails {
    let detailsType: WatchType
    let release: String
    let length: String
    let genre: String
    let distributor: String
    let director: String
    let cast: String
    let rating: String
}



/**
 Details class containing a few information from the answer type.
 Data is used to populate the information section in the result's page.
 */
class Details {
    //Dummy list of DineDetails
    static var detailsDictionary: [String: Any] {
        return ["makan":dineDetail1, "BNB":dineDetail2, "pyrmont":dineDetail3, "appBar":dineDetail4,
                "christopherRobin":watchDetail1, "crazyRichAsian":watchDetail2, "missionImpossible":watchDetail3, "slenderMan":watchDetail4,
                "blueMt":exploreDetail1, "bondi":exploreDetail2, "taronga":exploreDetail3, "walkTour":exploreDetail4]
    }
    
    static let dineDetail1 = DineDetails(detailsType: DineType.makan,
                                         address: "580 George St Sydney New South Wales 2000 Sydney",
                                         phone: "(02) 9262 7771",
                                         email: " info@alicesmakan.com.au",
                                         website: "alicesmakan.com.au")
    
    static let dineDetail2 = DineDetails(detailsType: DineType.BNB,
                                         address: "Shop 4B, 76 Campbell Parade, Bondi Beach, Sydney",
                                         phone: "02 8317 4889",
                                         email: "contact us on facebook",
                                         website: "www.facebook.com/berrybeansbondi/")
    
    static let dineDetail3 = DineDetails(detailsType: DineType.pyrmont,
                                         address: "96 Union St | Pyrmont, Sydney, New South Wales 2009, Australia",
                                         phone: "+ 61 2 9660 6996",
                                         email: "bookings@pyrmontbridgehotel.com.au",
                                         website: "www.pyrmontbridgehotel.com/")
    
    static let dineDetail4 = DineDetails(detailsType: DineType.appBar,
                                         address: "Lower Ground, 100 George Street, The Rocks, NSW, 2000",
                                         phone: "(02) 9247 1920",
                                         email: "info@appetito.com.au",
                                         website: "www.100georgestreet.com.au/appetito")
    
    //////////////////////////////////////////////////////////////////////////////////////////////////
    
    static let exploreDetail1 = ExploreDetails(detailsType: ExploreType.blueMt,
                                               address: "Corner Violet Street & Cliff Drive Katoomba NSW 2780 Australia",
                                               phone: "1300 SKYWAY or +61 2 4780 0200",
                                               email: "info@scenicworld.com.au",
                                               website: "www.scenicworld.com.au/")
    
    static let exploreDetail2 = ExploreDetails(detailsType: ExploreType.bondi,
                                               address: "Arden Street | Coogee Beach, Sydney, New South Wales, Australia",
                                               phone: "+61 406 333 665",
                                               email: "mail@bonditocoogeewalk.com",
                                               website: "www.bonditocoogeewalk.com")
    
    static let exploreDetail3 = ExploreDetails(detailsType: ExploreType.taronga,
                                               address: "Bradleys Head Rd, Mosman NSW 2088",
                                               phone: "(02) 9969 2777",
                                               email: "tz@zoo.nsw.gov.au",
                                               website: "taronga.org.au")
    
    static let exploreDetail4 = ExploreDetails(detailsType: ExploreType.walkTour,
                                               address: "Sydney Town Hall 483 George St | Town Hall Square, Sydney, New South Wales 2000, Australia",
                                               phone: "+61 405 515 654",
                                               email: "info@imfree.com.au",
                                               website: "www.imfree.com.au/sydney/")
    
    //////////////////////////////////////////////////////////////////////////////////////////////////
    
    static let watchDetail1 = WatchDetails(detailsType: WatchType.christopherRobin,
                                           release: "Release:   13/09/2018", length: "Length:   104 Mins", genre: "Genre:   Fantasy Comedy / Drama",
                                           distributor: "Distributor:   Walt Disney Studios", director: "Director:   Marc Forster",
                                           cast: "Cast:   Ewan McGregor, Hayley Atwell, Bronte Carmichael",
                                           rating: "Rating:   These films are for general viewing. However, G does not conclusively  mean a children's film because many of these  productions contain  content that would be of no interest to children. The content is very mild. (Very mild themes)")
    
    static let watchDetail2 = WatchDetails(detailsType: WatchType.crazyRichAsian,
                                           release: "Release:   30/08/2018", length: "Length:   120 Mins", genre: "Genre:   Romantic Comedy",
                                           distributor: "Distributor:   Roadshow Distribution", director: "Director:   Jon Chu",
                                           cast: "Cast:   Contance Wu, Michelle Weoh, Henry Golding",
                                           rating: "Rating:   Parental guidance recommended. These films contain material that a parent might need to explain to younger children. The content is mild. (Mild themes and coarse language)")
    
    static let watchDetail3 = WatchDetails(detailsType: WatchType.missionImpossible,
                                           release: "Release:   02/08/2018", length: "Length:   147 Mins", genre: "Genre:   Action",
                                           distributor: "Distributor:   Paramount Pictures", director: "Director:   Christopher McQuarrie",
                                           cast: "Cast:   Tom Cruise, Henry Cavill, Simon Pegg, Rebecca Ferguson",
                                           rating: "Rating:   Recommended for mature audience. These films contain material that requires a mature perspective. The content is moderate (Action violence and coarse language)")
    
    static let watchDetail4 = WatchDetails(detailsType: WatchType.slenderMan,
                                           release: "Release:   23/08/2018", length: "Length:   93 Mins", genre: "Genre:   Thriller / Horror",
                                           distributor: "Distributor:   Sony Pictures Releasing", director: "Director:   Sylvain White",
                                           cast: "Cast:   Joey King, Julia Goldani Telles, Jaz Sinclair, Annalise Basso, Javier Botet",
                                           rating: "Rating:   Recommended for mature audience. These films contain material that requires a mature perspective. The content is moderate (Horror themes and coarse language)")
    
}

/**
 Question class containing static properties for Question's page. App implements dynamic answers so user
 can add additional answers below. However you can only choose from the 4 cases in each answer type enum
 if you plan to add a question.
 We can add some more cases though from the answer types enum above to properly balance the points system.
 */
class QandA {
    static var dineQuestions = [ QuestionS(questionText: "What is your budget for two?", responseType: .single, answersToQuestion: [
                            AnswerS(answerText: "Less than $25", answerType: DineType.makan),
                            AnswerS(answerText: "$25 to $50", answerType: DineType.BNB),
                            AnswerS(answerText: "$50 to $100", answerType: DineType.pyrmont),
                            AnswerS(answerText: "$100 and above", answerType: DineType.appBar)] ),
                         QuestionS(questionText: "Where do you prefer to eat?", responseType: .single, answersToQuestion: [
                            AnswerS(answerText: "Food court", answerType: DineType.makan),
                            AnswerS(answerText: "Cafe", answerType: DineType.BNB),
                            AnswerS(answerText: "Bar", answerType: DineType.pyrmont),
                            AnswerS(answerText: "Casual Dining area", answerType: DineType.appBar)] ),
                         QuestionS(questionText: "Which cuisine would you like?", responseType: .single, answersToQuestion: [
                            AnswerS(answerText: "Asian", answerType: DineType.makan),
                            AnswerS(answerText: "just desserts", answerType: DineType.BNB),
                            AnswerS(answerText: "Australian", answerType: DineType.pyrmont),
                            AnswerS(answerText: "European", answerType: DineType.appBar)] ),
                         QuestionS(questionText: "Any non-negotiables?", responseType: .single, answersToQuestion: [
                            AnswerS(answerText: "Kid Friendly", answerType: DineType.makan),
                            AnswerS(answerText: "Healthy Food", answerType: DineType.BNB),
                            AnswerS(answerText: "Alcohol Served", answerType: DineType.pyrmont),
                            AnswerS(answerText: "Alfresco Dining", answerType: DineType.appBar)] ),
                         QuestionS(questionText: "Choose your carbs.", responseType: .single, answersToQuestion: [
                            AnswerS(answerText: "Rice", answerType: DineType.makan),
                            AnswerS(answerText: "Bread", answerType: DineType.BNB),
                            AnswerS(answerText: "Just steak", answerType: DineType.pyrmont),
                            AnswerS(answerText: "Pasta", answerType: DineType.appBar)] )]
    
    static var exploreQuestions = [ QuestionS(questionText: "What gives you an intense feeling of well-being and happiness?", responseType: .single, answersToQuestion: [
                                AnswerS(answerText: "Mountain breeze", answerType: ExploreType.blueMt),
                                AnswerS(answerText: "The smell of the ocean", answerType: ExploreType.bondi),
                                AnswerS(answerText: "Deeper connection with my city", answerType: ExploreType.walkTour),
                                AnswerS(answerText: "I love being around animals", answerType: ExploreType.taronga)] ),
                            QuestionS(questionText: "Who are you gonna share your adventure with?", responseType: .single, answersToQuestion: [
                                AnswerS(answerText: "Going with friends is fun", answerType: ExploreType.blueMt),
                                AnswerS(answerText: "Quality time with my partner", answerType: ExploreType.bondi),
                                AnswerS(answerText: "Alone time with myself", answerType: ExploreType.walkTour),
                                AnswerS(answerText: "Let my kids appreciate nature", answerType: ExploreType.taronga)] ),
                            QuestionS(questionText: "Do you have any preference in your exploration?", responseType: .single, answersToQuestion: [
                                AnswerS(answerText: "Adventure", answerType: ExploreType.blueMt),
                                AnswerS(answerText: "Relaxation", answerType: ExploreType.bondi),
                                AnswerS(answerText: "Educational", answerType: ExploreType.walkTour),
                                AnswerS(answerText: "Entertainment", answerType: ExploreType.taronga)] ),
                            QuestionS(questionText: "How much would you want to spend (budget) ?", responseType: .single, answersToQuestion: [
                                AnswerS(answerText: "Less than $20", answerType: ExploreType.walkTour),
                                AnswerS(answerText: "20 - 40", answerType: ExploreType.taronga),
                                AnswerS(answerText: "50 - 100", answerType: ExploreType.bondi),
                                AnswerS(answerText: "I don't mind spending a $150 and up", answerType: ExploreType.blueMt)] ),
                            QuestionS(questionText: "How much time would you spend on a trip?", responseType: .single, answersToQuestion: [
                                AnswerS(answerText: "I have the whole day", answerType: ExploreType.blueMt),
                                AnswerS(answerText: "I can only squeeze an hour or 2", answerType: ExploreType.bondi),
                                AnswerS(answerText: "I only have 3 to 4 hrs", answerType: ExploreType.walkTour),
                                AnswerS(answerText: "I can spare half of my day", answerType: ExploreType.taronga)] )]
    
    static var watchQuestions = [ QuestionS(questionText: "Please choose the genre that you like.", responseType: .single, answersToQuestion: [
                            AnswerS(answerText: "Fantasy Comedy-Drama", answerType: WatchType.christopherRobin),
                            AnswerS(answerText: "Romantic Comedy", answerType: WatchType.crazyRichAsian),
                            AnswerS(answerText: "Action - Adventure", answerType: WatchType.missionImpossible),
                            AnswerS(answerText: "Horror", answerType: WatchType.slenderMan)] ),
                          QuestionS(questionText: "Who are you gonna watch a movie with?", responseType: .single, answersToQuestion: [
                            AnswerS(answerText: "I have my kids with me", answerType: WatchType.christopherRobin),
                            AnswerS(answerText: "With my Partner", answerType: WatchType.crazyRichAsian),
                            AnswerS(answerText: "Just myself", answerType: WatchType.missionImpossible),
                            AnswerS(answerText: "I want to tag some friends with me", answerType: WatchType.slenderMan)] ),
                          QuestionS(questionText: "How are you feeling today?", responseType: .single, answersToQuestion: [
                            AnswerS(answerText: "I'm feeling young", answerType: WatchType.christopherRobin),
                            AnswerS(answerText: "I want to just chill", answerType: WatchType.crazyRichAsian),
                            AnswerS(answerText: "Give me some adventure", answerType: WatchType.missionImpossible),
                            AnswerS(answerText: "I'm Brave", answerType: WatchType.slenderMan)] ),
                          QuestionS(questionText: "Origin of the story", responseType: .single, answersToQuestion: [
                            AnswerS(answerText: "Short story collection", answerType: WatchType.christopherRobin),
                            AnswerS(answerText: "Base on Novel", answerType: WatchType.crazyRichAsian),
                            AnswerS(answerText: "70's Television Series", answerType: WatchType.missionImpossible),
                            AnswerS(answerText: "Born from the internet", answerType: WatchType.slenderMan)] ),
                          QuestionS(questionText: "Which setting would you like?", responseType: .single, answersToQuestion: [
                            AnswerS(answerText: "Country-side", answerType: WatchType.christopherRobin),
                            AnswerS(answerText: "Asia", answerType: WatchType.crazyRichAsian),
                            AnswerS(answerText: "All over the world", answerType: WatchType.missionImpossible),
                            AnswerS(answerText: "Small town", answerType: WatchType.slenderMan)] )]
}



