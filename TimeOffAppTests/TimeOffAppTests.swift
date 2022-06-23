//
//  TimeOffAppTests.swift
//  TimeOffAppTests
//
//  Created by Thaynara da Silva Andrade on 02/06/22.
//

import XCTest
@testable import TimeOffApp

class TimeOffAppTests: XCTestCase {

    override func setUpWithError() throws {
        ActivitiesModel.myActivities = []
    }

    override func tearDownWithError() throws {
        ActivitiesModel.myActivities = []
    }

    func testAddActivitiesShouldIncreaseMyActivitiesCount() {
        let activity = Activity(name: "Teste", time: "22-03-2022", duration: 120)
        ActivitiesModel.addActivity(activity)
        XCTAssertEqual(ActivitiesModel.myActivities.count, 1)
    }
    
    func testSortActivitesShouldReturnActivity2First() {
        let activity = Activity(name: "Teste", time: "22-03-2022", duration: 120)
        let activity2 = Activity(name: "Teste 2", time: "21-03-2022", duration: 120)
        ActivitiesModel.addActivity(activity)
        ActivitiesModel.addActivity(activity2)
        ActivitiesModel.sortActivities()
        let output = ActivitiesModel.myActivities.first
        XCTAssertEqual(output, activity2)
    }
    
    func testTimeFormatShouldReturn14h55() {
        let date = Date()
        guard let addedDate = Calendar.current.date(bySetting: .hour, value: 14, of: date),
              let finalDate = Calendar.current.date(bySetting: .minute, value: 55, of: addedDate) else {
                  XCTFail()
                  return
              }
        let output = ActivitiesModel.timeFormat(finalDate)
        XCTAssertEqual(output, "14:55")
    }

}
