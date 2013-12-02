Router = require 'ways'

# polvo:if ENV=node
RouterMiddleware = require 'ways-node'
# polvo:else
RouterMiddleware = require 'ways-browser'
# polvo:fi

Pages = require 'app/controllers/pages'

exports.router = router = new Router 'destroy+render'

router.get '/base', Pages.base, Pages.destroy
router.get '/', Pages.index, Pages.destroy, '/base'
router.get '*', Pages.notfound, Pages.destroy, '/base'

router.use RouterMiddleware
router.push router.pathname()

module.exports = router