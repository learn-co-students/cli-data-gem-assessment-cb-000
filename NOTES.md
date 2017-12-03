All the notes surrounding the creation of this project.

While watching the videos and other info accompanying this lesson, I chose to use the Bundler method to create
the primary architecture and framework for the app overall.  From there, I added the code necessary to bring it
to life and allow it to perform the functions necessary to get my stated results.

I went to this page: https://www.engineyard.com/blog/its-raining-gems and got some great insight on the basics.

I ran the Ruby bundler with the "bundle gem now-playing" command in Terminal.  Once it was created, I pushed it up
to GitHub. This admittedly took a while, as I'd begun this course on a Windows PC, but have since moved back to my
Mac Mini, and have been slowly relearning the commands.

Basic files included:
bin
lib
-> now-playing
spec
rspec
CODE_OF_CONDUCT
Gemfile
Gemfile.lock
license
NOTES.md
README.md
now-playing.gemspec
Rakefile
spec.md

I added to the lib/now-playing subfolder the following:
cli.rb -- This is my cli controller class
movies.rb -- This is my movies data/info scraper class/module
version.rb -- This defines my VERSION for the .gemspec file

My "Bin/now-playing" file is where I had the executable command to launch the app coded.  I referenced the "lib/now_playing" for all the code to run in the app.
