# Xcconfig Sample Project

This sample project shows how to keep all your iOS project configuration in xcconfig files instead of in the project build settings. Using xcconfig files has advantages, as any configuration can be set in a single place in a text file instead of having all the configurations mixed in with the rest of the project information in one huge not-manually-editable project file.

The main issues with xcconfig files are that the syntax and semantics are poorly, if at all, documented, and there are some gotchas to take into account. These are good reasons for this sample project to exist, as documentation of these areas and how to get around the gotchas. [The Unofficial Guide to xcconfig files](https://pewpewthespells.com/blog/xcconfig_guide.html) is good documentation for the syntax and semantics.

## Split by Environment

The original reason why I began using xcconfig files was to solve the problem of building multiple versions of the same app, each connecting to a different backend, such as development, staging, or production. The initial project was using targets for these different builds, but as the backend URL is just data, it is arguably better suited to be in configuration.

When starting a new project, two configurations are provided, Debug and Release. And this is valuable too, to be able to make both debug and release builds. That is why the sample project here splits the configurations also by this build type in addition to environment. Otherwise I haven't had a need to make further splits, so the main configurations are based on environment-build type pairs.

## File Structure

The [BuildConfiguration](BuildConfiguration) folder contains all the xcconfig files. The top level contains the files for the main configurations that are set in the project info. Subfolders are created for everything that can vary, [environment](BuildConfiguration/Environment), [build type](BuildConfiguration/BuildType), and [provisioning](BuildConfiguration/Provisioning). The [common](BuildConfiguration/Common) configurations are included in every file and contain things like compiler settings, app version, etc.

As this is a sample project, I wanted to show how to do provisioning manually. It would of course be possible to use automatic provisioning and skip completely the provisioning xcconfig files. The sample also shows how the provisioning profile is selected based on all the information, so the production release build uses the app store distribution profile whereas other release builds use the ad hoc distribution profile.

For further configuration matters, I recommend creating additional subfolders to BuildConfiguration. For instance, if there are test and production analytics settings, I would create an Analytics subfolder with Test and Production xcconfig files that would get included in the top level main configuration files as appropriate.

## CocoaPods and Combine

The sample project also uses CocoaPods because using it with an xcconfig-based configuration is a bit tricky. An xcconfig file should not be seen as a sequence of assignments but more as an all-at-once definition of a dictionary. It is not possible to build a setting piece by piece by adding to it in different xcconfig files. This is why the [Combine](BuildConfiguration/Common/Combine.xcconfig) file exists. It builds the final values of some variables from pieces that have been individually set in the other files.

The problem with CocoaPods is that it is based on xcconfig files and naturally sets the actual variables. But these values cannot be used in any way when the full configuration is in xcconfig files. This is why the [Podfile](Podfile) contains a piece of post-installation code that rewrites the relevant variables to have a PODS_ prefix, so that they can be included in the combination.

## Accessing Backend URL

The backend URL is set in each environment's xcconfig file. The [Info.plist](xcconfig-sample/Info.plist) file uses the configuration variable to include the value in the main bundle of the app. [The URL is fetched from the bundle](xcconfig-sample/PeopleViewController.swift#L44) in the app when needed.

The tricky part is in how the backend URL is entered into the xcconfig file. The sequence `//` starts a comment in xcconfig and there is no way to quote or escape this so that it would come through as `//` to the app. I have used a simple way of putting a space between the slashes in the xcconfig file and using [an extension to NSBundle](xcconfig-sample/NSBundle+UrlAccess.m) to retrieve a URL encoded in such a way.

## Copyright and Licensing

[![CC0](https://licensebuttons.net/p/zero/1.0/88x31.png)](http://creativecommons.org/publicdomain/zero/1.0/)

To the extent possible under law, Jaakko Kangasharju has waived all copyright and related or neighboring rights to Xcconfig Sample Project. This work is published from: Germany.

