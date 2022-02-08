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
            let predicate = eventStore.predicateForEvents(withStart: startDate, end: endDate, calendars: nil)
            let events = eventStore.events(matching: predicate)
            completion(events)
        }
    }
}

//MARK: - Delete event from calendar by title
public func deleteEventFromCalendar(title: String, completion: @escaping (_ success: Bool) -> Void) {
    let eventStore = EKEventStore()
    eventStore.requestAccess(to: .event) { (granted, error) in
        if (granted) && (error == nil) {
            let predicate = eventStore.predicateForEvents(withStart: Date(), end: Date().addingTimeInterval(60 * 60 * 24 * 365), calendars: nil)
            let events = eventStore.events(matching: predicate)
            for event in events {
                if event.title == title {
                    do {
                        try eventStore.remove(event, span: .thisEvent)
                        completion(true)
                    } catch let error as NSError {
                        print("failed to remove event with error : \(error)")
                        completion(false)
                    }
                }
            }
        }
    }
}

//MARK: - Update event in calendar by title
public func updateEventInCalendar(title: String, description: String, startDate: Date, endDate: Date, completion: @escaping (_ success: Bool) -> Void) {
    let eventStore = EKEventStore()
    eventStore.requestAccess(to: .event) { (granted, error) in
        if (granted) && (error == nil) {
            let predicate = eventStore.predicateForEvents(withStart: Date(), end: Date().addingTimeInterval(60 * 60 * 24 * 365), calendars: nil)
            let events = eventStore.events(matching: predicate)
            for event in events {
                if event.title == title {
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
                }
            }
        }
    }
}
