

class ExitsController

  def process(request)
    parking.release_lot(request.plate)
    parking.save_to_csv
    "vehicle number #{request.plate} has exited the parking!"
  end
end
