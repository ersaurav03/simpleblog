class PagesController < ApplicationController
 def about
    @title = 'JSMPJ Corporation';
    @page = 'About Us'
    @content = 'This is the about Page'
 end
end
