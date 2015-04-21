// Playground - noun: a place where people can play

import UIKit

/*
@comment
*/
var v = UIView()
v.frame = CGRectMake(0, 0, 200, 200)

/*
@comment
*/
var b1 = UIButton()
b1.setTitle("HogeButton", forState:UIControlState.Normal)
b1.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
b1.setTranslatesAutoresizingMaskIntoConstraints(false)  //codeでAuto Layoutを扱う
v.addSubview(b1)

/*
@comment
*/
var b2 = UIButton()
b2.setTitle("Click Me Too", forState:UIControlState.Normal)
b2.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
b2.setTranslatesAutoresizingMaskIntoConstraints(false)  //codeでAuto Layoutを扱う
v.addSubview(b2)

/*
@comment
*/
var views = Dictionary<String, UIView>()
views["b1"] = b1
views["b2"] = b2

v.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-8-[b1]|", options: nil, metrics: nil, views: views))

v.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[b2]-|", options: nil, metrics: nil, views: views))

v.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-80-[b1]-[b2]", options: nil, metrics: nil, views: views))

v.layoutIfNeeded()

b1.frame
b2.frame
v.frame

v