//
//  File.swift
//  
//
//  Created by Rohit Saini on 10/11/21.
//

import Foundation
import EventKit

//===================================CALENDER==========================================
//MARK: - Create event in calendar
public func createEventInCalendar(title: String, description: String, startDate: Date, endDate: Date, completion: @escaping (_ success: Bool) -> Void) {
    let eventStore = EKEventStore()
    eventStore.requestAccess(to: .event) { (granted, error) in
        if (granted) && (error == nil) {
            let event = EKEvent(eventStore: eventStore)
            event.title = title
            event.startDate = startDate
            event.endDate = endDate
            event.notes = description
            event.calendar = eventStore.defaultCalendarForNewEvents
            do {
                try eventStore.save(event, span: .thisEvent)
                completion(true)
            } catch let error as NSError {
                print("failed to save event with error : \(error)")
                completion(false)
            }
        } else {
            completion(false)
        }
    }
}

//MARK: - Get events from calendar
public func getEventsFromCalendar(completion: @escaping (_ events: [EKEvent]) -> Void) {
    let eventStore = EKEventStore()
    eventStore.requestAccess(to: .event) { (granted, error) in
        if (granted) && (error == nil) {
            let startDate = Date()
            let endDate = Date().addingTimeInterval(60 * 60 * 24 * 365)
            let events = eventStore.events(matching: NSPredicate(format: "startDate >= %@ AND endDate <= %@", startDate as CVarArg, endDate as CVarArg))
            completion(events)
        }
    }
}

//MARK: - Delete event from calendar
public func deleteEventFromCalendar(event: EKEvent, completion: @escaping (_ success: Bool) -> Void) {
    let eventStore = EKEventStore()
    eventStore.requestAccess(to: .event) { (granted, error) in
        if (granted) && (error == nil) {
            do {
                try eventStore.remove(event, span: .thisEvent)
                completion(true)
            } catch let error as NSError {
                print("failed to remove event with error : \(error)")
                completion(false)
            }
        } else {
            completion(false)
        }
    }
}

//MARK: - Update event in calendar
public func updateEventInCalendar(event: EKEvent, title: String, description: String, startDate: Date, endDate: Date, completion: @escaping (_ success: Bool) -> Void) {
    let eventStore = EKEventStore()
    eventStore.requestAccess(to: .event) { (granted, error) in
        if (granted) && (error == nil) {
            event.title = title
            event.startDate = startDate
            event.endDate = endDate
            event.notes = description
            do {
                try eventStore.save(event, span: .thisEvent)
                completion(true)
            } catch let error as NSError {
                print("failed to save event with error : \(error)")
                completion(false)
            }
        } else {
            completion(false)
        }
    }
}

