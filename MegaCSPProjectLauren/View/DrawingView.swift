//
//  DrawingView.swift
//  DrawingProjectLauren
//
//  Created by Davis, Lauren on 11/1/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

//custom subclass of type UIView
public class DrawingView: UIView
{

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    public override func draw(_ rect: CGRect) -> Void
     {
        createStickFigure().stroke()
        //drawTurtle()
        drawHouse().stroke()
        //stroke calls the addLine methods in the function
    }
    
    private func createStickFigure() -> UIBezierPath
    {
        let figure : UIBezierPath = UIBezierPath()
        
        UIColor.magenta.setStroke()
        figure.lineWidth = 5.0
        
        figure.addArc(withCenter: CGPoint(x: 200, y: 200),
                            radius: CGFloat(20),
                            startAngle: CGFloat(0),
                            endAngle: CGFloat(2) * CGFloat.pi,
                            clockwise: true) //parameters
        
        figure.move(to: CGPoint(x: 200, y: 220))
        figure.addLine(to: CGPoint(x: 200, y: 270))
        figure.move(to: CGPoint(x: 180, y: 240))
        figure.addLine(to: CGPoint(x: 220, y: 240))
        figure.move(to: CGPoint(x: 200, y: 270))
        figure.addLine(to: CGPoint(x: 180, y: 300))
        figure.move(to: CGPoint(x: 200, y: 270))
        figure.addLine(to: CGPoint(x: 220, y: 300))
        
        return figure
    }
    
    private func drawHouse() -> UIBezierPath
    {
        let myHouse : UIBezierPath = UIBezierPath()
        UIColor.blue.setStroke()
        myHouse.lineWidth = 3.0
        
        myHouse.move(to : CGPoint(x: 50, y: 250))
        myHouse.addLine(to: CGPoint(x: 50, y: 300))
        //house left vertical line
        
        myHouse.move(to: CGPoint(x: 50, y: 250))
        myHouse.addLine(to: CGPoint(x: 100, y: 250))
        //house top horizontal line
        
        myHouse.move(to: CGPoint(x: 100, y: 250))
        myHouse.addLine(to: CGPoint(x: 100, y: 300))
        //house right vertical line
        
        myHouse.move(to: CGPoint(x: 50, y: 300))
        myHouse.addLine(to: CGPoint(x: 100, y: 300))
        //house bottom horizontal line
        
        myHouse.move(to: CGPoint(x: 35, y: 250))
        myHouse.addLine(to: CGPoint(x: 115, y: 250))
        //roof bottom line
        
        myHouse.move(to: CGPoint(x: 75, y: 205))
        myHouse.addLine(to: CGPoint(x: 35, y: 250))
        //roof left side
        
        myHouse.move(to: CGPoint(x: 75, y: 205))
        myHouse.addLine(to: CGPoint(x: 115, y: 250))
        //roof right side
        
        return myHouse
        
    }
    
    
    
    private func drawTurtle() -> Void
    {
        let logo = UIBezierPath()
        UIColor.white.setFill()
        logo.move(to: CGPoint(x: 50, y: 250))
        logo.addLine(to: CGPoint(x: 200, y: 300))
        logo.addLine(to: CGPoint(x: 50, y: 350))
        logo.close()
        logo.fill()
        
    }

}
