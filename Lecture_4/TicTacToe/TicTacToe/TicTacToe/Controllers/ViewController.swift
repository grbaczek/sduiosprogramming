//
//  ViewController.swift
//  TicTacToe
//
//  Created by Emil Nielsen on 16/09/2020.
//  Copyright © 2020 Emil Nielsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var fieldChooser = FieldChooser(numberOfFields: 9)
    private var scoreManager = ScoreManager()
    private var cross = #imageLiteral(resourceName: "cross")
    private var circle = #imageLiteral(resourceName: "nought")
    private var player = 1

    @IBOutlet private weak var labelCross: UILabel!
    @IBOutlet private weak var labelCircle: UILabel!
    @IBOutlet private weak var labelDraw: UILabel!

    @IBAction private func fieldPressed(_ sender: UIButton) {
        if fieldChooser.chooseField(index: sender.tag) {
            if player == 1 {
                sender.setBackgroundImage(cross, for: .normal)
                fieldChooser.fields[sender.tag].property = Token.cross
                player = 2
            } else if player == 2 {
                sender.setBackgroundImage(circle, for: .normal)
                fieldChooser.fields[sender.tag].property = Token.circle
                player = 1
            }
            if fieldChooser.isGameOver() {
                showResult(fieldChooser.result)
            }
        }
    }

    private func showResult(_ result: String) {
        scoreManager.registerScore(for: result)
        if let score = scoreManager.scores[result] {
            switch result {
            case "Cross":
                labelCross.text = "Cross: \(score)"
            case "Circle":
                labelCircle.text = "Circle: \(score)"
            default:
                labelDraw.text = "Draw: \(score)"
            }
        }
        let alertController = UIAlertController(title: result, message: "Press OK to play again", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            self.resetGameState()
        }))
        present(alertController, animated: true, completion: nil)
    }

    private func resetGameState() {
        fieldChooser.resetGameState()
        for view in self.view.subviews as [UIView] {
            if let btn = view as? UIButton {
                btn.setBackgroundImage(nil, for: .normal)
            }
        }
    }

}

