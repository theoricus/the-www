module.exports = class AppView

  req: null


  load:( done )->
    # load logic here
    done()


  # shortcuts for automatically set/remove click triggers
  wrap_links:->
    if window.addEventListener
      @req.element.addEventListener 'click', _on_click, false
    else
      @req.element.attachEvent 'onclick', _on_click, false

  unwrap_links:->
    if window.addEventListener
      @req.element.removeEventListener 'click', _on_click
    else
      @req.element.removeEvent 'onclick', _on_click


  # general on click
  _on_click = (event)->
    event = event or window.event
    target = event.target or event.srcElement

    if target?.nodeName is 'A' and target.href?

      # do nothing with external links
      origin = history.location.origin
      if target.href.indexOf(origin) < 0
        return

      # this require is done here
      # so we avoid circular-dependency
      app = require 'app/app'
      app.push target.href.replace origin, ''

      # canceling default click actions
      if event.preventDefault?
        event.preventDefault()
      else
        event.returnValue = off