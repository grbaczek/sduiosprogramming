//
//  EmojiManager.swift
//  CoreDataExercise
//
//  Created by Emil Nielsen on 31/10/2020.
//  Copyright © 2020 Emil Nielsen. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class EmojiManager {

    var appDelegate: AppDelegate
    var context: NSManagedObjectContext

    init() {
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }

    func addEmoji(emoji: String?, title: String?) -> NSManagedObject {
        let et = EmojiEntity(context: context)
        et.emoji = emoji
        et.title = title
        appDelegate.saveContext()
        return et
    }
    
    func deleteEmoij(emoji: NSManagedObject) {
        context.delete(emoji)
        appDelegate.saveContext()
    }
    
    func getAllEmojis() -> [NSManagedObject]? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "EmojiEntity")

        do {
            let results = try context.fetch(request)
            return results as? [NSManagedObject]
        } catch {
            print("failed: \(error)")
        }
        return nil
    }

}
