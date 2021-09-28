# ChallengeiOS

Home Exercise - iOS
We would like you to write a simple iOS app so we can get a first impression of your work.
Description
When an end-customer pays, our frontend software presents a list of payment methods like Visa, SEPA and PayPal. Our frontend software loads this list of payment methods using a token-based list URL.
We would like you to write a small app that loads this JSON list and presents the payment methods in a scrolling list in your app.
List URL
You can use the following URL to load the payment methods using a GET request in your app.
https://raw.githubusercontent.com/optile/checkout-android/develop/shared-test/lists/listresult.json


Look & Feel
We would like to see at least the logo image and label for each payment network in the list. Of course you can decide how you want to represent the data.


GitHub & Technologies
The sources of the app should be available to us through a public repository on GitHub.
The app must be written in Swift and UIKit without third-party libraries. 

Focus points
Here are a couple of points you could focus on:
Network errors should be handled properly, e.g. 404, 500 response codes and connection failures. You could show a popup dialog or log the error.
Decent looking UI and UX but given the limited time we know this is not always possible.
Unit tests, we can also write a couple during the pair programming session if there is no time left. Even for a small app with limited functionality we like it if it feels like a finished product.
