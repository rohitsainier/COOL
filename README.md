![SAINI UTILS](https://user-images.githubusercontent.com/39442131/68613786-8c888300-04e5-11ea-8670-dfaeee7290b0.png)


# Introduction

SainiUtils is used to extend the basic functionality of UIKit elements like UIView,UIButton,UITextfield etc.

# Purpose

SainiUtils basic purpose to reduce your development time by extened the basic functionality of UIKit elements.


# Installation

SainiUtils is available through [SPM](https://github.com/apple/swift-package-manager). To install
it, simply repeat the following steps:

<img width="1530" alt="Screenshot 2022-07-17 at 3 59 38 PM" src="https://user-images.githubusercontent.com/15675290/179394191-398bfb55-518d-418a-a51a-9f359bee5e41.png">

<img width="1081" alt="Screenshot 2022-07-17 at 4 01 34 PM" src="https://user-images.githubusercontent.com/15675290/179394245-785aab21-080c-4fde-924b-14bacaf09c75.png">

<img width="1080" alt="Screenshot 2022-07-17 at 4 04 50 PM" src="https://user-images.githubusercontent.com/15675290/179394369-2f03f53f-175a-470a-b7ae-2c1eb9691961.png">

## Click on add package to install the same.

# How to Use
```swift
let demoView = UIView()
demoView.sainiFeatureName()//Just use the below given function names.

//example
let demoLabel = UILabel()
demoLabel.sainiAddTapGesture{
print("I can now click on UILabel")
demoLabel.sainiRotate()//Oh cool its rotating 
}

```

# Features

| UIView        | 
| ------------- |
| 1.)sainiCircle   | 
| 2.)sainiBlur     | 
| 3.)sainiGradientColor |
| 4.)sainiCornerRadius |
| 5.)sainiRoundCorners | 
| 6.)sainiShadow | 
| 7.)sainiShadowWithCornerRadius |
| 8.)sainiShadowWithGradientAndCornerRadius | 
| 9.)sainiGrowAndShrink | 
| 10.)sainiRotate | 
| 11.)sainiStopRotating | 
| 12.)sainiTapToChangeColor | 
| 13.)sainiScreenshot | 
| 14.)sainiAddBorderWithColor | 
| 15.)sainiDrawDashedBorderAroundView | 
| 16.)sainiFadeIn | 
| 17.)sainiFadeOut | 
| 18.)sainiFadeOutInfinite | 
| 19.)sainiFadeInInfinite | 
| 20.)sainiShowLoader | 
| 21.)sainiRemoveLoader | 
| 22.)sainiRotateByAngle | 
| 23.)sainiDashedLine | 
| 24.)sainiAddTapGesture | 
| 25.)sainiPulsate | 
| 26.)sainiFlash | 
| 27.)sainiShake | 
| 28.)sainiShowToast |  

| UITextField   | 
| ------------- |
| 29.)sainiSetLeftPadding |
| 30.)sainiSetRightPadding |
| 31.)sainiSetLeftIcon |
| 32.)sainiSetRightIcon |

| UITableView   | 
| ------------- |
| 33.)sainiSetEmptyMessage |
| 34.)restore |

| Date   | 
| ------------- |
| 35.)sianiFirstDayOfWeek |
| 36.)sainiAddWeeks |
| 37.)sainiWeeksAgo |
| 38.)sainiAddDays |
| 39.)sainiDaysAgo |
| 40.)sainiAddHours |
| 41.)sainiHoursAgo |
| 42.)sainiAddMinutes |
| 43.)sainiMinutesAgo |
| 44.)sainiStartOfDay |
| 45.)sainiEndOfDay |
| 46.)sainiZeroBasedDayOfWeek |
| 47.)sainiHoursFrom |
| 48.)sainiDaysBetween |
| 49.)sainiPercentageOfDay |
| 50.)sainiNumberOfWeeksInMonth |
| 51.)sainiFormattedDateString |



# Some handy Functions
## sainiColorFromHex
```swift
let demoLbl = UILabel()
demoLbl.textColor = sainiColorFromHex(hex: "#687f9")
```
## sainiCompressImage
```swift
 //Image Compression to 10th of original size
 let image = sainiCompressImage(image: UIImage(named: "someImage"))
```

## sainiSignatureView
```swift

 //Assign sainiSignatureView to any UIView class and it will behave as an signatureView 
 
```

## sainiCardView
```swift

 //Assign sainiCardView to any UIView class and it will behave as an CardView 
 
```
## sainiTimesAgo
```swift

 let timeAgoStr = sainiTimesAgo(78789877387)
      print(timeAgoStr)
      //2 Min ago
 
```



# Author

rohitsainier, rohitsainier@gmail.com

# License

SainiUtils is available under the MIT license. See the LICENSE file for more info.

