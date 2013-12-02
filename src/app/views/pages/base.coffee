AppView = require 'app/views/app-view'
Template = require 'templates/pages/base'

module.exports = class Base extends AppView

  render:( @req, done )->
    dom = Template {@req, view: @}
    @req.element.innerHTML = dom
    @set_triggers()
    @show done
    return @


  destroy:( @req, done )->
    @hide =>
      @req.element.innerHTML = ''
      @unset_triggers()
      done()


  set_triggers:->
    @wrap_links()
  
  unset_triggers:->
    @unwrap_links()


  show:( done )->
    # in animation here (mounting screen)
    done()

  hide:( done )->
    # out animation (unmounting screen)
    done()