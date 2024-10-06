//
//  ViewController.swift
//  MemeMaker
//
//  Created by Arda Efe Özcan on 2.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    // MARK: - Instance Properties
    let topChoices = [
        CaptionOption(emoji: "🧠", caption: "My brain"),
        CaptionOption(emoji: "🏗️", caption: "My project"),
        CaptionOption(emoji: "💤", caption: "My sleep")
    ]

    let bottomChoices = [
        CaptionOption(emoji: "🧑🏼‍💻", caption: "New code"),
        CaptionOption(emoji: "💡", caption: "New idea"),
        CaptionOption(emoji: "📚", caption: "Homework")
    ]
    
    // MARK: - VDL

    override func viewDidLoad() {
        super.viewDidLoad()
        
        topSegmentedControl.removeAllSegments()
        for choice in topChoices {
            topSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        topSegmentedControl.selectedSegmentIndex = 0
        
        
        bottomSegmentedControl.removeAllSegments()
        for choice in bottomChoices {
            bottomSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        bottomSegmentedControl.selectedSegmentIndex = 0
        
        updateCaption()
    }

    // MARK: - IB Actions
    

    
    @IBAction func segmentedControlChanged( sender: Any){
        updateCaption()
    }
    
    
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
    }
    
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
    
    
    
    
    
    
    //MARK: - Instance Methods
    func updateCaption() {
        let topIndex = topSegmentedControl.selectedSegmentIndex
        topCaptionLabel.text = topChoices[topIndex].caption
        
        let bottomIndex = bottomSegmentedControl.selectedSegmentIndex
        bottomCaptionLabel.text = bottomChoices[bottomIndex].caption
        
    }

}

