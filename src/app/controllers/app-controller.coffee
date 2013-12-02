module.exports = class AppController

  @find = (sel)->
    if sel is 'body'
      return document.getElementsByTagName(sel)[0]
    document.getElementById sel

  @show_loader:( done )->
    # logic here
    done()

  @hide_loader:( done )->
    # logic here
    done()