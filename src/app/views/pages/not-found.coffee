AppView = require 'app/views/app-view'
Template = require 'templates/pages/not-found'

module.exports = class NotFound extends AppView

  render:( @req, done )->
    dom = Template {@req, view: @}
    @req.element.innerHTML = dom
    done()
    @

  destroy:( req, done )->
    @req.element.innerHTML = ''
    done()