//
//  ViewController.swift
//  CoreDataExercise
//
//  Created by Emil Nielsen on 31/10/2020.
//  Copyright © 2020 Emil Nielsen. All rights reserved.
//

import UIKit
import CoreData

class EmojiViewController: UIViewController {

    private var emojiManager: EmojiManager!
    private var emojis: [NSManagedObject]?

    @IBOutlet weak var emojiTableView: UITableView!

    override func viewWillAppear(_ animated: Bool) {
        emojiManager = EmojiManager()
        emojis = emojiManager.getAllEmojis()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        emojiTableView.dataSource = self
        emojiTableView.delegate = self
    }

    @IBAction func add(_ sender: Any) {
        let alert = UIAlertController(title: "Make a new Emoiji", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { (textField) in textField.placeholder = "Emoji" }
        alert.addTextField { (textField) in textField.placeholder = "Title" }
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default))
        alert.addAction(UIAlertAction(title: "Add", style: UIAlertAction.Style.default, handler: { _ in
            let emoji = self.emojiManager.addEmoji(emoji: alert.textFields?[0].text, title: alert.textFields?[1].text)
            self.emojis?.append(emoji)
            self.emojiTableView.insertRows(at: [IndexPath.init(row: self.emojis!.count - 1, section: 0)], with: .automatic)
        }))
        self.present(alert, animated: true)
    }
}

extension EmojiViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = emojis?.count {
            return count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emoji = emojis?[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath) as! EmojiTableViewCell
        cell.emojiLabel.text = emoji?.value(forKey: "emoji") as? String
        cell.titleLabel.text = emoji?.value(forKey: "title") as? String
        return cell
    }
}

extension EmojiViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emoji = emojis?[indexPath.item]
        let alert = UIAlertController(title: emoji?.value(forKey: "emoji") as? String,
                                      message: emoji?.value(forKey: "title") as? String, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let emoji = emojis?[indexPath.row] {
                self.emojiManager.deleteEmoij(emoji: emoji)
                self.emojis?.remove(at: indexPath.row)
                self.emojiTableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }
}
