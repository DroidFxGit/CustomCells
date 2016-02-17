//
//  CustomTableViewCell.swift
//  CustomCells
//
//  Created by Carlos Vázquez on 09/02/16.
//  Copyright © 2016 Globant. All rights reserved.
//

import UIKit
import CKCircleMenuView

class CustomTableViewCell: UITableViewCell, CKCircleMenuDelegate {

    @IBOutlet weak var octoCatButton: UIButton!
    
    var circleMenuView: CKCircleMenuView!
    var imageArray = [UIImage]()
    
    //configuration menu variables
    let direction = CircleMenuDirectionUp;
    let delay = 0.0;
    let shadow = 0;
    let radius = 50.0;
    let angle = 180.0;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageArray.append(UIImage(named: "trash_icon")!)
        imageArray.append(UIImage(named: "trash_icon")!)
        imageArray.append(UIImage(named: "trash_icon")!)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func touchUpInside(sender: AnyObject) {
        
        if self.circleMenuView != nil {
            circleMenuView.closeMenu()
            self.circleMenuView = nil
        }
        else {
            
            let menuOrigin: CGPoint = CGPointMake(octoCatButton.frame.origin.x, octoCatButton.frame.origin.y)
            
            
            var tOptions = [String : AnyObject]()
            tOptions[CIRCLE_MENU_OPENING_DELAY] = self.delay
            tOptions[CIRCLE_MENU_MAX_ANGLE] = self.angle
            tOptions[CIRCLE_MENU_RADIUS] = self.radius
            tOptions[CIRCLE_MENU_DIRECTION] = self.direction as? AnyObject
            tOptions[CIRCLE_MENU_BUTTON_BACKGROUND_NORMAL] = UIColor(red: 0.0, green: 0.25, blue: 0.5, alpha: 1.0)
            tOptions[CIRCLE_MENU_BUTTON_BACKGROUND_ACTIVE] = UIColor(red: 0.25, green: 0.5, blue: 0.75, alpha: 1.0)
            tOptions[CIRCLE_MENU_BUTTON_BORDER] = UIColor.whiteColor()
            tOptions[CIRCLE_MENU_DEPTH] = self.shadow
            tOptions[CIRCLE_MENU_BUTTON_RADIUS] = "15.0"
            tOptions[CIRCLE_MENU_BUTTON_BORDER_WIDTH] = "2.5"
            tOptions[CIRCLE_MENU_TAP_MODE] = true
            
            let tMenu  = CKCircleMenuView.init(atOrigin: menuOrigin, usingOptions: tOptions, withImageArray: self.imageArray)
            contentView.addSubview(tMenu)
//            octoCatButton.addSubview(tMenu)
            tMenu.openMenu()
            tMenu.delegate = self
            self.circleMenuView = tMenu
        }
        
    }
    
    func addCircleMenuToButton() {
    }
    
    
    //MARK: - CKCircleMenuDelegate
    
    func circleMenuActivatedButtonWithIndex(anIndex: Int32) {
        print("circleMenuItem clicked at Index: ", anIndex)
    }
    
    func circleMenuOpened() {
        print("circleMenu opened...")
    }
    
    func circleMenuClosed() {
        print("circleMenu closed...")
    }
    
}
