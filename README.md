# pusheen gifs

A repo to house and share pusheen gifs I pulled from giphy.com and then curated
down to a collection of easily uploadable emojis.


# pulling emojis from giphy.com

I used the provided `scrape.py` scrip to pull the initial batch and then
manually curated things down to what you see here. You can install the
dependencies from `requirements.txt`


# adding more pusheen emoji

Feel free to put up a pull request with adjustments to the current set of
pusheen emoji's as I'll take almost any reasonable update/change


# uploading to slack

To upload to slack I used a script that splits the original gif into its various
frames where we then make the background transparent and resize to 128x128 for
slack and stitch things back together into a new "slackable" gif. I used
[imagemagick](https://www.imagemagick.org/script/index.php) to do the gif
creation and then and then used [slack-emojinator](https://github.com/smashwilson/slack-emojinator)
to upload them to slack.
