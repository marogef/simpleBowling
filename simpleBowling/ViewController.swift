//
//  ViewController.swift
//  project_4
//
//  Created by . on 3/27/16.
//  Copyright (c) 2016 Faras. All rights reserved.
//

import UIKit
import QuartzCore
import AVFoundation

class ViewController: UIViewController
{
    //declare outlets

    @IBOutlet weak var wood: UIImageView!
    @IBOutlet weak var ball: UIImageView!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var scoreValue: UILabel!
    @IBOutlet weak var replay: UILabel!
    @IBOutlet weak var replayYes: UIButton!
    @IBOutlet weak var replayNo: UIButton!
    @IBOutlet weak var youWin: UILabel!
    @IBOutlet weak var youLose: UILabel!
    @IBOutlet weak var wins: UILabel!
    @IBOutlet weak var lose: UILabel!
    @IBOutlet weak var win: UILabel!
    @IBOutlet weak var loss: UILabel!
    
    @IBOutlet weak var scoring: UIImageView!

    @IBOutlet weak var first: UIImageView!
    
    @IBOutlet weak var second: UIImageView!
    
    @IBOutlet weak var third: UIImageView!
    
    @IBOutlet weak var seventh: UIImageView!
    @IBOutlet weak var sixth: UIImageView!
    @IBOutlet weak var fifth: UIImageView!
    @IBOutlet weak var fourth: UIImageView!
    
    @IBOutlet weak var twoCollision: UIImageView!
    
    @IBOutlet weak var fourCollision: UIImageView!
    
    @IBOutlet weak var oneCollision: UIImageView!
    @IBOutlet weak var threeCollision: UIImageView!
    @IBOutlet weak var begin: UIButton!
    var randomNumber: Int = 0
    var randomNumber2: Int = 0
    var imageView1: UIImageView?
    var imageView2: UIImageView?
    
    var moveRightB : Bool = false
    var MoveLeftB : Bool = false
    var steer : CGFloat = 0
    var firstTouch : CGPoint = CGPoint()
    var lastTouch : CGPoint = CGPoint ()
    var select: Bool = true
    var scoreOne : Int = 0
    var scoreTwo : Int = 0
    var count : Int = 0
    var count2 : Int = 0
    var scoreTwoTotal : Int = 0

    var i : Int = 0
   
    @IBOutlet weak var computerBall: UIImageView!
    @IBOutlet weak var computerScore: UILabel!
    
    @IBOutlet weak var computerScoreValue: UILabel!
    @IBOutlet weak var computerWins: UILabel!
    @IBOutlet weak var computerButton: UIButton!
    @IBOutlet weak var score2: UIImageView!
    var timer : NSTimer?
    var seconds:Int = 10;
    var scoreTotal : Int = 0
    var winScore : Int = 0
    var loseScore : Int = 0
    var updater: CADisplayLink!
    var frameInt : Int!
    var updater2: CADisplayLink!
    @IBOutlet weak var reset: UIButton!

    @IBOutlet weak var prepare: UIButton!
    //create gameloop
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
          //showResults()
       let updater = CADisplayLink(target: self, selector: Selector("gameLoop"))
        updater.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
        assign()
        updater.frameInterval = 1
        

        
    }
    
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()

    }
 
    @IBAction func start(sender: AnyObject)
    {
     
        
//call the functions in the start button
        
    gameLoop()
    playerScore()
    computerScoreCal()
    winnerLoser()
             updater?.removeFromRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)

      putBallBack()
      removeUpdater()
 
      }
 

 //create the gameloop
   func gameLoop()
    {
      
    
        if (!CGRectIntersectsRect(ball.frame, first.frame))
        {
            if (ball.center.y > 495)
             {
                        ball.center = CGPointMake(ball.center.x, 0)
            }
             else
             {
                  ball.center = CGPointMake(ball.center.x, ball.center.y + 50)
            }
        }
    
        else if  (CGRectIntersectsRect(ball.frame, first.frame))
              {
                    scoring.hidden = false
                    ball.hidden = true
               }

        }
    //determine the player score randomly
    func playerScore()
    {
        
    randomNumber = Int((arc4random() % 7) + 1)
            if (randomNumber == 1)
            {
                scoreOne = scoreOne + 6
                
                
            }
                
            else if (randomNumber == 2)
            {
                scoreOne = scoreOne + 5
                
                
                
            }
                
            else if (randomNumber == 3)
            {
                scoreOne = scoreOne + 4
                
                
                
            }
                
            else if (randomNumber == 4)
            {
                scoreOne = scoreOne + 3
            }
                
            else if (randomNumber == 5)
            {
                scoreOne = scoreOne + 2
                
            }
                
            else if (randomNumber == 6)
            {
                scoreOne = scoreOne + 1
                
                
                
            }
                
            else if (randomNumber == 7)
            {
                scoreOne = scoreOne + 0
                //scoreValue.text = String(scoreOne)
                
            }
            scoreValue.text = String(scoreOne)
        
    }
    
 func removeUpdater()
    {
        if (updater != nil)
        {
            updater.removeFromRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
        }
    }
    

    
    func computerScoreCal()
    {
             randomNumber2 = Int((arc4random() % 7) + 1)
        
            if (randomNumber2 == 1)
                
            {
                
                scoreTwo = scoreTwo + 6
            }
                
                
                
            else if (randomNumber == 2)
                
            {
                scoreTwo = scoreTwo + 5
                
            }
                
                
                
            else if (randomNumber == 3)
                
            {
                scoreTwo = scoreTwo + 4
                
            }
                
            else if (randomNumber == 4)
                
            {
                scoreTwo = scoreTwo + 3
            }
                
            else if (randomNumber == 5)
                
            {
                
                scoreTwo = scoreTwo + 2
                
            }
                
            else if (randomNumber == 6)
                
            {
                scoreTwo = scoreTwo + 1
                
            }
                
            else if (randomNumber == 7)
                
            {
                scoreTwo = scoreTwo + 0
            }
          computerScoreValue.text = String(scoreTwo)
        
    }
    

    func assign(){
          ball.center = CGPointMake(-289, 54)
    }
    //display the correct messages, buttons based on the random scores
    func winnerLoser(){
        
        if (scoreTwo >=  (30) )
        {
            youLose.hidden = false
            computerWins.hidden = false
            replay.hidden = false
            loss.hidden = false
            reset.hidden = false
            winScore = winScore + 1
            loss.text = String(winScore)
          
            

        }

        else if ( scoreOne >= (30)  )
        {
            youWin.hidden = false
            replay.hidden = false
            reset.hidden = false
            loseScore = loseScore + 1
            win.hidden = false
            win.text = String(loseScore)
         
        }
    }
    
    func putBallBack(){
        
         ball.center = CGPointMake(156, 53)
        ball.hidden = false
        scoring.hidden = false
        
    }
    
    
//create function to reset the ball
    @IBAction func resetball(sender: AnyObject)
    {
  
        updater?.paused
        updater?.removeFromRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
        
            youWin.hidden = true
            youLose.hidden = true
            computerWins.hidden = true
            replay.hidden = true
            scoreOne = 0
            scoreTwo = 0
            
            
            ball.hidden = false
            reset.hidden = true
            ball.center = CGPointMake(-289, 54)
            scoring.hidden = true
          
        }
    
    //create function to prepare the ball
    @IBAction func prepareBall(sender: AnyObject)
    {
      
    
        updater?.removeFromRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
        
        
        ball.hidden = false
        ball.center = CGPointMake(-289, 54)
       
        scoring.hidden = true
    
    }
    

    
    
    
}
