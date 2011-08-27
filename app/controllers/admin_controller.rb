# coding: utf-8
class AdminController < ApplicationController
  
  def index
    @establish = Establish.all
    @chapter_s = true
    @title = '单元管理 - '
  end
  
  def chapter
    establish_id      = Establish.find(params[:id])
    @establish        = establish_id.chapter.all
    @note_s = true
    @title = '标题管理 - '
  end
  
  def note
    establish_id      = Establish.find(params[:id])    
    chapter_id = establish_id.chapter.find(params[:chapter])
    @establish = chapter_id.note.all
    @title = '文章管理 - '
  end
  
end
