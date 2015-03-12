# Tab Scroll Navigation Example

This is a sample project that demonstrates the use of tabs to controll scrollable, paged content.  The scrollable content also sets the current tab as the user scrolls.

  - Updates selected tab button
  - Updates Current Tab label/title
  - Animates tab line position on scroll
  - Animates to current tab when button is pressed

##Storyboard

For this project, you'll need 3 UIButtons spaced evenly across the top of the view with heights of 44.  Set the text of the tabs to Tab 1, 2, and 3. Set the selected color to something other than the default so we know when the button is selected.

Add a UIView of height 2 and set the width to match the width of the buttons.  Position it above the tab buttons in the view hierarchy.

Add a UIScrollView just below the tab buttons (which should be at 64).  Fit the width to the view and make sure the bottom edge meets the bottom of the view.

Add a UIView (our card view) to the UIScrollView.  Match the height and width and make sure it's X position is 0.  Copy this view, change the color and set it's X position to be whatever the width of your view is.  In this case, i've set my second card view width to 375.  This effectively positions the second card view just outside the viewable area.  Copy a third card and position it at double the view width. In my case, that's 750.

You should now have three card views that fit the height and width of the scrollview and are positioned side-by-side.  Once our scrolling begins, each card should take up the full ScrollView.

## Autolayout

####ScrollView
Setting the scrollview as well as the child view constraints is very important when developing for various screen sizes.  The scrollview should be the full width of the view, but a certain distance from the top of the view to allow for the tab buttons. **(Descendant Constraints are set when you actually set the constraints of the child views.  Don't worry about these at this step)**

![ScrollView Autolayout](http://i.imgur.com/cjbynSB.png "ScrollView Autolayout")

This is done by setting the Bottom, Left, and Right constraints to the main View to 0, and making sure to turn `Constraint to Margins` off.  Set the top constraint to **64**.

####Card View (content)
![Card View Autolayout](http://i.imgur.com/nAKw8nK.png "Card View Autolayout")

For the first child view, you should set the `Equal Widths` property to match the main View (not the ScrollView).  Set the `Equal Heights` constraint to match the ScrollView.  Then set the Top, Left, Right, and Bottom constraints from this view to the ScrollView to 0;

![Second Card View Autolayout](http://i.imgur.com/LDpoUoy.png "Second Card View Autolayout")

For each subsequent view/card, **first** set the X position to `n * view.width`.  Meaning, for the second card, with a view size of 375 (for iPhone 6), set the position to 375.  The third card's X position would be at 750 and so on.

Once you've positioned all of the cards, set the Top and Bottom constraints to the ScrollView to 0.  Then set the `Horizontal Spacing` constraint from the current card to the previous card.  So, in the case of the second card, set this property from the second card to the first.  Then set this property from the third card to the second and so on.  **Do not do this for the first card, as it's horizontal constraint is set to the scrollview because it is the first card**.

####Tab buttons
![Tab Button Autolayout](http://i.imgur.com/UP4LzeV.png "Tab Button Autolayout")
Set the Width and Height constraints for each tab (This should default to the width/height of the button as it is on the storyboard).   We'll adjust the width constraint in code at runtime.  Set the Left constraint from the **first** tab button to the main View.  Set the left contraints for the other two buttons to the button before it.  So, the `Tab 2` button's Left constraint should be set to the `Tab 1` button, and so on.  Lastly, set the Top constraint for all buttons to the top of the main View.
####Tab line
![Tab Line Autolayout](http://i.imgur.com/pTzphzQ.png "Tab Line Autolayout")

Set the Left and Top constraints to the main View.  Set the Width and Height constraints.  

##Outlets/Actions

Using the Ctrl-Drag method (see [Creating an Outlet Connection] in Apple's docs), create outlets for `scrollView`, `button1`,`button2`,`button3`, `line`,  and `tabLabel`.  Next, you'll need to find the `Width Equals` constraint properties for `button1`, `button2`, `button3` and `line`.  Create outlets for these using the Ctrl-Drag method called `button1WidthConstraint`, etc.

You'll also need an outline for the `Leading Space` constraint for `line` so you can set it's X position.

Lastly, using the Ctrl-Drag method, create an action called `switchTab` connected to `button1`.  Also connect that same action to `button2` and `button3`.

[Creating an Outlet Connection]:https://developer.apple.com/library/ios/recipes/xcode_help-IB_connections/chapters/CreatingOutlet.html