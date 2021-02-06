A Better Flutter Menu
=====================

*A dynamic and more adaptive popup menu*

I hate Flutter's popup menu. It's ugly. It's a block of white in the corner of the screen. Does it have to be just a square like that slapped on top of the AppBar? It doesn't look good. It looks amateurish. Why can't it look more like the menu in the screenshot below on the right-hand side? That's a little better.

![Image for post](https://miro.medium.com/max/3480/1*t2VoG8wmjrlbTNDvotRwJg.png)

The Clutter of Flutter
======================

Another thing I don't like about Flutter's popup menus is the clutter. I hate the 'Flutter clutter!' You know what I mean. I suspect you too when first introduced to Flutter, had to get used to reading those long vertical lists of parameters.

Many widgets have these long lists of parameters, and the widget, *PopupMenuBotton*, is no exception. It lists its menu items, of course, but it also lists the settings on how the menu should appear, and what's worse, it can list its anonymous functions as well --- making it even longer. I mean it's a popup menu?! You don't even see the thing until you tap on those three little dots in the corner of the screen?! Yet its code can take up half the State object. See below. No sir! I don't like it.

![Image for post](https://miro.medium.com/max/4800/1*T1EQ8xbzKPs4YuwQjtOJAA.png)

![Image for post](https://miro.medium.com/max/1815/1*G_Z8hRWCJtbibMIfs2zzww.png)

So, you know what I did? Guess what I did. I wrote a class library and made the popup menu better. That's what I did. Wanna take a look? Let's take a look.

Let's begin.
![Image for post](https://miro.medium.com/max/1698/1*o6llr99wk64sNXp1H1qWhA.png)
(https://andrious.medium.com/my-medium-9de112c2d85c)

[Other Stories by Greg Perry](https://andrious.medium.com/my-medium-9de112c2d85c)

This is the [example app](https://github.com/Andrious/app_popup_menu), we'll be using today. In the screenshot below on the left-hand, you see the AppBar widget list a PopupMenuButton widget in the parameter, *actions*. In fact, you see there are three PopupMenuButton widgets! There are three of them, and yet they're not taking up half the code in the State class. Of course, that's because they're being defined in other classes. That's one improvement right there! Cleans up the code a little bit.

There's no 'Flutter clutter' to distract the developer from the 'main screen' that's to be displayed in that State object. True, there may be important operations involved when selecting that menu popup, but you do have the means to supply information to those classes from the app (*i.e. InheritedWidget*). The code below is a little more modular. It's better than having a menu definition taking up so much room --- activated only behind those three little dots. I'm just sayin'. I'll explain further.
![Image for post](https://miro.medium.com/max/4790/1*wqWAmmv5X7VnF8tlBJtpug.png)
![Image for post](https://miro.medium.com/max/1710/1*roLhU-zJnBVCMWBalLggXQ.png)

[main.dart](https://github.com/Andrious/app_popup_menu/blob/68fbc0d562a44a143670e686c6c1ddeb1e396805/example/lib/main.dart#L25)

The Popup Class
===============

Indeed, the three popup menus are conceived in three separate classes. These three classes are listed below. As you see, all three extend the class, *AppPopupMenu*. In closer inspection, you can see each class has its own approach utilizing many options --- you know I like options.

Looking at that third screenshot below, we see it simply 'passes on' to its parent class any and all parameter values assigned to the class, *HereIsAnotherMenu*. It even passes along the generic type, *T*, to the parent class. No doubt, this corresponds to the generic type supplied to the PopupMenuButton widget --- it's the data type of the value returned when a menu item is selected.
![Image for post](https://miro.medium.com/max/4820/1*k1eFlsiliZGRYL0tnNiQlQ.png)

](https://github.com/flutter/flutter/blob/13860a7d23c564ec9ff38a44661d21160c3f7b1e/packages/flutter/lib/src/material/popup_menu.dart#L960)

[popup_menu.dart](https://github.com/flutter/flutter/blob/13860a7d23c564ec9ff38a44661d21160c3f7b1e/packages/flutter/lib/src/material/popup_menu.dart#L960)
![Image for post](https://miro.medium.com/max/3930/1*zf_fq2TjmTNsT_VuEd5KcA.png)
![Image for post](https://miro.medium.com/max/3920/1*M190pKC_gs5OBwvKrj5zUg.png)

(https://github.com/Andrious/app_popup_menu/blob/68fbc0d562a44a143670e686c6c1ddeb1e396805/example/lib/this_is_another_menu.dart#L13)

![Image for post](https://miro.medium.com/max/3690/1*ithtUGdDGURjFQQ8qVYYhA.png)

(https://github.com/Andrious/app_popup_menu/blob/68fbc0d562a44a143670e686c6c1ddeb1e396805/example/lib/here_is_another_menu.dart#L7)

[this_is_one_menu.dart](https://github.com/Andrious/app_popup_menu/blob/68fbc0d562a44a143670e686c6c1ddeb1e396805/example/lib/this_is_one_menu.dart#L13) and [this_is_another_menu.dart](https://github.com/Andrious/app_popup_menu/blob/68fbc0d562a44a143670e686c6c1ddeb1e396805/example/lib/this_is_another_menu.dart#L13) and [here_is_another_menu.dart](https://github.com/Andrious/app_popup_menu/blob/68fbc0d562a44a143670e686c6c1ddeb1e396805/example/lib/here_is_another_menu.dart#L7)

As for the first two classes, they're defining their popup menus right then and there in their class definitions. Look now at the second class. It too has a constructor but merely passes along the Key object to the parent class. It does, however, define the menu options for its popup menu right inside itself. You can see an integer value is to be passed along when a menu item is selected. Hence, the parent class has the integer data type, *int*, between its brackets.

We can see what happens when a menu item is selected as well. The 'onSelection' function defined above takes in the integer value and obviously involves an InheritedWidget to pass that value back up the widget tree. Further, it invokes the SnackBar widget to display the chosen value. All nice and concise in there.

Obviously, this means you can override some getters and functions to define the pop menu's appearance and functionality away from the AppBar parameter, *actions*. Nice and clean. Modular.

Let's finally take a look at the first screenshot above. I've listed the first one again below. You'll notice it has no constructor at all but does define an initial value to be selected when the popup menu opens. It's the value, 'Option 3.' Hence, the generic type specified to the parent class is of type String. Further, this first popup menu class overrides both the getter, *items*, and the getter, *menuItems*.

Now, unlike most of the class library's fields and functions, neither one of these two getters corresponds to a named parameter found in the widget, *PopupMenuButton*. By design, both are merely provided to make life a little easier for the developer. If the menu items are going to be just a list of Strings, the getter, *items*, can be used. If those menu options are going to be a little more complex, the getter, *menuItems*, allows for a list of widgets instead --- the developer can create a list of *PopupMenuItem *objects. Note, if you implement both, the getter, *items*, takes precedence, and the parameter, *menuItems*, is simply ignored. Of course, you can supersede both of them with the parameter, *ItemBuilder*. Itcorresponds to the very same parameter found in the PopupMenuButton class. You have options. Love options.
![Image for post](https://miro.medium.com/max/3930/1*zf_fq2TjmTNsT_VuEd5KcA.png)

![Image for post](https://miro.medium.com/max/4790/1*m_ZXDJxkZzXxsQzwrsE_fg.png)

![Image for post](https://miro.medium.com/max/1825/1*jnCs1Uw5kxJNyY7k8KTkhw.gif)

[this_is_one_menu.dart](https://github.com/Andrious/app_popup_menu/blob/68fbc0d562a44a143670e686c6c1ddeb1e396805/example/lib/this_is_one_menu.dart#L13) and [main.dart](https://github.com/Andrious/app_popup_menu/blob/68fbc0d562a44a143670e686c6c1ddeb1e396805/example/lib/main.dart#L25)

Have You Got Options!
=====================

Take a look at the second screenshot above. It's again the State object of our simple example app that defines the AppBar and popup menu. Please, note the little red arrows. The arrows at the top are pointing, of course, at the constructors of those three popup menu classes --- pointing to where those classes are being instantiated. This implies you have the ability to instantiate your app's menu popup anywhere you want. They can be defined in one place and utilized in another. You may not need this ability now, but believe me, you may one day.

As you know, the third class has a whole slew of parameters where you can assign values. However, with the class library, you have other places as well. You have other options. See the buttonMenu() functions also highlighted above? You can see the third class is specifying options right in the buttonMenu() function itself as well! That's another place for the developer to set up their popup menu.

The second class, with its buttonMenu() function, could have done the same thing. Essentially, you could have the same options assigned both at the constructor and finally at the buttonMenu() function where the popup menu is displayed. Note, however, any options you specify in the buttonMenu() take precedence over any values you may have specified in the constructor --- or in the menu object's separate field properties. That's right. You heard me. Look at the third screenshot below. It's listing all the field properties for that class library --- many of them mirror the PopupMenuButton's named parameters, and the 'nonfinal' ones can be readily assigned new values.

![Image for post](https://miro.medium.com/max/2735/1*joWCsHZpVyPRa7WoV3N3IA.png)

(https://github.com/Andrious/app_popup_menu/blob/68fbc0d562a44a143670e686c6c1ddeb1e396805/lib/app_popup_menu.dart#L53)

![Image for post](https://miro.medium.com/max/2735/1*w7E52ElZvCccP5vg6n2yzQ.png)

(https://github.com/Andrious/app_popup_menu/blob/68fbc0d562a44a143670e686c6c1ddeb1e396805/lib/app_popup_menu.dart#L183)

![Image for post](https://miro.medium.com/max/3008/1*miPd0gdD1cXQDTxQLtppcg.png)

(https://github.com/Andrious/app_popup_menu/blob/68fbc0d562a44a143670e686c6c1ddeb1e396805/lib/app_popup_menu.dart#L75)

[app_popup_menu.dart](https://github.com/Andrious/app_popup_menu/blob/68fbc0d562a44a143670e686c6c1ddeb1e396805/lib/app_popup_menu.dart#L53) and [app_popup_menu.dart](https://github.com/Andrious/app_popup_menu/blob/68fbc0d562a44a143670e686c6c1ddeb1e396805/lib/app_popup_menu.dart#L183) and [app_popup.menu.dart](https://github.com/Andrious/app_popup_menu/blob/68fbc0d562a44a143670e686c6c1ddeb1e396805/lib/app_popup_menu.dart#L75)

What's On The Menu?
===================

As an example of this field property assignment, look at the initState() below. Additional settings have been defined to match what's displayed in the sample app when it finally runs. The arrows highlight where the field properties of the menu object are being directly assigned values! Again, just more options for the developer.

Why would you need this ability? Believe me, there will be times in your apps where you want your popup menus to be more dynamic and adaptive. Depending on the circumstances, in the next scheduled frame, you may want your popup menu to be displayed differently --- with different menu items for example. Always defining the popup menu option in one place and at one point in time can be limiting. Here, you're able to define aspects of the menu now, and then the rest of the menu after a particular circumstance has been determined. It will happen. You then can vary it at will --- making the thing more useful in my opinion.
![Image for post](https://miro.medium.com/max/4793/1*OYF65tecEOK2gKHJlY0OhA.png)

(https://github.com/Andrious/app_popup_menu/blob/68fbc0d562a44a143670e686c6c1ddeb1e396805/example/lib/main.dart#L33)

[main.dart](https://github.com/Andrious/app_popup_menu/blob/68fbc0d562a44a143670e686c6c1ddeb1e396805/example/lib/main.dart#L33)

How About A SnackBar?
=====================

Looking at the sample app running below, you can see the SnackBar is used again and again when a menu item is selected. Now, you'd think you'd get the ol' error message: "*No Scaffold ancestor could be found starting from the context that was passed to*". I mean, looking at the build() function below, the supplied context, of course, doesn't 'contain' a reference to the Scaffold.

The Scaffold is just being defined now in that build() function --- and yet a SnackBar works seemingly without reference to the Scaffold's State object, *ScaffoldState*?? Without the reference, the only other way would be to use a GlobalKey, and I hate using GlobalKeys. They're expensive and inefficient --- but that's for another story.

![Image for post](https://miro.medium.com/max/3560/1*xo0D_h8g3IaEAeYHKBaoVQ.png)

(https://github.com/Andrious/app_popup_menu/blob/68fbc0d562a44a143670e686c6c1ddeb1e396805/example/lib/main.dart#L48)

![Image for post](https://miro.medium.com/max/1920/1*E7ytw8akeM1tSz4Qz-6neg.gif)

[main.dart](https://github.com/Andrious/app_popup_menu/blob/68fbc0d562a44a143670e686c6c1ddeb1e396805/example/lib/main.dart#L48)

So how does the SnackBar work?? It works because the class library is indeed given a context object that can find the Scaffold widget --- the very Scaffold widget in the screenshot above! That's because, in this library class, the returned PopupMenuButton object is wrapped in a Builder widget, and, as you may know, using a Builder widget is a common fix to that error --- serving as the 'middle man' in providing a reference to the Scaffold widget. You're then free to use the SnackBar widget if you want!

![Image for post](https://miro.medium.com/max/4785/1*EqQ8-2jrxE3Xt02unq7ZbA.png)

(https://github.com/Andrious/app_popup_menu/blob/68fbc0d562a44a143670e686c6c1ddeb1e396805/lib/app_popup_menu.dart#L202)

[app_popup_menu.dart](https://github.com/Andrious/app_popup_menu/blob/68fbc0d562a44a143670e686c6c1ddeb1e396805/lib/app_popup_menu.dart#L202)

There's A Function For That
===========================

Looking at the screenshot above, you've no doubt noted the many 'if null' operators used to finally supply parameter values to the widget, *PopupMenuButton*. See all the functions listed at the end of every parameter entry? Their names all begin with 'on.' You've been introduced to one of them already: The 'onSelection' function defined above taking in the integer value. They are the 'last line of defense' when it comes to supplying valid parameter values to the PopupMenuButton widget.

Again, I like to encourage modular programming in my code. All the code that makes up the popup menu can readily be encapsulated into one class like the classes demonstrated today. In fact, I need not supply a constructor or any parameters in the subclass itself. Conceivably such a 'popup menu class' could all be all self-contained and just be made up of a bunch of overridden functions. See below. See how the popup menu is then just one little getter? Nice and neat.
![Image for post](https://miro.medium.com/max/4820/1*cvlxpmwU_NSXbwzT2Z75jA.png)

As for the functions, they're simply every parameter available to the widget, *PopMenuButton*. This allows you to get rather creative in how you conceive each and every parameter value. Maybe the value depends on some 'far off' aspect of your app not readily associated with your popup menu. Maybe it involves reading a file, accessing a website, updating a database. I don't know! It's your app! Regardless, you now have options. Love options.

![Image for post](https://miro.medium.com/max/3930/1*nZ4Uxriv8VQOSi2yGOnFKw.png)

(https://github.com/Andrious/app_popup_menu/blob/68fbc0d562a44a143670e686c6c1ddeb1e396805/lib/app_popup_menu.dart#L127)

[app_popup_menu.dart](https://github.com/Andrious/app_popup_menu/blob/68fbc0d562a44a143670e686c6c1ddeb1e396805/lib/app_popup_menu.dart#L127)

There. Done. Take a copy of the class library and make it your own. Improve it, and then share it. That's what the Flutter community's all about, right? If anything, take a look at how an InheritedWidget is utilized in the example app. It's providing data down the widget tree and then supply new data back up the tree. The data accessed is the value associated with the selected menu item.

I find many developers are not implementing InheritedWidget quite right. In this app example, data is displayed in the middle of the screen, but not before the InheritedWidget is first accessed. Further, the InheritedWidget initiates a rebuild, but only rebuilding one particular StatelessWidget, *MenuOption.* It's the one lone widget responsible for displaying the selected menu option in the middle of the screen, and it's much more efficient to just rebuild that widget and not the whole widget tree. However, I'm seeing many InheritedWidgets improperly implemented and are just rebuilding the entire widget tree. It doesn't look good. It's ugly. No, sir! I don't like it!

Cheers.

[→ Other Stories by Greg Perry](https://andrious.medium.com/my-medium-9de112c2d85c)

![Image for post](https://miro.medium.com/max/853/0*o8tD8wEGPJCFWjtW.png)

(https://www.youtube.com/channel/UCRrXfoeIX-vpGTc89PDltOA)

[DECODE Flutter on YouTube](https://www.youtube.com/channel/UCRrXfoeIX-vpGTc89PDltOA)

