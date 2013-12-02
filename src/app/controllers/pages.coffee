AppController = require 'app/controllers/app-controller'

Page = require 'app/models/page'

Base = require 'app/views/pages/base'
Index = require 'app/views/pages/index'
NotFound = require 'app/views/pages/not-found'

module.exports = class Pages extends AppController

  # ACTIVE ACTIONS
  actives = {}

  # ACTION: base
  @base = ( req, done )=>
    # sequential steps guide:
    # 
    # AppController.show_loader ->
    #   Page.read 1, (record)->
    #     req.data = record
    #     view = new Base().render req, ->
    #       view.preload ->
    #         AppController.hide_loader ->
    #           view.in done

    req.element = @find 'body'
    actives[req.url] = new Base().render req, done

  # ACTION: index
  @index = ( req, done )=>
    req.element = @find 'container'
    actives[req.url] = new Index().render req, done

  # ACTION: notfound
  @notfound = ( req, done )=>
    req.element = @find 'container'
    actives[req.url] = new NotFound().render req, done


  # GENERAL AREA DESTROYER
  @destroy = (req, done)->
    view = actives[req.url]
    view.destroy req, done

    actives[req.url] = null
    delete actives[req.url]