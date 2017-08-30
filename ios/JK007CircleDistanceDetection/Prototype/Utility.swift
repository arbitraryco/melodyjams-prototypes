//
//  Int+Random.swift
//  Prototype
//
//  Created by Jamie Kosoy on 8/30/17.
//  Copyright © 2017 Melody Jams. All rights reserved.
//

import UIKit

// https://stackoverflow.com/a/29586498
func randomNumber<T : SignedInteger>(inRange range: ClosedRange<T> = 1...6) -> T {
    let length = (range.upperBound - range.lowerBound + 1).toIntMax()
    let value = arc4random().toIntMax() % length + range.lowerBound.toIntMax()
    return T(value)
}

func distance(_ p1: CGPoint, _ p2: CGPoint) -> CGFloat {
    let xDist = (p2.x - p1.x);
    let yDist = (p2.y - p1.y);
    return sqrt((xDist * xDist) + (yDist * yDist));
}
