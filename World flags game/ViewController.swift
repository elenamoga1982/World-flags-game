//
//  ViewController.swift
//  Project 2
//
//  Created by Elena Moga on 2023-05-22.
//

import UIKit

class ViewController: UIViewController {

    //  @IBOutlet connects code to storyboard layouts
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var nextButton: UIButton!
    
    var countries = [String]() //creates a new property that will hold an array of strings
    
    var correctAnswer = 0 // creates a new property that stores the correct answers
    
    var score = 0 // creates a new property that stores player's current score
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // next button is initially disabled up to the moment the player press an answer button that happens further to every question
        nextButton.isEnabled = false
        
        // fill countries array with the countries flags
        countries += ["Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua and Barbuda", "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Central African Republic", "Chad", "Chile", "China", "Colombia", "Comoros", "Costa Rica", "Croatia", "Cuba", "Cyprus", "Czech Republic", "Côte d'Ivoire", "Democratic Republic of Congo", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Eswatini", "Ethiopia", "Fiji", "Finland", "France", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guinea Bissau", "Guinea", "Guyana", "Haiti", "Honduras", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Niger", "Nigeria", "North Korea", "North Macedonia", "Norway", "Oman", "Pakistan", "Palau", "Palestine", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Qatar", "Republic of Congo", "Romania", "Russia", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Korea", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname", "Sweden", "Switzerland", "Syria", "Tajikistan", "Tanzania", "Thailand", "Togo", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "Uruguay", "Uzbekistan", "Vanuatu", "Vatican", "Venezuela", "Vietnam", "Yemen", "Zambia", "Zimbabwe"]
        
        askQuestion()
        
        // set a border for every of the three flags
        button1.layer.borderWidth = 7
        button2.layer.borderWidth = 7
        button3.layer.borderWidth = 7
        button4.layer.borderWidth = 7
        
        // color the border using CALayer that uses CGColor to set colors
        button1.layer.borderColor = UIColor.blue.cgColor
        button2.layer.borderColor = UIColor.blue.cgColor
        button3.layer.borderColor = UIColor.blue.cgColor
        button4.layer.borderColor = UIColor.blue.cgColor
        
    }
        
        // the function shows four random flag images on the screen; setImage() method - lets us control what picture is shown and when; UIImage(named:) - read from an array by position; for: .normal - The setImage() describes which state of the button should be changed .normal means "the standard state of the button."
        func askQuestion(action: UIAlertAction! = nil) {
            
            countries.shuffle() // shuffle the flags into the array before picking 3 of them, one for each button
            
            button1.layer.borderColor = UIColor.blue.cgColor
            button2.layer.borderColor = UIColor.blue.cgColor
            button3.layer.borderColor = UIColor.blue.cgColor
            button4.layer.borderColor = UIColor.blue.cgColor
            
            button1.isEnabled = true
            button2.isEnabled = true
            button3.isEnabled = true
            button4.isEnabled = true
            
            // the next button should be disabled up to the moment a button is tapped
            nextButton.isEnabled = false
            
            button1.setImage(UIImage(named: countries[0]), for: .normal)
            button2.setImage(UIImage(named: countries[1]), for: .normal)
            button3.setImage(UIImage(named: countries[2]), for: .normal)
            button4.setImage(UIImage(named: countries[3]), for: .normal)
            
            correctAnswer = Int.random(in: 0...3) //choose a random number for the correct answer
            
            title = "Flag of " + countries[correctAnswer].uppercased() +
            "   Total: \(score)"// uppercase the name of the country's flag you are searching for and shows it in the question
            
        }
    
        // @IBAction is a way of making storyboard layouts trigger code(declansaza codul)
        @IBAction func buttonTapped(_ sender: UIButton) {
            var title: String
            
            // Check whether the answer is correct and adjust the player's score up or down
            if sender.tag == correctAnswer { // Checks whether the answer was correct
                title = "Your answer is CORRECT"
                score += 1

            } else {
                title = "Your answer is WRONG. This is the flag of \(countries[sender.tag])"
                score -= 1
                
                if correctAnswer != sender.tag { // if the answer is wrong...
                    sender.layer.borderColor = UIColor.red.cgColor // colors the button's border red
                }
            }
            
            if button1.tag == correctAnswer { // if the button1 is the correct answer...
                button1.layer.borderColor = UIColor(red: 17/255, green: 149/255, blue: 57/255, alpha: 0.9).cgColor // colors the button's border green
            } else if button2.tag == correctAnswer { // if the button2 is the correct answer...
                button2.layer.borderColor = UIColor(red: 17/255, green: 149/255, blue: 57/255, alpha: 0.9).cgColor // colors the button's border green
            } else if button3.tag == correctAnswer { // if the button3 is the correct answer...
                button3.layer.borderColor = UIColor(red: 17/255, green: 149/255, blue: 57/255, alpha: 0.9).cgColor // colors the button's border green
            } else if button4.tag == correctAnswer { // if the button4 is the correct answer...
                button4.layer.borderColor = UIColor(red: 17/255, green: 149/255, blue: 57/255, alpha: 0.9).cgColor // colors the button's border green
            }
                
            //Show a message telling the player what his new score is
            let ac = UIAlertController(title: title, message: "DANIEL, your score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(ac, animated: true)
            
            button1.isEnabled = false
            button2.isEnabled = false
            button3.isEnabled = false
            button4.isEnabled = false
            
            
            // the next button is enabled to go further to the next question. It is enabled only now with the purpose that the player can verify the correct answer
           nextButton.isEnabled = true
        }
    
    //tapped next button shows the next flags to choose from
    @IBAction func nextButton(_ sender: UIButton) {
        askQuestion()
   }
    
}

