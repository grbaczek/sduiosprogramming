//
//  DrawView.swift
//  TouchTracker
//
//  Created by Emil Nielsen on 26/09/2020.
//  Copyright © 2020 Emil Nielsen. All rights reserved.
//

import UIKit

class DrawView: UIView {

    private var currentLines = [NSValue: Line]()
    private var finishedLines = [Line]()

    @IBInspectable var finishedLineColor: UIColor = UIColor.red {
        didSet {
            setNeedsDisplay()
        }
    }

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

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(DrawView.doubleTap(_:)))
        doubleTapRecognizer.numberOfTapsRequired = 2
        doubleTapRecognizer.delaysTouchesBegan = true
        addGestureRecognizer(doubleTapRecognizer)
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
        // Draw finished lines in red
        finishedLineColor.setStroke()
        for line in finishedLines {
            stroke(line)
        }
        // Draw current lines in green
        currentLineColor.setStroke()
        for (_, line) in currentLines {
            stroke(line)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let newLine = Line(begin: location, end: location)
            let key = NSValue(nonretainedObject: touch)
            currentLines[key] = newLine
        }
        setNeedsDisplay()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let key = NSValue(nonretainedObject: touch)
            currentLines[key]?.end = touch.location(in: self)
        }
        setNeedsDisplay()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let key = NSValue(nonretainedObject: touch)
            if var line = currentLines[key] {
                line.end = touch.location(in: self)
                finishedLines.append(line)
                currentLines.removeValue(forKey: key)
            }
        }
        setNeedsDisplay()
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentLines.removeAll()
        setNeedsDisplay()
    }

    @objc func doubleTap(_ gestureRecognizer: UIGestureRecognizer) {
        currentLines.removeAll()
        finishedLines.removeAll()
        setNeedsDisplay()
    }
}

