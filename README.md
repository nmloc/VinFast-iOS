
## Overview Architecture
**MVVM** is cleanly separates presentation layer from the other layers. Divorcing one from the other improves its maintainability and testability. It also makes the application evolution easier in the future, thereby reducing the risk of technological obsolescence. 

Eliminates the need for application redesign user interfaces become outdated, or even add more complexity in the specific layer.
For example, adding local data source to the application could be impacts to the other layers.

Please note that every view model in this project will be named as **screen view model**, e.g. `AmityFeedScreenViewModel` and `AmityRecentChatScreenViewModel`.

<br />

## Installation
All AmityUIKit's dependencies are setup to this project. Before building framework or running sample app, please run the following command.
```
git lfs fetch
```
Then, run the following command.
```
git lfs pull
```

<br />
## Building framework manually
Amity UIKit and other build packages link:
https://drive.google.com/drive/folders/15ePuiNaznI_8ZeQkj8k7mORfwFEzIQqW?usp=sharing

## Building framework
AmityUIKit supports building xcframework which can be used on any Xcode version. Please follow this instruction for building.
1. In terminal, go to project directory
2. Run "./scripts/release-uikit.sh"
3. After building process is done, there will be `amity-uikit.zip` file

`amity-uikit.zip` contains AmityChat.xcframework, Realm.xcframework and AmityUIKit.xcframework.

<br />

## License
Public Framework. Copyright © 2022 Amity.
