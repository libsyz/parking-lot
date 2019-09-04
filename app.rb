

class App
  def initialize(router)
    @router = router
  end

  def run
    @router.welcome
    @router.start
  end
end
