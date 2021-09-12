//
//  DrawView.swift
//  TouchTracker
//
//  Created by Emil Nielsen on 26/09/2020.
//  Copyright © 2020 Emil Nielsen. All rights reserved.
//

import UIKit

class DrawView: UIView {

    private var currentLine: Line?

    @IBInspectable var currentLineColor: UIColor = UIColor.green {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var lineThickness: CGFloat = 10.0 {
        didSet {
            setNeedsDisplay()
        }
    }

    func stroke(_ line: Line) {
        let path = UIBezierPath()
        path.lineWidth = lineThickness
        path.lineCapStyle = .square

        path.move(to: line.begin)
        path.addLine(to: line.end)
        path.stroke()
    }

    override func draw(_ rect: CGRect) {
        currentLineColor.setStroke()
        if let line = currentLine {
            stroke(line)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let newLine = Line(begin: location, end: location)
            currentLine = newLine
            setNeedsDisplay()
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            currentLine?.end = touch.location(in: self)
            setNeedsDisplay()
        }
    }

}
