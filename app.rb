# frozen_string_literal: true
# Bundles the router and initializes the app

class App
  def initialize(router)
    @router = router
  end

  def run
    @router.welcome
    @router.start
  end
end
